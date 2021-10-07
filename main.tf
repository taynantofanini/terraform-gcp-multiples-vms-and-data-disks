module "vm" {
  for_each                = var.allvms
  source                  = "./child-module"
  vm_name                 = each.value.vm_name
  machine_type            = each.value.machine_type
  region                  = each.value.region
  zone                    = each.value.zone
  disk_image              = each.value.disk_image
  disk_type               = each.value.disk_type
  disk_size               = each.value.disk_size
  network                 = each.value.network
  subnetwork              = each.value.subnetwork
  vm_internal_ip          = each.value.vm_internal_ip
  vm_external_ip_enabeled = each.value.vm_external_ip_enabeled
  data_disks              = each.value.data_disks
}