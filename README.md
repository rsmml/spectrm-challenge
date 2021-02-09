# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

  2.6.5

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)


# APP PROCESS:

- Create of a new rails app, api only, with postgreSQL for DB.

  ```ruby
  rails new spectrm-challenge --database postgresql --api
  ```

- **UUID**

  I utilice the class method SecureRandom incorporated in Rails.
  Create migration that enables enable_extension 'pgcrypto'
  Change id column from the table Message to the value of an UUID
  Add a before_create method on Message Class that will apply a uuid string as the id of the class.

- **Charracters - HTML tags - E-mails - Links - Max. Length**

  I create a validation format for the :body with a REGEX that allows it to contain
  any character from any language, emails and links, exluding HTML tags and a max.
  length of 255 char.

- **Counter**

  Set a Counter column on table Message
  When a Message object is created, Counter == 0
  Everytime you GET an instance of the Message class, the counter updates to += 1




# ENDPOINTS:

  Testing in POSTMAN:

  - **List** all messages:

  > GET http://localhost:3000/api/v1/messages

  - **Retrieve** a Message instance:

  > GET http://localhost:3000/api/v1/messages/:identifier

  - **Create** a Message instance:

  > POST http://localhost:3000/api/v1/messages/?:key=:value

  'key   = body'
  'value = .text'

  - **Update** a Message instance:

  > PATCH http://localhost:3000/api/v1/messages/:identifier?:key=:value

  'key   = body'
  'value = .text'

  - **Delete** a Message instance:

  > DELETE http://localhost:3000/api/v1/messages/:identifier


