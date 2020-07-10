FROM ruby:2.6

RUN gem install rails && \
    apt-get update && \
    apt-get install -y \
    nodejs \
    npm \
    postgresql && \
    npm i -g yarn

WORKDIR /alaja-web
COPY . ./
RUN bundle install && yarn