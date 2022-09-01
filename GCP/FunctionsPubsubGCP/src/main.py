import base64
import re

def hello_pubsub(event, context):
    """Triggered from a message on a Cloud Pub/Sub topic.
    Args:
         event (dict): Event payload.
         context (google.cloud.functions.Context): Metadata for the event.
    """
    pubsub_message = base64.b64decode(event['data']).decode('utf-8')
    print(pubsub_message)
    pub = str(pubsub_message)
    tags = re.findall(r'(\/secrets\/)(.*?)(\/versions\/)', pub)
    for tag in tags:
     um, dois, tres = tag
     senha = dois
     print(senha)