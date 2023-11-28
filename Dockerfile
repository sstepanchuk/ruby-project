# syntax=docker/dockerfile:1
FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs
WORKDIR /myapp
COPY . .
RUN bundle install

# Add a script to be executed every time the container starts.
EXPOSE 3000
RUN bundle exec rails server -b '0.0.0.0' -p 3000
