FROM ruby:3.0

LABEL maintainer="Junki Takiguchi"
LABEL version="1.0"
LABEL description="RubyOnRails_App環境構築"
# 開発するRailsアプリケーション名
ENV RAILS_APP langamer

# setup
RUN apt-get update -qq && apt-get install -y postgresql-client
RUN apt install -y vim
RUN apt install -y nginx
ENV APP_ROOT /workspace

RUN mkdir -p $APP_ROOT/$RAILS_APP
WORKDIR $APP_ROOT/$RAILS_APP

# node.js install
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && apt-get install -y nodejs

# install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt update && apt install -y yarn

# install rails
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

RUN yarn add jquery


# githubの公開キーのコピー
ADD .ssh /root/.ssh
RUN chmod 600 /root/.ssh

EXPOSE 3000
