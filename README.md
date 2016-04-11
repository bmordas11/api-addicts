#API-Addict

![Build Status](https://codeship.com/projects/8b992560-dcbb-0133-fcbe-2e9843291021/status?branch=master)
![Code Climate](https://codeclimate.com/github/bmordas11/api-addicts.png)
![Coverage Status](https://coveralls.io/repos/bmordas11/api-addicts/badge.png)

##Description
A web app for reviewing APIs of all kinds!

Via our web interface users can post APIs to the site. Other users can also review, post, upvote, and downvote any given API.

##Developed By
* **Brett Mordas**
* **Matt Thompson**
* **Majid Ihsan**
* **Eric Fournier**

##[Visit Hosted Site](https://api-addict.herokuapp.com/)

##Entity Relationships
![ER Diagram](http://gdurl.com/FI7r)

##Features
**Unauthenticated user registers**

**Authenticated user signs in & out**

**Authenticated user adds a new API**
* API has mandatory fields for `name` & `url & ``body`
* API can be marked with `free` or `paid`
* API can be tagged with categories (as many as creator sees fit)

**User views API list page**
* Results are paginated to 5 per page
* API name links to API's show page

**User views API show page**
* Sees `title`, `url`, `tags`, & `creator`
* Can submit a rating and optionally, a review description
* Can upvote or downvote API

**Administrator Role**
* Can delete reviews admin deems inppropriate
* Can delete users who post innopropriate information

##Technologies Utilized
* Devise
* Rspec / Capybara
* DB Relationships / Join Tables
* Hound
* Coveralls
* factory_girl
* will_paginate
* CarrierWave
* Search Functionality
* Puma
* Heroku
