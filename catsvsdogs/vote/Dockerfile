# Use python 2.7 runtime base image
FROM python:2.7-alpine

# Set the app directory
WORKDIR /app

# Install app dependencies
ADD ./src/requirements.txt /app
RUN pip install -r requirements.txt

# Copy app code
ADD ./src /app

# Make port 80 available
EXPOSE 80

# Define container default command
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:80", "--log-file", "-", "--access-logfile", "-", "--workers", "4", "--keep-alive", "0"]
