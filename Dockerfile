FROM ruby:2.6.5

ENV APP_PATH /var/APP_PATH
ENV BUNDLE_VERSION 2.2.4
ENV BUNDLE_PATH /usr/local/bundle/gems
ENV TMP_PATH /tpm/
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_PORT 3000

COPY ./dev-docker-entrypoint.sh /usr/local/bin/dev-entrypoint.sh
COPY ./test-docker-entrypoint/sh /usr/local/bin/test-docker-entrypoint.sh

RUN chmod +x /usr/local/bin/dev-entrypoint.sh && chmod +x /usr/local/bin/test-entrypoint.sh

# install dependencies for application
RUN apk -U add --no-cache \
build-base \
git \
postgresql-dev \
postgresql-client \
libxml2-dev \
libxslt-dev \
nodejs \
yarn \
imagemagick \
tzdata \
less \
&& rm -rf /var/cache/apk/* \
&& mkdir -p $APP_PATH


RUN gem install bundler --version "$BUNDLE_VERSION" \
&& rm -rf $GEM_HOME/cache/*

# navigate to app directory
WORKDIR $APP_PATH

EXPOSE $RAILS_PORT

ENTRYPOINT [ "bundle", "exec" ]
