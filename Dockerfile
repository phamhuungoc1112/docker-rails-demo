FROM ruby:3.0

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /app
WORKDIR /app

COPY Gemfile* ./

RUN gem install bundler && bundle install

COPY . ./
