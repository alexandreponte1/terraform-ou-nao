import base64
import json
import re
from sre_parse import ESCAPES

def hello_pubsub( ):
    # pubsub_message = base64.b64decode(event['data']).decode('utf-8')
    pubsub_message = """{"name":"projects/499858196799/secrets/alexandrepontek1/versions/1","createTime":"2022-09-02T17:53:00.341002Z","state":"ENABLED","replicationStatus":{"userManaged":{"replicas":[{"location":"us-central1"}]}},"etag":"15e7b5669eeb0a","clientSpecifiedPayloadChecksum":true}"""
    pub = json.loads(pubsub_message)
    secret = pub["name"].split("/")[3]
    state = pub["state"]
    return secret, state

senha, estado = hello_pubsub()

print(senha)
print(estado)


# {"name":"projects/499858196799/secrets/alexandrepontek1/versions/1","createTime":"2022-09-02T17:53:00.341002Z","state":"ENABLED","replicationStatus":{"userManaged":{"replicas":[{"location":"us-central1"}]}},"etag":"\"15e7b5669eeb0a\"","clientSpecifiedPayloadChecksum":true}


# substituir esse !!!


# \"15e7772ca482da\


#     por 

#     ESCAPES

#     \\"15e7772ca482da\\