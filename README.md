# README

This is an API project that uses rails and graphql

### Starting the application
* Run bundle install to install the dependencies

* Database creation: rails db:create
* Seed data rake db:seed

* to run the server use:
rails s

### Using the application

* A request to see the users and their posts can be done at the following endpoint:
[http://localhost:3000/graphql?query={users{posts{text}}}
](http://localhost:3000/graphql?query={users{posts{text}}})


* or through the graphical interactive in-browser GraphQL IDE
at: 
[http://localhost:3000/graphiql](http://localhost:3000/graphiql)

### Required Versions

* Ruby version: 2.5.0
* Rails version: 2.5.0

* Gems that are used:
  * graphql
  * 'graphiql-rails'
  * graphql-batch
  * graphql-preload