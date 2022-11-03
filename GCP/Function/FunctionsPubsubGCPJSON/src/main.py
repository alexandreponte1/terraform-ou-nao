import base64
import json
import re
from sqlite3 import SQLITE_ALTER_TABLE
from sre_parse import ESCAPES
from google.cloud import secretmanager


def read_pubsub(event, context):
    pubsub_message = base64.b64decode(event['data']).decode('utf-8')
    print(pubsub_message)
    pub = json.loads(pubsub_message)
    if "state" in pub:
       state = pub["state"]
       print(state)
       secret_id = pub["name"].split("/")[3]
       print(secret_id)
       project_id = pub["name"].split("/")[1]
       print(project_id)
       if state == "ENABLED":
          print("OI Mundo")
          secretmanager_client = secretmanager.SecretManagerServiceClient()
          response=secretmanager_client.access_secret_version(
              name=f'projects/{project_id}/secrets/{secret_id}/versions/latest'
          )
          payload = response.payload.data.decode("UTF-8")
          # print(format(payload))
          senha = print(format(payload))
          print(senha)
    else:
        print("Tchau Mundo")

















# def read_pubsub(event, context):
#     pubsub_message = base64.b64decode(event['data']).decode('utf-8')
#     print(pubsub_message)
#     pub = json.loads(pubsub_message)
#     state = pub["state"]
#     print(state)
#     secret_id = pub["name"].split("/")[3]
#     print(secret_id)
#     project_id = pub["name"].split("/")[1]
#     print(project_id)
#     if state == "ENABLED":
#         print("OI Mundo")
#         secretmanager_client = secretmanager.SecretManagerServiceClient()
#         response=secretmanager_client.access_secret_version(
#             name=f'projects/{project_id}/secrets/{secret_id}/versions/latest'
#         )
#         payload = response.payload.data.decode("UTF-8")
#         # print(format(payload))
#         senha = print(format(payload))
#         print(senha)
#     else:
#         print("Tchau Mundo")







    # {"name":"projects/827031886622/secrets/ponte/versions/2","createTime":"2022-08-30T15:38:39.656666Z","state":"ENABLED","replicationStatus":{"userManaged":{"replicas":[{"location":"us-east1"}]}},"etag":"\"15e7772ca482da\"","clientSpecifiedPayloadChecksum":true}



# nomedaapp/ tipo pra onde vai/ o que eu quero guardar/
# nomedaApp_SQL_senha_


# Sugestão de nome: setor_projeto_ambiente_nomeAplicacao_nomeVariavel
# Exemplo: financeiro_pagamento_producao_maquinaCartao_tokenMasterCard
# Em caso de SQL, pode ter um pub/sub  somente para sql que irá triggar somente a function de SQL.



