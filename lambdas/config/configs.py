import os
import boto3
import logging

ENVIRONMENT = 'dev' # 'test' or 'prod'
if 'VITA_ENV' in os.environ:
  ENVIRONMENT = os.environ['VITA_ENV'].lower() 

#
# DynamoDB Configuration
# 

sites_table_names = {
  'dev': 'sites-dev',
  'test': 'sites-test',
  'prod': 'sites-prod',
}
SITES_TABLE_NAME = sites_table_names[ENVIRONMENT]

users_table_names = {
  'dev': 'users-dev',
  'test': 'users-test',
  'prod': 'users-prod',
}
USERS_TABLE_NAME = users_table_names[ENVIRONMENT]

#
# S3 Configuration
#

s3_static_content_bucket_names = {
  'dev': 'vitasa-static-content-dev',
  'test': 'vitasa-static-content-test',
  'prod': 'vitasa-static-content-prod',
}
S3_STATIC_CONTENT_BUCKET_NAME = s3_static_content_bucket_names[ENVIRONMENT]
S3_STATIC_SITES_LIST_KEY = 'sites.json'

#
# Logging Configuration
#

log_level = logging.DEBUG
if ENVIRONMENT == 'prod':
  log_level = logging.INFO

if ENVIRONMENT == 'test':
  # In test mode, log to a file. dev and prod are assumed to be logging to a CloudWatch stream
  # TODO: once Dynamo Local is configured, then dev should also get a local logfile
  logging.basicConfig(filename='vita-api-' + ENVIRONMENT + '.log', level=logging.DEBUG)
