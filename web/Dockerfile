# Define nginx as base image
FROM nginx:alpine

# Add meta information to the image
LABEL maintainer="captain.ahab@docker.com"

# Register an exposed port
EXPOSE 80

# Copy the web site into web root folder
COPY ./site /usr/share/nginx/html
