provider "google" {
  credentials = file("cred.json")
  project     = var.project_id
  region      = var.region
}

resource "google_project_service" "cloud_resource_manager" {
  service = "cloudresourcemanager.googleapis.com"
}

resource "google_project_service" "artifact_registry" {
  service = "artifactregistry.googleapis.com"
  depends_on = [google_project_service.cloud_resource_manager]
}

resource "google_storage_bucket" "docker_registry" {
  name          = var.project_id + "-docker-registry"
  location      = "US"
  force_destroy = true
}

resource "google_storage_bucket_object" "docker_image" {
  name   = "hello-world.tar"
  bucket = google_storage_bucket.docker_registry.name
  source = "hello-world.tar"
}

output "docker_image_url" {
  value = "gs://${google_storage_bucket.docker_registry.name}/${google_storage_bucket_object.docker_image.name}"
}