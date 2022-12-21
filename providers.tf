terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "4.102.0"
      # version = "4.62.0"
    }
  }
}

provider "oci" {
  region              = "us-phoenix-1"
  auth                = "SecurityToken"
  config_file_profile = "soaresnetoh"
}
