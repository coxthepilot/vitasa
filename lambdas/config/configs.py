ENVIRONMENT = 'dev' # 'test' or 'prod'
ENVIRONMENT = os.environ['vita-env'].lower() if 'vita-env' in os.environ

sites_table_names = {
  'dev': 'sites-dev',
  'test': 'sites-test',
  'prod': 'sites-prod',
}

SITES_TABLE_NAME = sites_table_names[ENVIRONMENT]

