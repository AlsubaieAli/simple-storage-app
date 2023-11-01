# Simple Storage API Application

This is a simple API backend that handles file storage of Base64 format with multiple configurations.

---

## Features

- Changing the default upload configuration between Database, Local Storage, and S3.
- Uploading Base64 file to database.
- Uploading Base64 file to server local directory.
- Uploading Base64 file to S3 bucket (Coming Soon)
- User authentication with JWT token (Coming Soon)

## Tools

- Ruby on Rails Backend Framework
- Docker
- PostgreSQL Database
- Postman

## Guidelines

The application is containerized for the ease of use and consistency to make sure the application runs and provides the same behavior in all environments.

#### Running the application on Docker container

To run the application you need to have docker installed in your machine, you can follow [the Docker documentations](https://docs.docker.com/engine/install/) to do so.

Once Docker is setup you can open the terminal and navigate to the project direct and then run `docker compose up` to start the application along with all necessary services. You will be able to access the API endpoint on port `3001` (for example: `127.0.0.1:3001/v1/storage_options`).

#### Running the application on local machine

To run the application locally you will need to setup the correct environment manually.

You need to install the following:
- [Ruby](https://www.ruby-lang.org/en/documentation/installation/), installation varies from operating system to another.
- [Ruby on Rails](https://guides.rubyonrails.org/v5.0/getting_started.html#installing-rails), installation might depend on you ruby version
- [PostgreSQL](https://www.postgresql.org/download/)

After setting the environment and installing the necessary tools you can follow these steps to run the application:

- Open terminal on the project directory and run `bundle install` to install the dependencies (only needed once).
- Run `rails active_storage:install` to set up storage service.
- Run `rails db:migrate` to setup the database schema and tables.
- Run `rails db:seed` to seed the database with the initial data.
- Lastly you can run `rails server` or `rails s` to serve the application
- Now you can consume the API endpoint by hitting `127.0.0.1:3000`

#### Testing the application
- You will find the postman collection in the `docs` directory that contains a collection of requests to the dedicated endpoints along with the necessary payload and headers.

#### Running Test Suites
- TBD

#### Automated Testing
- An automated test job will run through GitHub workflow upon push and pull requests. (Coming Soon)


### Versions

- Ruby 3.1.4
- Ruby on Rails 7.1.1
- PostgreSQL 14
