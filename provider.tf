# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.61.0"
    }
  }

  # --- Remote backend: Azure Storage ---
  # Option A (Inline config - okay for PoC; avoid committing secrets):
  backend "azurerm" {
    resource_group_name  = "github-actions"          # change to your RG
    storage_account_name = "githubremotebackend"   # must be globally unique
    container_name       = "test-container"             # blob container
    key                  = "terraforms.tfstate"
    # (Optional) use a state lock table for concurrency protection if using Cosmos DB-based locks or rely on blob leases.
    # (Optional) use 'subscription_id' here if your state RG is in a different subscription
  }
}
