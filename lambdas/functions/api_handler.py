
import json
import boto3

from models.site import Site
import utilities

class LambdaApiHandler:
    
    @staticmethod
    def site_apis(event):
        """ Handle all of the Site Management API endpoints """
        response_body = ''
        response_code = '200'

        site_name = None if event['pathParameters'] == None else event['pathParameters']['sitename']
        site_data = LambdaApiHandler.deserialize_site(event) # This will simply return None if there is no (correctly formatted) data in the request body
        
        if event['httpMethod'] == 'GET':
            if site_name == None:
                # Fetch all sites
                print("Fetching all sites")
                sites = Site.all()
                sites_json = []
                for site in sites:
                    sites_json.append(site.to_json())
                j = ','.join(sites_json)
                response_body = "[ " + j + " ]"
                response_code = '200'
                print("Compiled response: " + response_code + " : " + response_body)
            else:
                # Fetch single site
                print("Querying a single site: " + site_name)
                site = Site.find(site_name)
                response_body = site.to_json()
                response_code = '200'
        
        elif event['httpMethod'] == 'PUT':
            # Create a new site
            if site_data == None:
                response_body = '{"error":"Invalid Site data in request body"}'
                response_code = '400'
            else:
                if site_data.save():
                    response_body = Site.find(site_data.name).to_json() # Reload the object from the database to ensure that any on-save hooks are accounted for
                    response_code = '200'
                else:
                    response_body = '{"error":"failed to create site"}'
                    response_code = '500'
        
        elif event['httpMethod'] == 'POST':
            # Update an existing site status
            if site_name == None:
                response_body = '{"error":"bad request. Please specify the sitename path parameter"}'
                response_code = '400'
            elif site_data == None:
                response_body = '{"error":"Invalid Site data in request body"}'
                response_code = '400'
            else:
                if site_data.save():
                    response_body = ''
                    response_code = '200'
                else:
                    response_body = '{"error":"failed to update site"}'
                    response_code = '500'
        
        elif event['httpMethod'] == 'DELETE':
            # Destroy an existing Site
            if site_name == None:
                response_body = '{"error":"bad request. Please specify the sitename path parameter"}'
                response_code = '400'
            else:
                site = Site.find(site_name)
                if site == None:
                    response_body = '{"error":"Invalid site_name"}'
                    response_code = '400'
                elif site.delete():
                    response_body = ''
                    response_code = '200'
                else:
                    response_body = '{"error":"failed to delete site"}'
                    response_code = '400'
        else:
            response_body = '{"error":"bad request"}'
            response_code = '400'
        
        #utilities.respond(response_code, response_body) # TODO: test this method before implementing
        return {
            'statusCode': response_code,
            'body': response_body,
            'headers': {
                'Content-Type': 'application/json'
            },
        }

    @staticmethod
    def user_apis(event):
        response_body = '{"error":"/user APIs not implemented yet"}'
        response_code = '404'
        #utilities.respond(response_code, response_body)
        return {
            'body': response_body,
            'statusCode': response_code,
            'headers': {
                'Content-Type': 'application/json'
            },
        }

    @staticmethod
    def session_apis(event):
        response_body = '{"error":"/session APIs not implemented yet"}'
        response_code = '404'
        #utilities.respond(response_code, response_body)
        return {
            'body': response_body,
            'statusCode': response_code,
            'headers': {
                'Content-Type': 'application/json'
            },
        }


def lambda_handler(event, context):
    ''' Lambda Entrypoint '''
    print("Received event: " + json.dumps(event, indent=2))

    response_body = ''
    response_code = '200'
    
    if event['resource'].startswith('/site'):
        """ Handle Site management APIs """
        response = LambdaApiHandler.site_apis(event)
        print ("API Handler returned:" + json.dumps(response))
        return response
    elif event['resource'].startswith('/user'):
        """ Handle User management APIs """
        return LambdaApiHandler.user_apis(event)
    elif event['resource'].startswith('/session'):
        """ Handle Session management APIs (login/logout) """
        return LambdaApiHandler.session_apis(event)
    
