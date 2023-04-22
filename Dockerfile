FROM ruby:2.2.1

RUN rm /etc/apt/sources.list
RUN echo "deb http://archive.debian.org/debian-security jessie/updates main" > /etc/apt/sources.list.d/jessie.list

RUN apt-get update -qq
WORKDIR /arca
COPY Gemfile /arca/Gemfile
COPY Gemfile.lock /arca/Gemfile.lock
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 8080
CMD ["rails", "server", "-b", "127.0.0.1"]