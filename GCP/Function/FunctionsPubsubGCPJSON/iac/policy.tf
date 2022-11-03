# # # # resource "google_pubsub_topic_iam_binding" "binding" {
# # # #   project = var.project_id
# # # #   topic   = google_pubsub_topic.pub.name
# # # #   role    = "roles/pubsub.publisher"
# # # #   members = [
# # # #     "serviceAccount:service-92526308124@gcp-sa-secretmanager.iam.gserviceaccount.com",
# # # #   ]
# # # # }




# gcloud beta services identity create \
#     --service "secretmanager.googleapis.com" \
#     --project "active-chimera-359118"


# # Service identity created: service-716970710829@gcp-sa-secretmanager.iam.gserviceaccount.com

# gcloud pubsub topics add-iam-policy-binding secretTopicAlexandre  --member serviceAccount:service-716970710829@gcp-sa-secretmanager.iam.gserviceaccount.com  --role "roles/pubsub.publisher" --project "active-chimera-359118"



# # # $ gcloud secrets create "meuSegredinho" \
# # #     --replication-policy "automatic" \
# # #     --next-rotation-time="2022-10-10T09:00:00Z" \
# # #     --rotation-period="2592000s" \
# # #     --topics=secretTopicAlexandre"


# # # next-rotation-time=Ano-mes-diaThora:minuto:segundoZ

# # $ gcloud secrets create segredonaMao2 \
# #     --replication-policy "user-managed" \
# #     --locations "us-central1" \
# #     --next-rotation-time="2022-10-09T09:00:00Z" \
# #     --rotation-period="2592000s" \
# #     --topics=projects/playground-s-11-0b0da578/topics/secretTopicAlexandre \
# #     --project "playground-s-11-0b0da578"



# # # Create Secret
# # printf "senha bonita" | gcloud secrets create segredonaMao2 --data-file=- \
# #   --replication-policy "user-managed" \
# #   --locations "us-central1" \
# #   --next-rotation-time="2022-10-09T09:00:00Z" \
# #   --rotation-period="2592000s" \
# #   --topics=projects/playground-s-11-e93b654c/topics/secretTopicAlexandre \
# #   --project "playground-s-11-e93b654c"






# printf "senha bonita linda maravilhosa" | gcloud secrets create segredonaMaoou --data-file=- \
#   --replication-policy "user-managed" \
#   --locations "us-central1" \
#   --next-rotation-time="2022-10-09T09:00:00Z" \
#   --rotation-period="7776000s" \
#   --topics=projects/active-chimera-359118/topics/secretTopicAlexandre \
#   --project "active-chimera-359118"



# Create secret with labels

# printf "senha bonita" | gcloud secrets create segredoComLabel --data-file=- \
#   --replication-policy "user-managed" \
#   --locations "us-central1" \
#   --next-rotation-time="2022-10-09T09:00:00Z" \
#   --rotation-period="7776000s" \
#   --topics=projects/active-chimera-359118/topics/secretTopicAlexandre \
#   --labels senha=banco,dominio=eu_com_br \
#   --project "active-chimera-359118"



# To update a secret's next_rotation_time:

# $ gcloud secrets update secret-id \
#   --next-rotation-time "2022-06-01T09:00:00Z"




# # # #  segredinho@playground-s-11-b6e6719f.iam.gserviceaccount.com 
# # # # roles/secretmanager.secretAccessor


# # # # gcloud projects add-iam-policy-binding  playground-s-11-b6e6719f  --member='serviceAccount:segredinho@playground-s-11-b6e6719f.iam.gserviceaccount.com' --role='roles/secretmanager.secretAccessor'




# Informação que recebemos em caso de rotação:
# alexandrespz3rm6r4f7qnh {"name":"projects/716970710829/secrets/alexandrePonte","replication":{"automatic":{}},"createTime":"2022-09-14T15:17:28.530566Z","topics":[{"name":"projects/active-chimera-359118/topics/secretTopicAlexandre"}],"etag":"\"15e8ae70efc0eb\"","rotation":{"nextRotationTime":"2022-10-15T03:00:00Z","rotationPeriod":"2592000s"}}
# {"name":"projects/716970710829/secrets/alexandrePonte","replication":{"automatic":{}},"createTime":"2022-09-14T15:17:28.530566Z","topics":[{"name":"projects/active-chimera-359118/topics/secretTopicAlexandre"}],"etag":"\"15e8ae70efc0eb\"","rotation":{"nextRotationTime":"2022-10-15T03:00:00Z","rotationPeriod":"2592000s"}}
