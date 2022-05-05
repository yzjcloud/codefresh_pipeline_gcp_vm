terraform {
    backend "gcs" {
        credentials = "/codefresh/volume/account.json"
        bucket = "yzjcloud-terraform-state"
        prefix = "gce_test1"
        # rename prefix

    }

    required_providers {
        google = {
        source = "hashicorp/google"
        version = "4.19.0"
        }
    }
}

provider "google" {
    project = "terraform-348401"
    region = "us-central1"
    zone = "us-central1-a"
    # credentials = "terraform-key.json"
}
