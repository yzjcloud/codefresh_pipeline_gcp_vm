resource "google_compute_instance" "vm1" {
    name = "vm-from-tf"
    zone = "us-central1-a"
    machine_type = "n1-standard-1"
    allow_stopping_for_update = true # this option allow you update the vm after creating

    network_interface {
        network = "custom-vpc-tf"
        subnetwork = "subnet-us-central1"
    }

    boot_disk {
        initialize_params {
            image = "debian-9-stretch-v20220406"
            # "gcloud compute images list" can list the images
            size = 10
        }
    }
    labels = {
        "env" = "dev"
        "cost-center" = "it"
    }

    scheduling {
        preemptible  = true 
        #google will terminate the vm in 24 hours
        automatic_restart = false
    }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.vm1_serviceaccount.email
    scopes = ["cloud-platform"]
  }

}