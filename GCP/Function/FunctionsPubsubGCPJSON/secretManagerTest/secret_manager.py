# Import the Secret Manager client library.
from google.cloud import secretmanager

# GCP project in which to store secrets in Secret Manager.
project_id = "numeroDoProjeto"

# ID of the secret to create.
secret_id = "pontesIndestrutiveis"

# Create the Secret Manager client.
secretmanager_client = secretmanager.SecretManagerServiceClient()

response=secretmanager_client.access_secret_version(
    name=f'projects/{project_id}/secrets/{secret_id}/versions/latest'
)
payload = response.payload.data.decode("UTF-8")
# print("Plaintext: {}".format(payload))
print(format(payload))
