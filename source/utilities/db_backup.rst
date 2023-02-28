backup_db utility
=================

This utility performs a database dump of the configured target db and writes it
to a local file on disk.  This can be used for createing backup files from 
which the database can be restored.

This utility depends on the following utilities to be installed and configured:

+--------------+--------------------------------------------------------------+
| Utility      | Reason                                                       |
+==============+==============================================================+
| mariadb_dump | Used to communicate with the db and dump the schema and all  |
|              | data to a file.  It should also be possible to use mysql_dump|
|              | but the application will need to be updated to use that      |
|              | instead utility.                                             |
+--------------+--------------------------------------------------------------+
| kubectl      | Must be authenticated to the cluster where the application is|
|              | located. This is used to port-forward the db port in order to|
|              | gain access to the database, which is generally not          |
|              | publically expoesd                                           |
+--------------+--------------------------------------------------------------+

The utility is configured using environment variables which must be set before
the application is launched.

+----------------------+------------------------------------------------------+
| Environment Variable | Description                                          |
+======================+======================================================+
| DB_SERVICE           | The k8s service at which the database is running     |
+----------------------+------------------------------------------------------+
| DB_SECRET            | The k8s secret name at which the root db password can|
|                      | be found. Note: this is NOT the root db password     |
|                      | itself.                                              |
+----------------------+------------------------------------------------------+
| DB_EXPORT_LOCATION   | The file location to which the db export file will be|
|                      | written.                                             |
+----------------------+------------------------------------------------------+

The utility itself is launched using the command 
`python -m ws_login_scripts.backup_db`.  The utility will display a prompt as 
such: 

.. code-block:: bash

  This utility will attempt execute the mysqldump / mariadbdump commnad in 
  order to create a backup file.  This command requires that the dbdump utility 
  is installed AND that kubectl is installed.

  DB_SERVICE: ws-login-dev-db
  DB_SECRET: ws-login-dev-db
  DB_EXPORT_LOCATION: /tmp/db-export/test-1.sql

  Are you sure you want to proceed?  (Y/n):

All values must be set before the utility will allow the option to proceed. 

