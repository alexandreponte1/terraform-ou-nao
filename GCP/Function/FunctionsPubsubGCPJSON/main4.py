from ast import Break
import base64
import json
import re
from sre_parse import ESCAPES

pubsub_message = """{"name":"projects/4343323233/secrets/alexandrepontek1/versions/1","createTime":"2022-09-02T17:53:00.341002Z","st4te":"ENABLED","replicationStatus":{"userManaged":{"replicas":[{"location":"us-central1"}]}},"etag":"15e7b5669eeb0a","clientSpecifiedPayloadChecksum":true}"""
pub = json.loads(pubsub_message)
if "state" in pub:
    state = pub["state"]
    secret = pub["name"].split("/")[3]
    project = pub["name"].split("/")[1]
    print(state, secret, project)
    if state == "ENABLED":
        print("Olá mundo")
    else:
        print("Tchau Mundo")
else:
    print("end of file")
