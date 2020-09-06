FROM ruby:alpine3.12
RUN apk update && apk add mysql-client
WORKDIR /app
COPY ./app/Gemfile /app
COPY ./app/Gemfile.lock /app
RUN bundle install
COPY ./app /app
CMD [ "ruby", "-v" ]
