FROM ruby:2.5.3

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler rubygems-bundler
RUN bundle install --jobs 3
RUN gem regenerate_binstubs

COPY Rakefile Rakefile
COPY config config

ADD . /app

EXPOSE 3000
CMD bundle exec rails s -b '0.0.0.0' -p 3000
