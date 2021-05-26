FROM ruby:2.6.5
RUN mkdir -p /app
WORKDIR /app
COPY . /app/
RUN bundle install
EXPOSE 3000
CMD rails server -b 0.0.0.0