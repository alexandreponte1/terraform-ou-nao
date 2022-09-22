resource "google_pubsub_topic" "pub" {
  name = "secretTopicAlexandre"

  labels = {
    foo = "secret"
  }
  #   depends_on = [
  #   google_project_service.gcpservices
  # ]

}