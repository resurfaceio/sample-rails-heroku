FROM resurfaceio/python-ruby:2.3.0
RUN mkdir -p /app
WORKDIR /app
COPY . /app/
RUN bundle install
EXPOSE 3000
CMD rails server -b 0.0.0.0