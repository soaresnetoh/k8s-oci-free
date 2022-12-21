terraform {
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "4.62.0"
    }
  }
}

provider "oci" {
  region              = "us-phoenix-1"
  auth                = "SecurityToken"
  config_file_profile = "soaresnetoh"
}
