#Api-Addicts

![Build Status](https://codeship.com/projects/8b992560-dcbb-0133-fcbe-2e9843291021/status?branch=master)
![Code Climate](https://codeclimate.com/github/bmordas11/api-addicts.png)
[![Coverage Status](https://coveralls.io/repos/github/bmordas11/api-addicts/badge.svg?branch=master)](https://coveralls.io/github/bmordas11/api-addicts?branch=master)

##Description

This is a site we built for users to post and review one of the driving force factors behind web innovation today: APIs.

The site allows users to create and account, post new APIs they know about, rate and review APIs posted by other users, and upvote/downvote listed APIs.

##Authors

* **Matt Thompson**

* **Brett Mordas**

* **Majid Ihsan**

* **Eric Fournier**

##Heroku Link

###[Visit Website](http://api-addicts.herokuapp.com/)

##ER Diagram

![ER_Diagram](http://gdurl.com/FI7r)

##Features

* User signs up

* User uploads a profile picture

* User adds an API

* User reviews existing API

* User upvotes or downvotes API (user can only vote once)

* API creater recieves email when someone reviews their API

* Admin deletes content they deem innapopropriate

* Admin deletes user account if they violate terms of use

## Technologies Utilized

* Rails

* Ajax

* JQuery

* Devise (User Authentication)

* CarrierWave (Photo Uploads)

* Will_Paginate (Pagination)

* Amazon S3 Service

* Factory_Girl (Test Data)

* Mailgun (ActionMailer)
