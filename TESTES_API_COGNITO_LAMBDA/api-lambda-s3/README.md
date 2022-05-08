Com esse repositório estou criando

uma api
lambda utilizando S3


Comando para criar bucket e subir o zip.
aws s3api create-bucket --bucket=nome-do-BUCKET --region=us-east-1
aws s3 cp lambda_function.zip s3://nome-do-BUCKET/lambda_function.zip