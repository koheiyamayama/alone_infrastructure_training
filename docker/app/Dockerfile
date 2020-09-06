FROM ruby:buster
RUN apt update && apt install -y default-mysql-client
WORKDIR /app
COPY ./app/Gemfile /app
COPY ./app/Gemfile.lock /app
RUN bundle install
COPY ./app /app
CMD [ "ruby", "-v" ]
