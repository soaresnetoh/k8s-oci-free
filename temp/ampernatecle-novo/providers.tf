// terraform {
//   required_providers {
//     oci = {
//       source  = "hashicorp/oci"
//       version = "4.62.0"
//     }
//   }
// }


terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
      version = "4.71.0"
    }
  }
}

// provider "oci" {
//   # Configuration options
// }