# vm.tf
data "xenorchestra_pool" "pool" {
  name_label = "mini-xcp"
}

data "xenorchestra_template" "debian_trixie_template" {
  name_label = "debian-trixie-gssn_nfs"
}

data "xenorchestra_sr" "local-moo-sr" {
  name_label = "Local storage moo"
  pool_id = data.xenorchestra_pool.pool.id
}
data "xenorchestra_sr" "local-eenie-sr" {
  name_label = "Local storage eenie"
  pool_id = data.xenorchestra_pool.pool.id
}
data "xenorchestra_sr" "local-mini-sr" {
  name_label = "Local storage mini"
  pool_id = data.xenorchestra_pool.pool.id
}
data "xenorchestra_sr" "nfs-marvin-sr" {
  name_label = "NFS Storage marvin"
  pool_id = data.xenorchestra_pool.pool.id
}
data "xenorchestra_sr" "iscsi-marvin-sr" {
  name_label = "ISCSI Storage marvin"
  pool_id = data.xenorchestra_pool.pool.id
}
data "xenorchestra_network" "network" {
  name_label = "Pool-wide network associated with eth0"
  pool_id = data.xenorchestra_pool.pool.id
}

resource "xenorchestra_vm" "sandbox" {
  memory_max = 2147467264
  cpus = 2
  name_label = "new_vm"
  template = data.xenorchestra_template.debian_trixie_template.id
  hvm_boot_firmware = "uefi"

  network {
    network_id = data.xenorchestra_network.network.id
  }

  disk {
    sr_id = data.xenorchestra_sr.local-eenie-sr.id
    name_label = "new_vm-sr"
    size = 16106127360
  }
}