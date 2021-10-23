gcp_auth_file = "auth/authfile.json" # put your auth file name
project_id    = "your-project-id"

allvms = {

  "vm1" = {

    vm_name                 = "vm-name-1"
    machine_type            = "n1-standard-1"
    region                  = "us-east1"
    zone                    = "us-east1-c"
    disk_image              = "ubuntu-os-cloud/ubuntu-1804-lts"
    disk_type               = "pd-standard"
    disk_size               = "10"
    network                 = "default"
    subnetwork              = "default"
    vm_internal_ip          = null  # set a internal ip or null
    vm_external_ip_enabeled = "yes" # yes to create external ip or no

    data_disks = { # how many you want, duplicating the block "data-disk"

      "data-disk-1" = {
        data_disk_type = "pd-standard"
        data_disk_size = "10"
      }

      # "data-disk-2" = {
      #   data_disk_type = "pd-standard"
      #   data_disk_size = "20"
      # }

    }

  }

  "vm2" = {

    vm_name                 = "vm-name-2"
    machine_type            = "n1-standard-1"
    region                  = "us-east1"
    zone                    = "us-east1-c"
    disk_image              = "ubuntu-os-cloud/ubuntu-1804-lts"
    disk_type               = "pd-standard"
    disk_size               = "10"
    network                 = "default"
    subnetwork              = "default"
    vm_internal_ip          = null
    vm_external_ip_enabeled = "no"

    data_disks = {

      "data-disk-1" = {
        data_disk_type = "pd-standard"
        data_disk_size = "10"
      }

      "data-disk-2" = {
        data_disk_type = "pd-standard"
        data_disk_size = "20"
      }

      "data-disk-3" = {
        data_disk_type = "pd-standard"
        data_disk_size = "25"
      }

    }

  }

}
