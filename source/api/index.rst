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
