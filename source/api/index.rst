Rest API
========

All rest endpoints are prefixed with `/api`. Going to `/api` exactly will return
a listing of the major root entities within the application.  An example is 
shown below:

.. code-block:: bash

  curl https://workspace-login.riesenlabs.com/api -H 'cookie: api-token=test-token' | jq
  {
    "About": "https://workspace-login.riesenlabs.com/api/about",
    "Equipment": "https://workspace-login.riesenlabs.com/api/equipment",
    "Healthcheck": "https://workspace-login.riesenlabs.com/api/healthcheck",
    "Projects": "https://workspace-login.riesenlabs.com/api/projects",
    "Users": "https://workspace-login.riesenlabs.com/api/users",
    "Visits": "https://workspace-login.riesenlabs.com/api/visits"
  }

.. toctree::
   :hidden:
    
   authentication
   users_api
   projects_api
   equipment_api
   visits_api

Future Updates
--------------
Currently there is not a real strict scheme in place in terms of how 
relationships between entities are expressed in the API.  Generally, links are
provided as part of an entity body and contain the suffix "ref" to indicate a
reference to another entity or collection.

In the future, the goal is to move the application to a more formal method of
expressing these relationships. The term for these strategies is generally 
called "Hypermedia Patterns".

The choice of hypermedia pattern is currently being evaluated. Some potential 
choices are:

* `HAL (Hypertext Application Language) <https://en.wikipedia.org/wiki/Hypertext_Application_Language>`_
* `Collection+JSON <https://github.com/collection-json/spec>`_
* `Siren <https://github.com/kevinswiber/siren>`_
* Uber
* Mason
