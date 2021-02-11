# README

- [About App](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#about-app)
- [How to install the project locally](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#install-app-locally)
- [Developing app process](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#app-process)
- [CRUD API Endpoints](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#endpoints)
- [Docker :whale:](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#docker-whale)
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
  rails db:create db:migrate db:seed
  ```

* Server initialization

  ```ruby
  rails s
  ```

* Heroku

  [Spectrm Challenge](https://spectrm-challenge-rsmml.herokuapp.com/api/v1/messages)

# Install App Locally
[↑ Go To Top ↑](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#readme)

**[GitHub Repo](https://github.com/rsmml/spectrm-challenge)**

- Clone the repo with this command:
(Go to a directory where you will like to put this project, like for example ```~ && cd Desktop/``` )
```ruby
git clone git@github.com:rsmml/spectrm-challenge.git spectrm-challenge-rodrigo-sommacal
```
```ruby
cd spectrm-challenge-rodrigo-sommacal
```
You will get the repo with a ```docker-compose``` branch.
To check branches run ```git branch -a```. The master branch is created with the intention
to run the app locally, without Docker and docker-compose.
If you want to skip the [app installation locally](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#install-app-locally)
go straight to the [Docker](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#docker-whale) section.


- You can also download the app with the following link:
  - [Get App Here](https://github.com/rsmml/spectrm-challenge/archive/master.zip)

  - Unzip file.
  - Open Console.
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

  **rbenv Installation:**

  on the command line run:

  (Install **[BREW](https://brew.sh/)**, if you don't have it.)

  ```ruby
  brew install rbenv
  ```

  to check if it worked run:

  ```ruby
  rbenv --version
  ```

  **Install Ruby**

  Once rbenv is installed we have to install the Ruby version to be able to run
  this app locally. Run, on the terminal:

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

If this doesn't work, you might need to install other tools or software
that some of the gems require. Follow the messages and install them.
Run **bundle** until everything is OK!


* **Set up Database**

The following command will create databases based on database.yml,
load schema.rb, and seed the data by running seeds.rb.

```ruby
  rails db:setup
```

Run ```bundle install``` & ```rails db:migrate``` in case there are pending migrations. But I believe
it won't be necessary.


You don't have PostgreSQL, no problem:

```ruby
brew install postgresql
```

You can always check before with **postgres -V** if it is installed or not.
Then run:

```ruby
brew services start postgresql
```

* Once everything is Ok! you should be able to start the server.

Run now ```rails s``` and by default, the
server for the API will be hosted on ```http://localhost:3000```

It should be running in ```localhost:3000``` to be able to fetch and send data
from Postman. Run

```ruby
rails s --p 3000
```
in case the default port is not 3000.

# APP PROCESS:
[↑ Go To Top ↑](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#readme)

- I created a new rails app, API only, with postgreSQL for DB.

  ```ruby
  rails new spectrm-challenge --database postgresql --api
  ```

- **UUID**

  I utilised the class method **SecureRandom** incorporated in Rails.
  Create migration that enables enable_extension 'pgcrypto'
  Change id column from the table Message to the value of a UUID
  Add a before_create method on Message Class that will apply a uuid string as the id of the class.

- **Charracters - HTML tags - E-mails - Links - Max. Length**

  I create a **validation** format for the :body with a REGEX that allows it to contain
  any character from any language, emails, links, exluding HTML tags, and a max.
  length of 255 char.

- **Counter**

  Set a Counter column on table Message
  When a Message object is created, **Counter == 0**.
  Everytime you GET an instance of the Message class, the counter updates to **+= 1**




# ENDPOINTS:
[↑ Go To Top ↑](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#readme)

  ### Testing in POSTMAN:

If you don't have the **Postman** desktop app, please go to this [website](https://www.postman.com/dark-shuttle-75858/workspace/spectrm-challenge/request/create?requestId=e1fabc34-985b-4624-9abb-ef4944462115).
Log-in or Sign-up if necessary.
This is a **public workspace** dedicated to this API.


- ### **List** all messages:

  |   Verb    |    URL    |    Key    |    Value    |
  |-----------|-----------|-----------|-------------|
  |   GET     |    http://localhost:3000/api/v1/messages    |    -    |    -    |
  |   GET     |    https://spectrm-challenge-rsmml.herokuapp.com/api/v1/messages    |    -    |    -    |

- ### **Retrieve** a Message instance:

  |   Verb    |    URL    |    Key    |    Value    |
  |-----------|-----------|-----------|-------------|
  |   GET     |    http://localhost:3000/api/v1/messages/:identifier    |    -    |    -    |
  |   GET     |    https://spectrm-challenge-rsmml.herokuapp.com/api/v1/messages/4021b575-485a-4848-b75e-60be5b31b035    |    -    |    -    |

  :identifier => [Get Identifier](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#identifier)

- ### **Create** a Message instance:

  |   Verb    |    URL    |    Key    |    Value    |
  |-----------|-----------|-----------|-------------|
  |   POST     |    http://localhost:3000/api/v1/messages    |    body    |    TEXT    |
  |   POST     |    https://spectrm-challenge-rsmml.herokuapp.com/api/v1/messages   |    body    |    TEXT    |


- ### **Update** a Message instance:

  |   Verb    |    URL    |    Key    |    Value    |
  |-----------|-----------|-----------|-------------|
  |   PATCH     |    http://localhost:3000/api/v1/messages/:identifier    |    body    |    NEW_TEXT    |
  |   PATCH     |    https://spectrm-challenge-rsmml.herokuapp.com/api/v1/messages/4021b575-485a-4848-b75e-60be5b31b035    |    body    |    NEW_TEXT    |

  :identifier => [Get Identifier](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#identifier)

- ### **Delete** a Message instance:

  |   Verb    |    URL    |    Key    |    Value    |
  |-----------|-----------|-----------|-------------|
  |   DELETE     |    http://localhost:3000/api/v1/messages/:identifier    |    -    |    -    |
  |   DELETE     |    https://spectrm-challenge-rsmml.herokuapp.com/api/v1/messages/4021b575-485a-4848-b75e-60be5b31b035    |    -    |    -    |

  :identifier => [Get Identifier](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#identifier)

- ### **Identifier**

  **LOCALLY**

  Because when you install the APP there is no DB we have to create one and run the seed.rb file
  that will create 50 new messages with unknowns id.
  In order to know one of the identifiers, we will take the last instances of the Message created, and from it, we will
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

  **HEROKU**

  - "id": "4021b575-485a-4848-b75e-60be5b31b035"
  - "id": "0ce1fed9-4f3b-488b-890f-1a07f4621ca8"
  - "id": "cee782bc-b349-4768-8d39-95468986af5e"

# Docker :whale:
[↑ Go To Top ↑](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#readme)

In order to be able to run Docker and docker-compose.yml please switch to the ```docker-compose``` branch with:
- Check Branches
```ruby
git branch -a
```
- Switch branch:
```ruby
git co remotes/origin/docker-compose
```
- Start container
```ruby
docker-compose up
```
This will run the docker-compose.yml file, which will build the App and start the localhost:3000. If there's an error, please run

```ruby
docker-compose down
```
```ruby
docker-compose build
```
(If theres a FATAL error from PostgreSQL, run ```brew services stop postgres```, and start again the container. If theres a
```Traceback (most recent call last):[...]``` error, you might need to start your Docker :whale: desktop.)

One last time, run again ```docker-compose up```

This should be fine :ok_hand: Now the app is running in **localhost:3000** :tada:

Now we should migrate our DB with, open another tab on the terminal and run:

```ruby
docker-compose run web rails db:migrate db:seed
```
This will start our DB and put some nice messages on it :smiley:

Done! Now to check that everything works, go to:

[localhost:3000](http://localhost:3000/api/v1/messages)


# Testing App
[↑ Go To Top ↑](https://github.com/rsmml/spectrm-challenge/blob/master/README.md#readme)

I created a series of tests to verify that all messages created are done under the right
conditions.

**How to test app:**
On the terminal (in the directory of the project) run:
- Locally
```ruby
rspec
```

- Docker:

```ruby
docker-compose run web rspec
```

You should be able to see 2 types of tests. The first one, **Messages API** will verify
all the basic CRUD actions.
- Creating 10 messages and ```GET``` all of them with a ```:success``` status.
- Creating 1 message and ```GET``` it with a ```:success``` status.
- Creating 1 message with a ```POST``` request.
- Updating 1 message, first Created with a ```POST``` request, then updating the same
message with a ```PATCH``` request
- And finally, deleting 1 message, first Created with a ```POST``` request, then deleted that
same message with a ```DELETE``` request.

In the second part **Check Validations**, all validations are tested:
- A Message instance is created where its ```UUID``` should match a REGEX for UUIDs
- A Message instance is created with different types of characters from ```all types of languages```
- A Message instance is created with an ```HTML Tag``` on its body. It checks that the validation error matches the validation of the model.
- A Message instance is created with more than ```255 characters```. It checks that the validation error matches the validation of the model.
- A Message instance is created with an ```e-mail``` and a ```link``` and it gets a 200 status.
- A Message instance is created. Then we GET that message and check that it has a ```counter``` not nil and to that its value is 1 due that it's the first time
that message is retrieved.
