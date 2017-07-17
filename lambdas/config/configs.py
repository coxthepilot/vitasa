import os
import boto3

ENVIRONMENT = 'dev' # 'test' or 'prod'
if 'VITA_ENV' in os.environ:
  ENVIRONMENT = os.environ['VITA_ENV'].lower() 

sites_table_names = {
  'dev': 'sites-dev',
  'test': 'sites-test',
  'prod': 'sites-prod',
}

SITES_TABLE_NAME = sites_table_names[ENVIRONMENT]
