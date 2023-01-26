Authentication
==============

The application does not at this time have any type of user management.  Access
to all APIs is granted through the use of a single access token. This access 
token should be sent to the api using the 'api-token' cookie.

The use of setting the api-token as a cookie enables a standard web browser 
(such as chrome or FireFox) to be used as a method of exploring the data 
provided by the API.


Browser Authentication
----------------------

The API is intended to be browseable via a standard web browser.  However, in 
order to access anything, the browser must have an API token set. There is no
website or endpoint in which to set this token, and so currently must be 
manually set by the user.

This procedure will vary slightly from browser to browser, but in general, The
steps are as follows:

#. Navigate to the domain of the REST API. 
    (https://workspace-login.riesenlabs.com/api)
#. Open the developer tools for the browser. (Generally F12)
#. Navigate to storage.
#. Within the storage tab, navigate to Cookies
#. Click the "+" button to add a new cookie
#. Add the new cookie under the name "api-token" (ensure the cookie expiration time is in the future or set to not expire)

    .. image:: resources/set_cookies_in_browser.png
      :width: 600
#. Refresh the Browser
    .. image:: resources/AuthorizedBrowser.png
      :width: 600

