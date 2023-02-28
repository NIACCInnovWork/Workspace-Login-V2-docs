Server Configuration
====================

The API server is written using Flask as a framework. All code related to the 
handling of http calls is in the `ws_login_flaskr` module.


Configuration
-------------

Environment Variables:

+-------------+------------------------------------------------------------+
| Variable    | Meaning                                                    |
+=============+============================================================+
| DB_HOST     | The host name at which the database can be found           |
+-------------+------------------------------------------------------------+
| DB_USER     | The db user with which the api server can connect          |
+-------------+------------------------------------------------------------+
| DB_PASSWORD | The database password with which the api server can connect|
+-------------+------------------------------------------------------------+
| API_TOKEN   | The token a caller must supply in a request in order for   |
|             | the request to be honored                                  |
+-------------+------------------------------------------------------------+
