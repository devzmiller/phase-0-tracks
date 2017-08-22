1. What are some common HTTP status codes?

There are 5 categories of HTTP status codes. 100 level are informational and indicate that the request was received and is being processed, 200 level codes indicate the request was successful, 300 level codes are redirection codes and require action of the user agent (for example 301 Moved Permanently), 400 levelcodes are client error codes (for example, common ones are 404 Not Found and 401 Unauthorized, requiring user authentication), and 500 level codes are server error codes.

2. What is the difference between a GET request and a POST request? When might each be used?

GET requests data from a specified resource, while POST submits data to be processed to a specified resource. GET is less secure than POST, because there is important data in the URL, whereas POST keeps the data in the HTTP message body. GET requests should only be used to retrieve data; POST is useful for submitting data, like through a form. They can be cached or bookmarked and remain in the browser history. Reloading the page has no effect on a GET request. A POST request can't be cached or bookmarked, and reloading the page should prompt the user that their data is about to be resubmitted.

3. Optional bonus question: What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?

A cookie is a text string of key-value pairs a website stores on your computer, which the website can then retrieve the next time you visit it. Different browsers store cookies differently--Explorer stores them in text files, Chrome stores them in a SQLite database. Most often the information that's stored is a user ID, so that when you visit a website again the website knows you've been there before and can provide a certain experience based on that fact. When your browser requests a website from the server, it checks to see if there's any cookies for this website, and if there are it sends the cookie's data to the website. If there aren't already cookies, the website sends them when it fills the HTTP request.

Cookies are used most often to track visitors to a website, but can also be used to remember user preferences for a website, such as color or layout customization or your location.