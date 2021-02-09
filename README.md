# README

- [About App](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#about-app)
- [How to install project locally](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#install-app-locally)
- [Developing app process](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#app-process)
- [CRUD API Endpoints](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#endpoints)
- [Docker]()
- [Test]()

# About App:
[↑Go To Top↑](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#readme)

* Ruby version

  2.6.5

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

# Install App Locally
[↑Go To Top↑](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#readme)

# APP PROCESS:
[↑Go To Top↑](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#readme)

- Create of a new rails app, api only, with postgreSQL for DB.

  ```ruby
  rails new spectrm-challenge --database postgresql --api
  ```

- **UUID**

  I utilice the class method **SecureRandom** incorporated in Rails.
  Create migration that enables enable_extension 'pgcrypto'
  Change id column from the table Message to the value of an UUID
  Add a before_create method on Message Class that will apply a uuid string as the id of the class.

- **Charracters - HTML tags - E-mails - Links - Max. Length**

  I create a **validation** format for the :body with a REGEX that allows it to contain
  any character from any language, emails and links, exluding HTML tags and a max.
  length of 255 char.

- **Counter**

  Set a Counter column on table Message
  When a Message object is created, **Counter == 0**
  Everytime you GET an instance of the Message class, the counter updates to **+= 1**




# ENDPOINTS:
[↑Go To Top↑](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#readme)

  ### Testing in POSTMAN:

  If you don't have the **Postman** desktop app, please go to this [website](https://www.postman.com/dark-shuttle-75858/workspace/spectrm-challenge/request/create?requestId=e1fabc34-985b-4624-9abb-ef4944462115)
  Log-in or Sign-up if necessary.
  This is a **public workspace** dedicated for this API.


  - ### **List** all messages:

  |   Verb    |    URL    |    Key    |    Value    |
  |-----------|-----------|-----------|-------------|
  |   GET     |    http://localhost:3000/api/v1/messages    |    -    |    -    |


  - **Retrieve** a Message instance:

  |   Verb    |    URL    |    Key    |    Value    |
  |-----------|-----------|-----------|-------------|
  |   GET     |    http://localhost:3000/api/v1/messages/:identifier    |    -    |    -    |

  :identifier =>

  - **Create** a Message instance:

  |   Verb    |    URL    |    Key    |    Value    |
  |-----------|-----------|-----------|-------------|
  |   POST     |    http://localhost:3000/api/v1/messages    |    body    |    TEXT    |


  - **Update** a Message instance:

  |   Verb    |    URL    |    Key    |    Value    |
  |-----------|-----------|-----------|-------------|
  |   PATCH     |    http://localhost:3000/api/v1/messages:identifier    |    body    |    NEW_TEXT    |

  :identifier =>

  - **Delete** a Message instance:

  |   Verb    |    URL    |    Key    |    Value    |
  |-----------|-----------|-----------|-------------|
  |   DELETE     |    http://localhost:3000/api/v1/messages/:identifier    |    -    |    -    |

  :identifier =>

# Docker
[↑Go To Top↑](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#readme)

# Testing App
[↑Go To Top↑](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#readme)
