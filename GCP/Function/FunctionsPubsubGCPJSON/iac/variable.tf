variable "gcpkey" {
  type = string
}

variable "project_id" {
  type    = string
  default = "projectID"

}

variable "region" {
  default = "us-central1"
}


# variable "gcp_service_list" {
#   description = "The list of apis necessary for the project"
#   type        = list(string)
#   default = [
#     "pubsub.googleapis.com"
#     # "cloudfunctions.googleapis.com",
#     # "cloudbuild.googleapis.com",
#     # "serviceusage.googleapis.com",
#     # "cloudresourcemanager.googleapis.com"

#   ]
# }


#     "pubsub.googleapis.com",
#     "cloudfunctions.googleapis.com",
#     "cloudbuild.googleapis.com",




#     "serviceusage.googleapis.com",
#     "cloudresourcemanager.googleapis.com",
#     "cloudfunctions.googleapis.com",
#     "logging.googleapis.com",
#     "pubsub.googleapis.com",
#     "secretmanager.googleapis.com"

