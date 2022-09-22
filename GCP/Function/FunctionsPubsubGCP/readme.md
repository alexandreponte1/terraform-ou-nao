

resource "google_project_service" "project" {
  project = "your-project-id"
  service = "iam.googleapis.com"
}



#Enable this in console
serviceusage.googleapis.com
cloudresourcemanager.googleapis.com
cloudbuild.googleapis.com
cloudfunctions.googleapis.com
logging.googleapis.com
pubsub.googleapis.com
secretmanager.googleapis.com



Adicionar permissão a conta de serviço do sercret manager para que ele possa publicar no tópico.


In order to enable Secret Manager to publish to the Pub/Sub topics, you must create the service account service-827031886622@gcp-sa-secretmanager.iam.gserviceaccount.com, if it does not already exist, and grant it the role roles/pubsub.publisher on all the topics. To do this, follow instructions in the documentation. If you don’t have the permissions, contact your admin.



projects/playground-s-11-672a666f/topics/secretTopicGOKU

gcloud pubsub topics add-iam-policy-binding secretTopicGOKU  --member serviceAccount:service-827031886622@gcp-sa-secretmanager.iam.gserviceaccount.com  --role "roles/pubsub.publisher"



gcloud iam service-accounts create teste123 --description "teste1234" --display-name "teste_123"



Result of the pubsub print


Info
2022-08-30T15:38:42.083297Z
function-trigger-on-gcscdlgzgrtreen {"name":"projects/827031886622/secrets/goku/versions/2","createTime":"2022-08-30T15:38:39.656666Z","state":"ENABLED","replicationStatus":{"userManaged":{"replicas":[{"location":"us-east1"}]}},"etag":"\"15e7772ca482da\"","clientSpecifiedPayloadChecksum":true}
Info
2022-08-30T15:38:42.083330Z
function-trigger-on-gcscdlgzgrtreen
Debug
2022-08-30T15:38:42.087302560Z
function-trigger-on-gcscdlgzgrtreen Function execution took 768 ms. Finished with status: ok
Debug
2022-08-30T15:38:43.662919805Z
function-trigger-on-gcscdlglwfa3m89 Function execution started
Info
2022-08-30T15:38:43.668950Z
function-trigger-on-gcscdlglwfa3m89 {"name":"projects/827031886622/secrets/goku/versions/1","createTime":"2022-08-30T15:10:19.820653Z","state":"DISABLED","replicationStatus":{"userManaged":{"replicas":[{"location":"us-east1"}]}},"etag":"\"15e7772cc5861b\"","clientSpecifiedPayloadChecksum":true}
Info
2022-08-30T15:38:43.668980Z
function-trigger-on-gcscdlglwfa3m89
Debug
2022-08-30T15:38:43.671033042Z
function-trigger-on-gcscdlglwfa3m89 Function execution took 8 ms. Finished with status: ok 




Com base na doc = https://cloud.google.com/secret-manager/docs/event-notifications?&_ga=2.57512355.-821785177.1660754290#service-account

Antes de criar o secret é necessário criar a identidade do serviço.
O comando abaixo vai gerar essa conta de serviço e com ela podemos dar permissão para o secret manager publicar no topico Pub/Sub





gcloud beta services identity create \
    --service "secretmanager.googleapis.com" \
    --project "active-chimera-359118"

service-716970710829@gcp-sa-secretmanager.iam.gserviceaccount.com


gcloud pubsub topics add-iam-policy-binding secretTopicAlexandre  --member serviceAccount:service-716970710829@gcp-sa-secretmanager.iam.gserviceaccount.com  --role "roles/pubsub.publisher"




