FROM ruby:alpine3.12
WORKDIR /app
COPY ./app/Gemfile /app
COPY ./app/Gemfile.lock /app
RUN bundle install
COPY ./app /app
CMD [ "ruby", "-v" ]

