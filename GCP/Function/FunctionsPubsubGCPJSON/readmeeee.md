Nesse caso é necessário incluir a conta de servço da function criada como novo user no projeto e dar permissão de acesso ao secretmanager



gcloud auth activate-service-account SERVICE_ACCOUNT@DOMAIN.COM --key-file=/path/key.json --project=PROJECT_ID
