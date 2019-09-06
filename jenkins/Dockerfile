FROM jenkins/jenkins:2.176.3-slim

# Disable setup wizard
RUN echo '2.0' > /usr/share/jenkins/ref/jenkins.install.InstallUtil.lastExecVersion

# Install custom plugins
COPY ./resources/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Copy configuration as code
COPY ./resources/jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml

# Switch to root user
USER root
