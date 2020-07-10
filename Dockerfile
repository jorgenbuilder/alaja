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

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]