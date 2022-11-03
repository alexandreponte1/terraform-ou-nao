
#Criar o bucket
resource "google_storage_bucket" "function_bucket" {
  name     = "${var.project_id}-function"
  location = var.region
}

resource "google_storage_bucket" "input_bucket" {
  name     = "${var.project_id}-input"
  location = var.region
}




# Generates an archive of the source code compressed as a .zip file.
data "archive_file" "source" {
  type        = "zip"
  source_dir  = "../src"
  output_path = "/tmp/function.zip"
}

# Add source code zip to the Cloud Function's bucket
resource "google_storage_bucket_object" "zip" {
  source       = data.archive_file.source.output_path
  content_type = "application/zip"

  # Append to the MD5 checksum of the files's content
  # to force the zip to be updated as soon as a change occurs
  name   = "src-${data.archive_file.source.output_md5}.zip"
  bucket = google_storage_bucket.function_bucket.name

  # Dependencies are automatically inferred s o these lines can be deleted
  depends_on = [
    google_storage_bucket.function_bucket, # declared in `storage.tf`
    data.archive_file.source
  ]
}

# Create the Cloud function triggered by a `Finalize` event on the bucket
resource "google_cloudfunctions_function" "function" {
  name    = "alexandresp"
  runtime = "python37" # of course changeable

  # Get the source code of the cloud function as a Zip compression
  source_archive_bucket = google_storage_bucket.function_bucket.name
  source_archive_object = google_storage_bucket_object.zip.name

  # Must match the function name in the cloud function `main.py` source code
  entry_point = "hello_pubsub"


  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = google_pubsub_topic.pub.name
    # service= "pubsub.googleapis.com"
    #failure_policy= {}
  }

  # Dependencies are automatically inferred so these lines can be deleted
  depends_on = [
    google_storage_bucket.function_bucket, # declared in `storage.tf`
    google_storage_bucket_object.zip
  ]
}


#Necessário ativar a function api
#https://console.developers.google.com/apis/api/cloudfunctions.googleapis.com/overview?project=802253915682



# resource "google_cloudfunctions_function_iam_binding" "binding" {
#   project        = var.project_id
#   region         = var.region
#   cloud_function = google_cloudfunctions_function.function.name
#   role           = "roles/secretmanager.secretAccessor"
#   members = [
#     "serviceAccount:${var.project_id}@appspot.gserviceaccount.com"
#   ]

#   depends_on = [
#     google_cloudfunctions_function.function
#   ]
# }


# resource "google_secret_manager_secret_iam_binding" "binding" {
#   project = var.function_gcp_project
#   secret_id = "projects/976455190058/secrets/goku"
#   role = "roles/secretmanager.secretAccessor"
#   members = [
#     "serviceAccount:${var.function_gcp_project}@appspot.gserviceaccount.com"
#   ]
# }


# data "google_iam_policy" "admin" {
#   binding {
#     role = "roles/secretmanager.secretAccessor"
#     members = [
#     "serviceAccount:${var.project_id}@appspot.gserviceaccount.com",
#     ]
#   }
#   depends_on = [
#     google_cloudfunctions_function.function
#   ]
# }

# resource "google_secret_manager_secret_iam_policy" "policy" {
#   project = var.project_id
#   secret_id = "projects/976455190058/secrets/goku"
#   policy_data = data.google_iam_policy.admin.policy_data
# }


# resource "google_project_iam_binding" "secretmanagerbinding" {
#   project = var.project_id
#   role    = "roles/secretmanager.secretAccessor"
#   members = [
#     "serviceAccount:${var.project_id}@appspot.gserviceaccount.com",
#   ]
# }