locals {
  packages = [
    "apt-transport-https",
    "build-essential",
    "ca-certificates",
    "curl",
    "docker.io",
    "jq",
    "kubeadm",
    "kubelet",
    "lsb-release",
    "make",
    "prometheus-node-exporter",
    "python3-pip",
    "software-properties-common",
    "tmux",
    "tree",
    "unzip",
  ]
}

data "cloudinit_config" "_" {
  for_each = local.nodes

  part {
    filename     = "cloud-config.cfg"
    content_type = "text/cloud-config"
    content      = <<-EOF
      hostname: ${each.value.node_name}
      package_update: true
      package_upgrade: false
      packages:
      ${yamlencode(local.packages)}
      apt:
        sources:
          kubernetes.list:
            source: "deb https://apt.kubernetes.io/ kubernetes-xenial main"
            key: |
              ${indent(8, data.http.apt_repo_key.body)}
      users:
      - default
      - name: k8s
        primary_group: k8s
        groups: docker
        home: /home/k8s
        shell: /bin/bash
        sudo: ALL=(ALL) NOPASSWD:ALL
        ssh_authorized_keys:
        - ${tls_private_key.ssh.public_key_openssh}
      EOF
  }

  # By default, all inbound traffic is blocked
  # (except SSH) so we need to change that.
  part {
    filename     = "allow-inbound-traffic.sh"
    content_type = "text/x-shellscript"
    content      = <<-EOF
      #!/bin/sh
      sed -i "s/-A INPUT -j REJECT --reject-with icmp-host-prohibited//" /etc/iptables/rules.v4 
      netfilter-persistent start
    EOF
  }

}

data "http" "apt_repo_key" {
  url = "https://packages.cloud.google.com/apt/doc/apt-key.gpg.asc"
}

# The kubeadm token must follow a specific format:
# - 6 letters/numbers
# - a dot
# - 16 letters/numbers

resource "random_string" "token1" {
  length  = 6
  number  = true
  lower   = true
  special = false
  upper   = false
}

resource "random_string" "token2" {
  length  = 16
  number  = true
  lower   = true
  special = false
  upper   = false
}

locals {
  kubeadm_token = format(
    "%s.%s",
    random_string.token1.result,
    random_string.token2.result
  )
}
