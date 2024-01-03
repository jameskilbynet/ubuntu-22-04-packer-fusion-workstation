source "vmware-iso" "jammy-daily" {
  // Docs: https://www.packer.io/plugins/builders/vmware/iso

  // VM Info:
  vm_name       = "jammy-2024-01-03"
  guest_os_type = "ubuntu-64"
  version       = "16"
  headless      = false
  // Virtual Hardware Specs
  memory        = 8172
  cpus          = 2
  cores         = 2
  disk_size     = 81920
  sound         = true
  disk_type_id  = 0
  
  // ISO Details
  iso_urls =[
          "file:/Users/jkilby/Downloads/jammy-live-server-amd64.iso",
          "https://cdimage.ubuntu.com/ubuntu-server/jammy/daily-live/current/jammy-live-server-amd64.iso"]
  iso_checksum = "sha256:0af79e78cfdf3caf61d32adcf738de0a63c53a30abdc76c8d90bb36d9c22cb05"
  iso_target_path   = "/Users/jkilby/Downloads"
  output_directory  = "/Users/jkilby/Downloads/Ubuntu-22.04-Build"
  snapshot_name     = "clean"  
  http_directory    = "http"
  ssh_username      = "vmadmin"
  ssh_password      = "MyP@ssw0rd-22!"
  shutdown_command  = "sudo shutdown -P now"

  boot_wait = "5s"
  boot_command = [
    "c<wait>",
    "linux /casper/vmlinuz --- autoinstall ds=\"nocloud-net;seedfrom=http://{{.HTTPIP}}:{{.HTTPPort}}/\"",
    "<enter><wait>",
    "initrd /casper/initrd",
    "<enter><wait>",
    "boot",
    "<enter>"
  ]
}

build {
  sources = ["sources.vmware-iso.jammy-daily"]
}
