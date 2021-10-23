variable "vm_name" {

}
variable "machine_type" {

}
variable "region" {

}
variable "zone" {

}
variable "disk_image" {

}
variable "disk_type" {

}
variable "disk_size" {

}
variable "network" {

}
variable "subnetwork" {

}
variable "vm_internal_ip" {
  default = null
}
variable "vm_external_ip_enabeled" {
  default = null
}
variable "data_disks" {
  type = map(object({
    data_disk_type = string
    data_disk_size = string
  }))
  default = null
}
