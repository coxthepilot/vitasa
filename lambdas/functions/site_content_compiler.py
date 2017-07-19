import json
import boto3
from models.site import Site
from config.configs import *

class SiteContentCompiler:
    @staticmethod
    def compileSiteJson(sites):
        if len(sites) == 0:
            return None

        s3 = boto3.resource('s3')
        bucket = s3.Bucket(S3_STATIC_CONTENT_BUCKET_NAME)
        
        json_str = ",".join([site.to_json() for site in sites])
        json_str = "[" + json_str + "]"
        response = bucket.put_object(Key=S3_STATIC_SITES_LIST_KEY, Body=json_str)
        response.Acl().put(ACL='public-read')
        print("Upload complete. Response: " + response.key)
        return True

def lambda_handler(event, context):
    print("Recompiling All Sites static JSON")

    print("Uploading to S3")
    SiteContentCompiler.compileSiteJson(Site.all())
    
