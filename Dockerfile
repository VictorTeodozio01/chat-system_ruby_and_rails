FROM ruby:3.1
RUN apt-get update -qq && apt-get install -y nodejs npm
RUN mkdir /app
WORKDIR /app
COPY backend/Gemfile /app/Gemfile
COPY backend/Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
CMD ["rails", "server", "-b", "0.0.0.0"]
