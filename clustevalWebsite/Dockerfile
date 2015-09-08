FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /clusteval
WORKDIR /clusteval
ADD Gemfile /clusteval/Gemfile
RUN bundle install
ADD . /clusteval
RUN rake db:create
RUN rake db:migrate
RUN rake db:seed