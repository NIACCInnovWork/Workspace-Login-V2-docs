API: /api/users
===============

This collection of endpoints provides access to the "users" within the 
Innovation Workspace Login system.  

Care must be taken with the term "user". A user in this case does not refer to 
an application user (someone you can login with to access the system, like an 
administrator).  Instead a user more acurately refers to a user of the space.

GET: /api/users
-----------------------

This endpoint provides a list of user summaries currently within the Innovation
Workspace Login system. The user summary object returned consists of only an 
id, a name, and a reference to the full object. Below is an example of the 
responce from an endpoint:

.. code-block:: bash

  curl -XGET https://workspace-login.riesenlabs.com/api/users -H 'cookie: api-token=test-token' | jq
  [
    {
      "id": 4,                
      "name": "Fred Jones",
      "ref": "https://workspace-login.riesenlabs.com/api/users/4"   <- Reference to more user info
    },
    {
      "id": 1,
      "name": "Bill Smith",
      "ref": "https://workspace-login.riesenlabs.com/api/users/1"
    },
    ...
  ]

.. warning::
   This api currently provides no pagination or limiting of results and will 
   return every user which matches the request. The number of users is 
   antisapated to be on the small side, so pagination hasn't been a priority 
   yet.

Query Parameters
^^^^^^^^^^^^^^^^

The results of users returned can be narrowed down by a few select query 
parameters. Thes particuarl searches were required in order for the client 
application to perform its job. Support for other quiery parameters may be 
added in the future as needed.


GET: /api/users/{user_id}
-------------------------

This endpoint fetches all details for a given user based on the supplied user 
id.


POST: /api/users
----------------

This endpoint creates a new user in the system. The request payload *must* 
contain 


PUT: /api/users/{user_id}
-------------------------

This endpoint updates an existing user the system. 


GET: /api/users/{user_id}/visits
--------------------------------

Fetches all visits for this user. 

This endpoit supports the inclusion of the `ongoing` query parameter. If 
specified and set true, only visits for the user which are ongoing will be 
returned. (There should only ever be 0 or 1 of these returned). If the 
parameter is included and set false, only completed visits for the user will 
be returned.

.. code-block:: sh

   GET: /api/users/123/visits                # Gets all visits for user 123
   GET: /api/users/123/visits?ongoing=true   # Gets ongoing visits for user 123
   GET: /api/users/123/visits?ongoing=false  # Gets completed visits for user 123

The response will consist of a list of visits.  There is no pagination so all 
matching visits are returned!

.. code-block:: json

   [
        {
            "id": 123,
            "startTime": "Mon, 19 Sep 2022 14:56:37 GMT",
            "endTime": null
        },
        {
            "id": 123,
            "startTime": "Mon, 18 Sep 2022 14:00:00 GMT",
            "endTime": "Mon, 18 Sep 2022 20:00:00 GMT"
        }
   ]

POST: /api/users/{user_id}/visits
---------------------------------

Creates a new visit for the given user.  The endpoint ignores anything in the 
request body as the new visit will always have a start time of now.

The responce payload will be the newly created visit and look like the 
following. The endtime will always be null for a newly created visit.

.. code-block:: json

   {
        "id": 123,
        "startTime": "Mon, 19 Sep 2022 14:56:37 GMT",
        "endTime": null
   }

The request for a new visit may be rejected.  The request will be rejected in 
the event that the included user does not exist in the system.  In this case,
the 404 Not-Found error code will be returned.  Aditionally, the request will 
be rejected if the user does already exist in the system but already has an 
ongoing visit.  (A user may only have a single onging visit at a time.)  In 
this case, the the 400 Bad-Request code will be returned
