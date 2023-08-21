from pkg_resources import working_set

def lambda_handler(event, context):
    for p in list(working_set):
        print(p.project_name, p.version)