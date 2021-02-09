# README

- [About App](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#about-app)
- [How to install project locally](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#install-app-locally)
- [Developing app process](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#app-process)
- [CRUD API Endpoints](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#endpoints)
- [Docker](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#docker)
- [Test](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#testing-app)

# About App:
[↑ Go To Top ↑](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#readme)

* Ruby version

  ```ruby
  2.6.5
  ```
* System dependencies

  ```ruby
  bundle install
  ```

* Database creation

  ```ruby
  rails db:create db:migrate
  ```

* Database initialization

  ```ruby
  rails db:seed
  ```

# Install App Locally
[↑ Go To Top ↑](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#readme)

You can **SKIP** this step if you want to use [Docker](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#docker).

**[GitHub Repo](https://github.com/rsmml/spectrm-challenge)**

- You can download the app with the following link:
  - [Get App Here](https://github.com/rsmml/spectrm-challenge/archive/master.zip)

  - Unzip file.
  - Open Terminal.
  - Change Directory to the project folder **spectrm-challenge-master**

### Install App:

This project is built in
  ```ruby
  ruby '2.6.5'
  ```

  * In order to check the ruby version installed in your machine run:
    ```ruby
    ruby -v
    ```

  If you are running another version of Ruby, we can easily change it with **rbenv**

  **rbenv instalation**

  on the command line run:

  ```ruby
  brew install rbenv
  ```
  - Install **[BREW](https://brew.sh/)**, if you don't have it.

  to check if it worked run:

  ```ruby
  rbenv --version
  ```

  ** Install Ruby **

  Once rbenv is installed we have to install the Ruby version to be able to run
  this app localy. Run on the terminal:

  To check Ruby versions available:
  ```ruby
  rbenv install --list
  ```

  Install Ruby 2.6.5:
  ```ruby
  rbenv install 2.6.5
  ```
  ```ruby
  rbenv global 2.6.5
  ```

  And voilá :confetti_ball: the ruby version we need is installed. You
  can go back to your preferred Ruby version by doing
  ```ruby
  rbenv install RUBY_VERSION
  ```
  ```ruby
  rbenv global RUBY_VERSION
  ```

* Make sure you are using the desired Ruby version to install.
  ```ruby
  ruby --version
  ```

* To see if you already have Bundler installed
  ```ruby
  bundler --version
  ```
  or
  ```ruby
  bundle --version
  ```

* This will install the bundler gem in Ruby 2.6.5
  ```ruby
  gem install bundler
  ```


* Don't forget to run
  ```ruby
  bundle install
  ```

If this doesn't work, you might need to install another tools or software
that some of the gems require. Follow the messages and install them.
Run **bundle** until everything is OK !


* **Set up Database**

The following command will create databases based on database.yml ,
load schema.rb, and seed the data by running seeds.rb.

```ruby
  rails db:setup
```

Run `bundle e rails db:migrate` in case there are pending migrations. But I believe
it won't be necesary.


You don't have PostgreSQL, no problem:

  `brew install postgresql`

You can always check before with **postgres -V** if it is installed or not.
Then run:

```ruby
brew services start postgresql
```

* Once everything is Ok! you should be able to start the server.

Run now ```rails s``` and by default, the
server for the API will be hosted on ```http://localhost:3000```

It shold be running in ```localhost:3000``` to be able to fetch and send data
from Postman. Run

```ruby
rails s -p 3000
```
in case the default port is not 3000.

# APP PROCESS:
[↑ Go To Top ↑](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#readme)

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
[↑ Go To Top ↑](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#readme)

  ### Testing in POSTMAN:

If you don't have the **Postman** desktop app, please go to this [website](https://www.postman.com/dark-shuttle-75858/workspace/spectrm-challenge/request/create?requestId=e1fabc34-985b-4624-9abb-ef4944462115).
Log-in or Sign-up if necessary.
This is a **public workspace** dedicated for this API.


- ### **List** all messages:

  |   Verb    |    URL    |    Key    |    Value    |
  |-----------|-----------|-----------|-------------|
  |   GET     |    http://localhost:3000/api/v1/messages    |    -    |    -    |


- ### **Retrieve** a Message instance:

  |   Verb    |    URL    |    Key    |    Value    |
  |-----------|-----------|-----------|-------------|
  |   GET     |    http://localhost:3000/api/v1/messages/:identifier    |    -    |    -    |

  :identifier => [Get Identifier](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#identifier)

- ### **Create** a Message instance:

  |   Verb    |    URL    |    Key    |    Value    |
  |-----------|-----------|-----------|-------------|
  |   POST     |    http://localhost:3000/api/v1/messages    |    body    |    TEXT    |


- ### **Update** a Message instance:

  |   Verb    |    URL    |    Key    |    Value    |
  |-----------|-----------|-----------|-------------|
  |   PATCH     |    http://localhost:3000/api/v1/messages:identifier    |    body    |    NEW_TEXT    |

  :identifier => [Get Identifier](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#identifier)

- ### **Delete** a Message instance:

  |   Verb    |    URL    |    Key    |    Value    |
  |-----------|-----------|-----------|-------------|
  |   DELETE     |    http://localhost:3000/api/v1/messages/:identifier    |    -    |    -    |

  :identifier => [Get Identifier](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#identifier)

- ### **Identifier**

  Because when you install the APP there is no DB we have to create one and run the seed.rb file
  that will create 50 new messages with unknowns id.
  In order to know one of the identifiers, we will take the last instances of Message created, and from it, we will
  take the id or identifier.

  On the console run:

  ```ruby
  rails c
  ```
  Once the irb console is open, run

  ```ruby
  Message.last.id
  ```
  You should get a value like this one [fdfd69e2-ed20-4af4-a8e4-ffe7d9036eb7](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#identifier)
  This is the id or identifier of the Message instance.

# Docker
[↑ Go To Top ↑](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#readme)

# Testing App
[↑ Go To Top ↑](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#readme)
