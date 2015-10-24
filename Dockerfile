#
# Btmon ecm data collection and publishing service
#
# http://github.com/tenstartups/btmon-docker
#

FROM alpine:latest

MAINTAINER Marc Lennox <marc.lennox@gmail.com>

# Set environment variables.
ENV \
  TERM=xterm-color

# Install packages.
RUN \
  apk --update add curl mysql-client nano python py-pip sqlite wget && \
  rm -rf /var/cache/apk/*

# Install mysql python connector
RUN pip install --allow-external mysql-connector-python

# Add files to the container.
COPY entrypoint.sh /docker-entrypoint
COPY btmon.py /usr/local/bin/btmon

# Define the command script.
CMD ["/docker-entrypoint"]
