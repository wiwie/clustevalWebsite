FROM ruby:2.2.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /clusteval
WORKDIR /clusteval
ADD Gemfile /clusteval/Gemfile
ADD Gemfile.lock /clusteval/Gemfile.lock
ADD . /clusteval
RUN mv /clusteval/config/database.yml.example /clusteval/config/database.yml
RUN bundle install
RUN rake assets:precompile
RUN RAILS_ENV=production rake assets:precompile
