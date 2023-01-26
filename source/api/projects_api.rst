API: /api/projects
==================

Projects represent something on which a user works on while at the space.  
Multiple users may work on the same project.

Note, this API does **not** expose a way to create projects. Projects are 
created as part of the signout operation when a user signs out of a visit. See 
the `/api/visit/{visit_id}/_signout` for creating a project

API: /api/projects
------------------

This endpoint returns a list of project summaries currently within the 
LoginSystem. A project summery consists of only an id and a name. A link to the
full project details is also provided.

Currently no query parameters are accepted. This means it is not currently 
possible to filter or narrow down the number or type of projects returned.

.. code-block:: bash

  curl -XGET https://workspace-login.riesenlabs.com/api/projects -H 'cookie: api-token=test-token' | jq
  [
    {
      "id": 4,                
      "name": "3d printing 101",
      "ref": "https://workspace-login.riesenlabs.com/api/project/4"   <- Reference to more info
    },
    {
      "id": 1,
      "name": "Robotics Team Robot",
      "ref": "https://workspace-login.riesenlabs.com/api/project/1"
    },
    ...
  ]

.. warning::
   This api currently provides no pagination or limiting of results and will 
   return every user which matches the request. The number of users is 
   antisapated to be on the small side, so pagination hasn't been a priority 
   yet.

API: /api/projects/{project_id}
-------------------------------

This endpoint fetches all information for a specific project identified by its
project id.


.. code-block:: bash

  curl -XGET https://workspace-login.riesenlabs.com/api/projects/4 -H 'cookie: api-token=test-token' | jq
  {

    "id": 4,
    "name": "3d printing 101",
    "description": "A fun Project",
    "type":"Personal"
  }

