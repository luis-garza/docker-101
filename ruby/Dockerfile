# Define ruby runtime as base image
FROM ruby:2.6.4-alpine

# Add meta information to the image
LABEL maintainer="captain.ahab@docker.com"

# Install ruby script dependencies
RUN gem install colorize

# Copy the ruby script
COPY ./src/weather.rb /app/

# Define ruby script as default command
ENTRYPOINT ["ruby", "/app/weather.rb"]
