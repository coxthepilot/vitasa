# VITA App Backend API Specification

## Site Management APIs

### List All Sites
GET {endpoint}/site

### Get Site Details
GET {endpoint}/site/{site-name}

**Response Sample**
    200 OK
    {
        "title": "ValidSite",
        "type": "object",
        "properties": {
            "name": {
                "type": "string"
            },
            "xstreet": {
                "type": "string"
            },
            "xcity": {
                "type": "string"
            },
            "xzip": {
                "type": "string"
            },
            "latitude": {
                "type": "number"
            },
            "longitude": {
                "type": "number"
            },
            "opentime": {
                "type": "string"
            },
            "closetime": {
                "type": "string"
            },
            "days": {
                "type": "string"
            },
            "sitecoordinator": {
                "type": "string"
            },
            "is_open": {
                "type": "boolean"
            }
        }
    }

### Create Site
PUT {endpoint}/site

Submit a JSON body with the request describing the Site to be created.
The Response will include the validated Site details for the newly-created site. This will include any pre-save hooks that may have altered some of the requested fields. The schema is identical to that for Get Site Details.

**Request Sample**
    PUT /site
    {
        "title": "ValidSite",
        "type": "object",
        "properties": {
            "name": {
                "type": "string"
            },
            "xstreet": {
                "type": "string"
            },
            "xcity": {
                "type": "string"
            },
            "xzip": {
                "type": "string"
            },
            "latitude": {
                "type": "number"
            },
            "longitude": {
                "type": "number"
            },
            "opentime": {
                "type": "string"
            },
            "closetime": {
                "type": "string"
            },
            "days": {
                "type": "string"
            },
            "sitecoordinator": {
                "type": "string"
            },
            "is_open": {
                "type": "boolean"
            }
        }
    }

### Update Site
POST {endpoint}/site/{site-name}

Same request/response schema as Create Site, but using POST rather than PUT. This will return a 400 Bad Request if the site-name is not valid. You must use PUT to create new Site records.

### Delete Site
DELETE {endpoint}/site/{site-name}

No Request body is required, and no response body is returned. 
* 200 OK indicates successful deletion
* 400 Bad Request indicates invalid Site Name
* 500 Internal Server Error probably indicates an API Gateway config or database connection issue.

## User Management APIs

## Session Management APIs (Login/Logout)
