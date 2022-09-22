resource "google_pubsub_topic_iam_binding" "binding" {
  project = var.project_id
  topic   = google_pubsub_topic.pub.name
  role    = "roles/pubsub.publisher"
  members = [
    "serviceAccount:service-976455190058@gcp-sa-secretmanager.iam.gserviceaccount.com",
  ]
}


# gcloud beta services identity create \
#     --service "secretmanager.googleapis.com" \
#     --project "segredinho-361619"


# service-976455190058@gcp-sa-secretmanager.iam.gserviceaccount.com

