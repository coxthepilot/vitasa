# VITA App Backend API Specification

## Site Management APIs

### List All Sites
This API is used to get an unfiltered list of all sites in the database.

**Request**

    GET {endpoint}/sites

Nothing special. A plain GET request against the resource will return a list of all Site records in the database.

**Response**

An array of Site records. Each of which must conform to the provided [site.json schema](schemas/site.json).

**HTTP Codes**

* 200 OK indicates successful query

### Get Site Details

**Request**

    GET {endpoint}/sites/{site-slug}

**Response**

It must conform to the provided [site.json schema](schemas/site.json).

**HTTP Codes**

* 200 OK indicates successful query
* 404 Not Found indicates an invalid site-slug

### Create Site
Submit a JSON body with the request describing the Site to be created.
The Response will include the validated Site details for the newly-created site. This will include any pre-save hooks that may have altered some of the requested fields. The schema is identical to that for Get Site Details.

**Request**

    POST {endpoint}/sites

The request body shall be a JSON document describing a Site record. 

It must conform to the provided [site.json schema](schemas/site.json).

**Response**

The response body shall be a JSON document describing the Site record as it was stored in the database. This will include any changes that were made by pre-save hooks, such as case normalization, or slug generation.

It must conform to the provided [site.json schema](schemas/site.json).

**HTTP Codes**

* 200 OK indicates successful creation
* 401 Bad Request indicates invalid content in one of the fields, or no body attached to the request.
* 500 Internal Server Error probably indicates an API Gateway config or database connection issue.


### Update Site
This API is used to change site settings. Specifically, this is used for Opening and Closing a Site, by updating the `is_open` field.

**Request**

    PUT {endpoint}/sites/{site-slug}
    PATCH {endpoint}/sites/{site-slug}

The request body shall be a JSON document describing the desired Site settings.

It must conform to the provided [site.json schema](schemas/site.json).

**Response**

The response body will describe the creates Site record, after any pre-save hooks have updated it.

It must conform to the provided [site.json schema](schemas/site.json).

**HTTP Codes**

* 200 OK indicates successful update
* 401 Bad Request indicates invalid content in one of the fields, or no body attached to the request.
* 404 Not Found indicates an invalid site-slug
* 500 Internal Server Error probably indicates an API Gateway config or database connection issue.

### Delete Site
This API is used to destroy an existing Site record.

**Request**

    DELETE {endpoint}/sites/{site-slug}

No Request body is required

**Response**
No response body is returned. 

**HTTP Codes**

* 200 OK indicates successful deletion
* 404 Not Found indicates an invalid site-slug
* 500 Internal Server Error probably indicates an API Gateway config or database connection issue.

## User Management APIs

### Create User (Signup)

Use this API to create a new user. By necessity, this is an open API, with no authentication required. New Users will have the single Role "New User".

**Request**

    POST {endpoint}/users

The Request body shall be a JSON document describing a valid User record:

It must conform to the provided [user.json schema](schemas/user.json).

**Response**

The response body shall be a JSON document describing the user record as it was created. This will include any values that were altered by pre-save hooks, such as case normalization.

It must conform to the provided [user.json schema](schemas/user.json).

**HTTP Codes**

* 200 OK indicates successful User creation
* 400 Bad Request indicates a duplicate email address

### Update User Data
This API is used by individual users to update their personal profile (usually for password changes). Use of this API is restricted to users who either
1. Are updating their own profile, and are not members of the 'New User' Role
2. Have the Admin Role. They can update anyone's profile.

**Request**

    PUT {endpoint}/users/{user-id}
    PATCH {endpoint}/users/{user-id}

The request body shall conform to the provided [user.json schema](schemas/user.json). The `id` field is required. The `roles` field is ignored.

**Response**

The response payload will be empty. Refer to the HTTP Codes for status.

**HTTP Codes**

* 200 OK indicates successful User creation
* 400 Bad Request indicates a duplicate email address, or other invalid data in the payload.
* 401 Unauthorized indicates that the user has not logged in successfully
* 403 Forbidden indicates that the logged-in user does not have permission to update this User record. Either: the logged-in user is different from the user being updated, or the user does not have the Admin Role, and is thus forbidden from altering arbitrary users.
* 404 Not Found indicates that there was no record found with the specified `user-id`

### Update User Permissions
This API is used to grant or revoke Roles to a User. This API is restricted to Users with the Admin Role. As such, this API must not only be signed, but signed by a User with the correct Role.

**Request**

    POST {endpoint}/users/{user-id}

The request body shall conform to the [user.json schema](schemas/user.json), but need only include the `id` and `roles` fields. Any `roles` specified in this request will overwrite all existing `roles` that were attached to the User previously.

**Response**

No body will be included with the response, just HTTP Codes.

**HTTP Codes**

* 200 OK indicates successful update of the user's permissions
* 400 Bad Request indicates an invalid User `id`.
* 401 Unauthorized indicates that the user has not logged in successfully
* 403 Forbidden indicates that the logged-in user does not have the Admin Role, and is thus forbidden from altering user permissions.

### Delete User
This API is used to destroy a user record. It is only useable by Users with the Admin Role.

**Request**
    
    DELETE {endpoint}/users/{user-id}

**Response**

No response body is included. Check the HTTP response Code for status.

**HTTP Codes**

* 200 OK indicates successful update of the user's permissions
* 400 Bad Request indicates an invalid User `id`.
* 401 Unauthorized indicates that the user has not logged in successfully
* 403 Forbidden indicates that the logged-in user does not have the Admin Role, and is thus forbidden from altering user permissions.

## Session Management APIs (Login/Logout)

TBD: I need to cogitate on auth more.
