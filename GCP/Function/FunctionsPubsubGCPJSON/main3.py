import base64
import json
import re
from sre_parse import ESCAPES

def read_pubsub( ):
    # pubsub_message = base64.b64decode(event['data']).decode('utf-8')
    pubsub_message = """{"name":"projects/434434344343/secrets/alexandrepontek1/versions/1","createTime":"2022-09-02T17:53:00.341002Z","state":"ENABLED","replicationStatus":{"userManaged":{"replicas":[{"location":"us-central1"}]}},"etag":"15e7b5669eeb0a","clientSpecifiedPayloadChecksum":true}"""
    pub = json.loads(pubsub_message)
    secret = pub["name"].split("/")[3]
    state = pub["state"]
    for element in pub:
        del element['etag']
    print(pub)
#     return secret, state

# senha, estado, estag = read_pubsub()

# print(senha)
# print(estado)
# print (estag)