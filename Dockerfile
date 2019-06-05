#webのコンテナ作成用
FROM ruby:2.6.3-slim
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
#RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp