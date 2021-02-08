# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# APP PROCESS:

- Create of a new rails app, api only, with postgreSQL for DB.

  rails new spectrm-challenge --database postgresql --api

- UUID

  I utilice the class method SecureRandom incorporated in Rails.
  Create migration that enables enable_extension 'pgcrypto'
  Change id column from the table Message to the value of an UUID
  Add a before_create method on Message Class that will apply a uuid string as the id of the class.

-
