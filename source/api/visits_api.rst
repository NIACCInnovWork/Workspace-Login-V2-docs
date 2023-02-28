API: /api/visits
================

A visit within the workspace application represents a user spending time in the
space to work on one or more projects. A visit primarily consists of a start 
time and an end time.

When a user enters the workspace, they are to sign in.  This creates a new 
visit record for that user with a null end time.  The visit with the null end 
time is said to be ongoing as it represents the user is present in the 
workspace right now. The sign-in operation is handled by the 
`POST: /api/users/{user_id}/visits <create-visit>`_ endpoint.

When the user leaves the workspace, they are to sign-out.  This sign-out ends 
the ongoing visit for the user and collects information about the user about 
the visit.  This particular operation is the critical operation of the 
application as well as being among the more complex operations.


GET: /api/visits
----------------

This endpoint fetches all visits within the system. The visit returned consists 
of the visit id, start time, end time (or null) and the user id of the user 
whose visit it is.

The request looks like:

.. code-block:: bash

  curl -XGET https://workspace-login.riesenlabs.com/api/visits -H 'cookie: api-token=test-token' | jq
    [
      {
        "endTime": "Mon, 23 Jan 2023 17:40:41 GMT",
        "id": 1,
        "ref": "http://workspace-login.riesenlabs.com/api/visits/1",
        "startTime": "Mon, 23 Jan 2023 15:51:07 GMT",
        "userId": 1
      },
      {
        "endTime": "Mon, 23 Jan 2023 17:55:58 GMT",
        "id": 2,
        "ref": "http://workspace-login.riesenlabs.com/api/visits/2",
        "startTime": "Mon, 23 Jan 2023 17:52:58 GMT",
        "userId": 1
      },
      ...
  ]

.. warning::
   This api currently provides no pagination or limiting of results and will 
   return every user which matches the request. The number of users is 
   antisapated to be on the small side, so pagination hasn't been a priority 
   yet.

GET: /api/visits/{visit_id}
---------------------------

Fetches a specific visit by its id. The response payload is the same as 
/api/visits.

POST: /api/visits/{visit_id}/_signout
-------------------------------------

This sign-out operation collects all information about the time that the user 
spent in the space. Importantly, the following questions are asked:

 * On what projects did the user work?
 * For each project, what equipment was used and for how log?
 * What materials were used?

All of this information is collected from the user at the end of their visit 
instead of upfront, or during their visit. This is because the user, upon 
arriving at the space, may not fully know what they intend to work on, or plans 
may change during there stay at the space. The downside to collecting all of 
this information at the end is that it makes the API call more complicated.

This API accepts a `SignoutRequest`. This request contains all of the 
information above in a structured manor.

The SignoutRequest consists of a reference to the Visit from which to sign-out,
as well as a list of WorkSessions.  A WorkSession refers to time/resources 
spent working on a specific project. As such, a visit may consist of multiple 
WorkSessions for various projects, but a WorkSession always refers to a 
specific project.

There are two types of worksessions: ExistingProjectWorkSessions and 
NewProjectWorkSessions.  Both types of WorkSessions consist of a list of 
EqupmentUseLogs which capture which equipment was used for the work session.  
The equipment log consists of the equipment_id used and a list of materials and 
quantities consumed during the equipments usage.

The two WorkSesssion types differ in how they point to a project. An 
ExistingProjectWorkSession points to an existing project within the System and 
refers to that project by ID. A NewProjectWorkSessions indicates that a new 
project was started during this visit and that the project does not yet exist 
within the system. Instead of an ID, this WorkSession type consists of all of 
the information required to create a new project.  When the request is 
processed, that project will be created.  This is in fact the primary why in 
which new projects are created in the application.

The request should contain at least one type of WorkSession. If a particular 
WorkSession type is empty, its field may be omitted entirely

With this context in mind, the structure of a request to the sign-out endpoint 
looks like:

.. code-block:: bash

   curl -XGET https://workspace-login.riesenlabs.com/api/visits/4 -H 'cookie: api-token=test-token' -d '
   {
            "newProjectWorkSessions": [
                {
                    "project": {
                        "name": "Foobar",
                        "type": "Personal",
                        "description": "A fun Project",
                    },
                    "equipmentUseLog": [
                        {
                            "equipmentId":  15,
                            "timeUsed": 350, # Duration in seconds
                            "consumedMaterial": [
                                {
                                    "materialId": 20,
                                    "quantity": 30.0,
                                    "units": "in",
                                }
                            ]
                        }
                    ],
                }
            ],
            "existingProjectWorkSessions": [
                {
                    "projectId": 15,
                    "equipmentUseLog": [
                        {
                            "equipmentId":  15,
                            "timeUsed": 350, # Duration in seconds
                            "consumedMaterial": [
                                {
                                    "materialId": 20,
                                    "quantity": 30.0,
                                    "units": "in",
                                }
                            ]
                        }
                    ],
                }
            ]
        })
   }'


Error Conditions
^^^^^^^^^^^^^^^^
A visit may not be signed out of, if the visit is already closed. If an attempt
is made to sign-out from a closed visit, the server will respond with a 400 
error code.

