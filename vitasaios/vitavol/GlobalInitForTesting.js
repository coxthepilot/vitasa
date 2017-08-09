{
    "Sites" :
    [
        {
            "id" : "0",
            "name" : "Cody Black",
            "slug" : "cody-black",
            "street" : "11441 Vance Jackson Rd",
            "city" : "San Antonio",
            "state" : "TX",
            "zip" : "78230",
            "latitude" : "29.5324397",
            "longitude" : "-98.590141",
            "hours" : "mwf",
            "sitecoordinator" : "CB coordinator",
            "hours" : "MWF, 9:00 to 3:00",
            "sitebackupcoordinator" : "CB Backup coordinator",
            "sitetype" : "permanent",
            "sitestatus" : "closed",
            "google_place_id" : "ChIJETMeHs5gXIYRRDPQxNwy4FU",
            "managingregion" : "San Antonio"
        },
        {
            "id" : "1",
            "name" : "Thousand Oaks Library",
            "slug" : "thousand-oaks-library",
            "street" : "4618 Thousand Oaks",
            "city" : "San Antonio",
            "state" : "TX",
            "zip" : "78233",
            "latitude" : "29.545058",
            "longitude" : "-98.4036457",
            "hours" : "mwf",
            "sitecoordinator" : "TOL coordinator",
            "hours" : "MTuTh 12:00 to 3:00",
            "sitebackupcoordinator" : "TOL backup coordinator",
            "sitetype" : "permanent",
            "sitestatus" : "accepting",
            "google_place_id" : "ChIJh8mGDl6LXIYRj-mzXGDC-So",
            "managingregion" : "San Antonio"
        }
    ],
    "Users" :
    [
        {
            "id" : "0",
            "email" : "fred@gmail.com",
            "managingregion" : "San Antonio",
            "permissions" :
            [
                "SiteCoordinator",
                "User"
            ]
        },
        {
            "id" : "1",
            "email" : "judy@gmail.com",
            "managingregion" : "San Antonio",
            "permissions" :
            [
                "User"
            ]
        },
        {
            "id" : "2",
            "email" : "tom@gmail.com",
            "managingregion" : "San Antonio",
            "permissions" :
            [
                "SiteCoordinator",
                "User",
                "Admin"
            ]
        },
        {
            "id" : "3",
            "email" : "bob@gmail.com",
            "managingregion" : "San Antonio",
            "permissions" :
            [
                "User"
            ]
        },
        {
            "id" : "4",
            "email" : "billy@gmail.com",
            "managingregion" : "San Antonio",
            "permissions" :
            [
                "User"
            ]
        }
    ],
    "Calendar" :
    [
        {
            "id" : "0",
            "siteid" : "0",
            "date" : "2017-8-10",
            "opentime" : "10:00",
            "closetime" : "17:00",
            "efilerstatus" : "AdditionalHelpNeeded",
            "efilersneeded" : "4",
            "efilerintents" :
            [
            ]
        },
        {
            "id" : "1",
            "siteid" : "0",
            "date" : "2017-8-11",
            "opentime" : "10:00",
            "closetime" : "17:00",
            "efilerstatus" : "AdditionalHelpNeeded",
            "efilersneeded" : "4",
            "efilerintents" :
            [
                "tom@gmail.com"
            ]
        },
        {
            "id" : "2",
            "siteid" : "0",
            "date" : "2017-8-12",
            "opentime" : "10:00",
            "closetime" : "17:00",
            "efilerstatus" : "AdditionalHelpNeeded",
            "efilersneeded" : "4",
            "efilerintents" :
            [
                "bob@gmail.com",
                "tom@gmail.com"
            ]
        },
        {
            "id" : "10",
            "siteid" : "1",
            "date" : "2017-8-10",
            "opentime" : "11:00",
            "closetime" : "15:00",
            "efilerstatus" : "AdditionalHelpNeeded",
            "efilersneeded" : "4",
            "efilerintents" :
            [
                "bob@gmail.com",
                "fred@gmail.com"
            ]
        },
        {
            "id" : "11",
            "siteid" : "1",
            "date" : "2017-8-11",
            "opentime" : "11:00",
            "closetime" : "15:00",
            "efilerstatus" : "AdditionalHelpNeeded",
            "efilersneeded" : "3",
            "efilerintents" :
            [
                "fred@gmail.com"
            ]
        },
        {
            "id" : "12",
            "siteid" : "1",
            "date" : "2017-8-12",
            "opentime" : "11:00",
            "closetime" : "15:00",
            "efilerstatus" : "AdditionalHelpNeeded",
            "efilersneeded" : "3",
            "efilerintents" :
            [
                "fred@gmail.com"
            ]
        }
    ],
    "Suggestions" :
    [
        {
            "id" : "0",
            "submitter" : "fred@gmail.com",
            "title" : "more fruit",
            "date" : "2017-08-10",
            "managingregion" : "San Antonio",
            "text" : "we need more fresh fruit in the afternoon",
            "status" : "Submitted"
        },
        {
            "id" : "1",
            "submitter" : "fred@gmail.com",
            "title" : "water fountains",
            "date" : "2017-08-11",
            "managingregion" : "San Antonio",
            "text" : "Where are the water fountains?",
            "status" : "Closed"
        }
    ]
}
