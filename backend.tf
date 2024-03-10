terraform {
  cloud {
    organization = "AdvancedTerraform" # CHANGE TO YOUR ORG NAME
    hostname = "app.terraform.io" # Optional; defaults to app.terraform.io

    workspaces {
      name = "advanced-terraform-416413"
    }
  }
}

# LOCAL
# terraform {
#   backend "gcs" {
#     prefix  = "terraform/state"
#   }
# }