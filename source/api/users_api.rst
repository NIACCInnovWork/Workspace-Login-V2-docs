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

This endpoint creates a new user in the system.


PUT: /api/users/{user_id}
-------------------------

This endpoint updats an existing user the system.
