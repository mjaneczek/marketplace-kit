FROM ruby:2.5-alpine

RUN apk add --update build-base libxml2-dev libxslt-dev git && rm -rf "/var/cache/apk/*" && mkdir /usr/app
ADD . /usr/app
WORKDIR /usr/app


# RUN bundle install --without test development
#RUN gem build marketplace_kit && gem install marketplace-kit
