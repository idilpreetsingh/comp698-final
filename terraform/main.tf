terraform {
 backend "gcs" {
   project = "comp698-ds1067"
   bucket  = "comp698-ds1067-terraform-state"
   prefix  = "terraform-state"
 }
}
provider "google" {
  region = "us-central1"
}

resource "google_compute_instance_template" "staging-server" {
  name = "staging-server"
  
  project = "comp698-ds1067"
  
  machine_type = "n1-standard-1"

  tags = ["http-server"]

  disk {
    source_image = "cos-cloud/cos-stable"
  }

  network_interface {
    network = "default"
    access_config {}
  }

  service_account {
    scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/devstorage.read_write",
    ]
  }

  metadata {
      gce-container-declaration = <<EOF
  spec:
    containers:
    - image: 'gcr.io/comp698-ds1067/github-idilpreetsingh-comp698-final:e2fac1597f9bf86bad005873dcb465256fff88a1'
      name: service-container
      stdin: false
      tty: false
    restartPolicy: Always
EOF
  }
}


resource "google_compute_instance_group_manager" "staging-manager" {
  name = "staging-manager"
  project = "comp698-ds1067"
  zone = "us-central1-f"
  base_instance_name = "staging-helloworld-manager"
  instance_template  = "${google_compute_instance_template.staging-server.self_link}"
  target_size = 1
}


resource "google_storage_bucket" "image-store" {
  project  = "comp698-ds1067"
  name     = "comp698-final-bucket"
  location = "us-central1"
}