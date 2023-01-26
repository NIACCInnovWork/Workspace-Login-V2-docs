.. Workspace Login documentation master file, created by
   sphinx-quickstart on Tue Jan 24 18:36:27 2023.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to Workspace Login's documentation!
===========================================

.. toctree::
   :maxdepth: 3
   :hidden:

   api/index
   server_config

This page serves to describe and document various components and aspects of the
inovation workspace login application.  The application was created in house 
specifically to track usage of equipment and materials within the space.

The application and the documentation are both in their infancy and will be 
further built upon in the future.

High Level Architecture
-----------------------

The login application operates as a web server which is accessed primarily 
through a python/tkinter client. The web application is backed by a MySql 
database.

This structure allows for a few different goals:
 * Allow for the login application to be at multiple entrances to the workspace
 * Allows remote access to the data by administrators
 * The api itself, and programming against it may serve as a project within the \
   innovation workspace

The web API follows a REST philosophy in an effort to be as easily accessible as
possible regardless of client. Currently no integration exists with OpenApi 
(formally swagger) although such innovations might be added in the future.

