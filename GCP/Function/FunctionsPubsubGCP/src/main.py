import base64
import json
import re
from sre_parse import ESCAPES
from google.cloud import secretmanager
from random import choice
import string


def read_pubsub(event, context):
    pubsub_message = base64.b64decode(event['data']).decode('utf-8')
    pub = json.loads(pubsub_message)
    print(pub)
    if "rotation" in pub:
        SECRET_ID = pub["name"].split("/")[3]
        PROJECT_ID = pub["name"].split("/")[1]
        tamanho_da_senha = 10
        caracteres = string.ascii_letters + string.digits
        SENHA_SEGURA = ''
        for i in range(tamanho_da_senha):
         SENHA_SEGURA += choice(caracteres)
        payload = SENHA_SEGURA
        print(SECRET_ID,PROJECT_ID)
        client = secretmanager.SecretManagerServiceClient()
        parent = f"projects/{PROJECT_ID}/secrets/{SECRET_ID}"
        payload = payload.encode('UTF-8')

        response = client.add_secret_version(
            request={
            "parent": parent,
            "payload": {"data": payload,}
            }
          )

        print(f'Added secret version: {response.name}')
        print(SECRET_ID, PROJECT_ID)
        print("SEGREDO ATUALIZADO!!!")
    else:
      print("Sem Segredos para Atualizar aqui...")
    return SECRET_ID, PROJECT_ID


# SECRET_ID, PROJECTID = read_pubsub()

# print(SECRET_ID)
# print(PROJECTID)





# def read_pubsub(event, context):
#     pubsub_message = base64.b64decode(event['data']).decode('utf-8')
#     pub = json.loads(pubsub_message)
#     SECRET_ID = pub["name"].split("/")[3]
#     PROJECT_ID = pub["name"].split("/")[1]
#     print(SECRET_ID)
#     return SECRET_ID, PROJECT_ID


# SECRET_ID, PROJECTID = read_pubsub()

# print(SECRET_ID)
# print(PROJECTID)


# def add_secret_version(secret_id, payload):
#     PROJECT_ID = PROJECTID

#     client = secretmanager.SecretManagerServiceClient()

#     parent = f"projects/{PROJECT_ID}/secrets/{secret_id}"

#     payload = payload.encode('UTF-8')

#     response = client.add_secret_version(parent=parent, payload={'data': payload})

#     print(f'Added secret version: {response.name}')
#     return response


# def senhasegura():
  # tamanho_da_senha = 10
  # caracteres = string.ascii_letters + string.digits
  # # caracteres = string.ascii_letters + string.digits + string.punctuation
  # senha_segura = ''
  # for i in range(tamanho_da_senha):
  #   senha_segura += choice(caracteres)
  # return senha_segura


# pwdnow = senhasegura()


# add_secret_version(SECRET_ID, pwdnow)
#####################################################################################
# import base64
# import re
# from google.cloud import secretmanager

# def hello_pubsub(event, context):
#     pubsub_message = base64.b64decode(event['data']).decode('utf-8')
#     print(pubsub_message)
#     pub = str(pubsub_message)
#     tags = re.findall(r'(\/secrets\/)(.*?)(\/versions\/)', pub)
#     for tag in tags:
#      um, dois, tres = tag
#      senha = dois
#      print(senha)
#      #novo trecho.
#     #  project_id = "segredinho-361619"
#     #  secret_id = senha
#     #  secretmanager_client = secretmanager.SecretManagerServiceClient()
#     #  response=secretmanager_client.access_secret_version(
#     #      name=f'projects/{project_id}/secrets/{secret_id}/versions/latest'
#     #  )
#     #  payload = response.payload.data.decode("UTF-8")
#     #  print(format(payload))





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

