FROM ruby:2.3-slim

RUN apt-get update &&\
    apt-get install -y --no-install-recommends make gcc g++

ENV RACK_ENV production

ENV APP_HOME /app
ENV HOME /root
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME
RUN bundle install

CMD ["ruby", "app.rb", "-s", "Puma"]
