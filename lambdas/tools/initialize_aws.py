import boto3
import json
from config.configs import *

class AwsConfig:
    
    dynamodb = {
        "endpoint": None,
        "sites_table": {
            "table_name": "sites-dev",
            "index_name": "slug",
            "attribute_definitions": [{
                "AttributeName": 'slug',
                "AttributeType": 'S',
            }],
            "key_schema": [{
                'AttributeName': 'slug',
                'KeyType': 'HASH'
            }],
            'global_secondary_indexes': None,
            'provisioned_throughput': {
                'ReadCapacityUnits': 5,
                'WriteCapacityUnits': 5,
            }
        },
        "users_table": {
            "table_name": "users-dev",
            "index_name": "id",
            "attribute_definitions": [{
                "AttributeName": 'id',
                "AttributeType": 'S',
            }],
            "key_schema": [{
                'AttributeName': 'id',
                'KeyType': 'HASH'
            }],
            'global_secondary_indexes': {
                "IndexName": "email",
                "Projection": {
                    'ProjectionType': 'ALL',
                },
                'ProvisionedThroughput': {
                    'ReadCapacityUnits': 5,
                    'WriteCapacityUnits': 5,
                }
                
            },
            'provisioned_throughput': {
                'ReadCapacityUnits': 5,
                'WriteCapacityUnits': 5,
            }
        },
    }

    def init_dynamo(self):
        dynamodb = boto3.resource('dynamodb')
        
        #
        # Sites
        #
        create_response = dynamodb.create_table(
            TableName = self.dynamodb['sites_table']['table_name'],
            AttributeDefinitions = self.dynamodb['sites_table']['attribute_definitions'],
            KeySchema = self.dynamodb['sites_table']['key_schema'],
            GlobalSecondaryIndexes = self.dynamodb['sites_table']['global_secondary_indexes'],
            ProvisionedThroughput = self.dynamodb['sites_table']['provisioned_throughput'],
        )

        sites_table = dynamodb.Table(SITES_TABLE_NAME)


        # create_response = dynamodb.create_table(
        #     TableName = self.dynamodb['users_table']['table_name'],
        #     AttributeDefinitions = self.dynamodb['users_table']['attribute_definitions'],
        #     KeySchema = self.dynamodb['users_table']['key_schema'],
        #     GlobalSecondaryIndexes = self.dynamodb['users_table']['global_secondary_indexes'],
        #     ProvisionedThroughput = self.dynamodb['users_table']['provisioned_throughput'],
        # )


    

if __name__ == '__main__':
    configurator = AwsConfig()
    configurator.dynamodb['endpoint'] = 'http://localhost:8000'
    configurator.init_dynamo()