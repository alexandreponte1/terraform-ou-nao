import base64
import re
from google.cloud import secretmanager

def hello_pubsub(event, context):
    pubsub_message = base64.b64decode(event['data']).decode('utf-8')
    print(pubsub_message)
    pub = str(pubsub_message)
    tags = re.findall(r'(\/secrets\/)(.*?)(\/versions\/)', pub)
    for tag in tags:
     um, dois, tres = tag
     senha = dois
     print(senha)
     #novo trecho.
    #  project_id = "segredinho-361619"
    #  secret_id = senha
    #  secretmanager_client = secretmanager.SecretManagerServiceClient()
    #  response=secretmanager_client.access_secret_version(
    #      name=f'projects/{project_id}/secrets/{secret_id}/versions/latest'
    #  )
    #  payload = response.payload.data.decode("UTF-8")
    #  print(format(payload))





# import base64
# import json
# from multiprocessing import Event, context
# import re
# from sre_parse import ESCAPES, _State
# from unicodedata import name

# def hello_pubsub(event, context):
#     pubsub_message = base64.b64decode(event['data']).decode('utf-8')
#     pubsubs = str(pubsub_message)
#     print(pubsubs)
#     pub = json.loads(pubsubs)
#     secret = pub["name"].split("/")[3]
#     state = pub["state"]
#     return secret, state

# hello_pubsub()
# # senha, estado = hello_pubsub(Event, )

# # print(senha)
# # print(estado)

