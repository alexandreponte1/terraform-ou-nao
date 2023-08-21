from requests import get
import json
import numpy as np
from urllib.request import urlopen
URL_JSON = 'https://ip-ranges.amazonaws.com/ip-ranges.json'
ip  = ['52.94.4.0/24', '35.71.102.0/24']
response = urlopen(URL_JSON)
r = json.loads(response.read())
data = (r["prefixes"])

resultado = list(filter(lambda person: person['service'] == 'DYNAMODB' and person['region']== 'us-east-2', data))

arrayresultado = list(map(lambda x: x["ip_prefix"] in ip, resultado ))

# print(arrayresultado)
print (ip)


#all verifica se todos os itens do array são true
if all(arrayresultado):
    print("OK")
else:
    print(json.dumps(resultado,indent=4, default=str)) # printa os ips atuais do serviço DYNAMODB na região us-east-2




# from requests import get
# import json
# import numpy as np
# from urllib.request import urlopen
# URL_JSON = 'https://ip-ranges.amazonaws.com/ip-ranges.json'
# ip  = ['52.94.4.0/24', '35.71.102.0/24']
# response = urlopen(URL_JSON)
# r = json.loads(response.read())
# data = (r["prefixes"])

# resultado = list(filter(lambda person: person['service'] == 'DYNAMODB' and person['region']== 'us-east-2', data))

# arrayresultado = list(map(lambda x: x["ip_prefix"] in ip, resultado ))

# print(arrayresultado)


# #all verifica se todos os itens do array são true
# if all(arrayresultado):
#     print("OK")
# else:
#     print(json.dumps(resultado,indent=4, default=str)) # printa os ips atuais do serviço DYNAMODB na região us-east-2




# # {
# #   "ip_prefix": "35.71.102.0/24",
# #   "region": "us-east-2",
# #   "service": "DYNAMODB",
# #   "network_border_group": "us-east-2"
# # },

# # {
# #   "ip_prefix": "52.94.4.0/24",
# #   "region": "us-east-2",
# #   "service": "DYNAMODB",
# #   "network_border_group": "us-east-2"
# # },
