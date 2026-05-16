locals {
    # template = file("init.cfg")
    cloud_config_content = templatefile("${path.module}/init.cfg", {})
  
}

data "template_cloudinit_config" "install-apache-config" {
    gzip = false
    base64_encode = false
  
    part {
      content_type = "init.cfg"
      filename = "text/cloud-config"
      content = local.cloud_config_content
    }
  
}