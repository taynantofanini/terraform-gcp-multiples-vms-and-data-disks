resource "google_compute_instance" "vm" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    device_name = "${var.vm_name}-boot-disk"
    source      = google_compute_disk.boot-disk.self_link
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    network_ip = google_compute_address.internal-ip.address

    dynamic "access_config" {
      for_each = var.vm_external_ip_enabeled == "yes" ? google_compute_address.external-ip : []
      content {
        nat_ip = google_compute_address.external-ip[0].address
      }
    }
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }

  labels = {
    vm        = var.vm_name
    managedby = "terraform"
  }

}

resource "google_compute_address" "internal-ip" {
  name         = "${var.vm_name}-internal-ip"
  address_type = "INTERNAL"
  region       = var.region
  subnetwork   = var.subnetwork
  address      = var.vm_internal_ip #optional
}

resource "google_compute_address" "external-ip" {
  count = var.vm_external_ip_enabeled == "yes" ? 1 : 0

  address_type = "EXTERNAL"
  name         = "${var.vm_name}-external-ip"
  region       = var.region
}

resource "google_compute_disk" "boot-disk" {
  name  = "${var.vm_name}-boot-disk"
  image = var.disk_image
  size  = var.disk_size
  type  = var.disk_type
  zone  = var.zone
  labels = {
    vm        = var.vm_name
    managedby = "terraform"
  }
}

resource "google_compute_disk" "data-disk" {
  for_each = var.data_disks == null ? {} : var.data_disks

  name = "${var.vm_name}-${each.key}"
  type = each.value.data_disk_type
  zone = var.zone
  size = each.value.data_disk_size
  labels = {
    vm        = var.vm_name
    managedby = "terraform"
  }
}

resource "google_compute_attached_disk" "attach_data_disk" {
  for_each = var.data_disks == null ? {} : var.data_disks

  device_name = "${var.vm_name}-${each.key}"
  disk        = google_compute_disk.data-disk[each.key].self_link
  instance    = google_compute_instance.vm.self_link
}
