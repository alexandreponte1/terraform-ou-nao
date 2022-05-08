import json

def lambda_handler(event, context):
    print(event)
    body = "Hello from lambda!"
    statusCode = 200
    return {
        "statusCode": statusCode,
        "body": json.dumps(body),
        "headers": {
            "Content-Type": "application/json"
        }
    }