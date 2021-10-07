# **GCP VPN HA Terraform** #

Deploy in Google Cloud (one or more) VMs with none, one or more data disks using HashiCorp Terraform

## The code deploys ##

* Internal Address (you can specify an IP)
* External Address (with decision to use or not)
* Boot Disk
* Data Disks (with decidion: none, one or more)
* Atacched Disk (how many you need according data disks)
* Google Compute Instance (how many you need)

## **Requirements** ##

Describes requirements for using this module.

### Software ###

The following dependencies must be available:

* [Terraform](https://www.terraform.io/downloads.html)>= v0.13.5.
* [Terraform google provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)>= v3.87.0.
* [Terraform google-beta provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)>= v3.87.0.

### Service Account ###

* Ensure the you have a [service account](https://cloud.google.com/iam/docs/creating-managing-service-accounts) with [permissions](https://cloud.google.com/iam/docs/understanding-roles#compute-engine-roles) and [roles/compute.networkAdmin](https://cloud.google.com/iam/docs/understanding-roles#compute-engine-roles)

## **Simple Usage** ##

1. Clone the repository:

    ```bash
    git clone https://github.com/taynantofanini/terraform-gcp-multiples-vms-and-data-disks.git
    ```

2. Go to module folder

    ```bash
    cd terraform-gcp-multiples-vms-and-data-disks
    ```

3. Change variable values in **terraform.tfvars** and backend path in **settings.tf** for your envrionment.

4. Run the following Terraform commands:

    1. Examine configuration files:

        ```bash
        terraform init
        terraform validate
        terraform plan
        ```

    2. Apply the configurations:

        ```bash
        terraform apply
        ```

    3. Confirm configurations:

        ```bash
        terraform output
        terraform show
        ```

    4. To destroy resources:

        ```bash
        terraform plan -destroy
        terraform destroy
        terraform show
        ```

## Required Variables ##

```hcl
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
```

## **Author** ##

* Taynan Tofanini <taynantofanini@gmail.com>
* <https://github.com/taynantofanini/terraform-gcp-multiples-vms-and-data-disks>
