FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /jimo_share
WORKDIR /jimo_share
COPY Gemfile /jimo_share/Gemfile
COPY Gemfile.lock /jimo_share/Gemfile.lock
RUN bundle install
COPY . /jimo_share

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]