resource "google_pubsub_topic" "pub" {
  name = "secretTopicGOKU"

  labels = {
    foo = "secret"
  }

}