terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.1.0"
    }
  }

  # ==============================================================================
  # Remote Backend (Azure Storage Account) - Future use ke liye ready hai
  # Jab remote state use karni ho, tab neeche diye gaye block ko uncomment karein:
  # ==============================================================================
  # backend "azurerm" {
  #   resource_group_name  = "rg-terraform-state"
  #   storage_account_name = "sttfstateprod01"
  #   container_name       = "tfstate"
  #   key                  = "terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
}
