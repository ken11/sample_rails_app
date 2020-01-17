FROM ruby:2.7.0-alpine3.11
ENV LANG=C.UTF-8 \
    APP_HOME=/sample_rails_app

RUN apk update && \
    apk add cmake vim build-base libxml2-dev libxslt-dev nodejs tzdata mariadb-dev yarn && \
    gem install bundler && \
    mkdir $APP_HOME

WORKDIR $APP_HOME

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
    BUNDLE_JOBS=2 \
    BUNDLE_PATH=/bundle \
    DOCKER=1

ADD . $APP_HOME
