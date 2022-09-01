variable "gcpkey" {
  type = string
}

variable "project_id" {
  type    = string
  default = "playground-s-11-4b4f725c"

}

variable "region" {
  default = "us-central1"
}


variable "gcp_service_list" {
  description = "The list of apis necessary for the project"
  type        = list(string)
  default = [
    "serviceusage.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudfunctions.googleapis.com",
    "logging.googleapis.com",
    "pubsub.googleapis.com",
    "secretmanager.googleapis.com"
  ]
}






