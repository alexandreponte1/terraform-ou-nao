

Criar o requirements.txt

numpy
requests



# ### 3969  pip install --target ./package boto3
#  3970  pip install --target ./package -r requirements.txt


from requests import get
import json
import numpy as np
from urllib.request import urlopen


Verificar quais bibliotecas padrão existem na aws

https://medium.com/wescale/how-to-lightweight-your-python-aws-lambda-functions-with-aws-lambda-layer-docker-and-terraform-b48602e76e8b