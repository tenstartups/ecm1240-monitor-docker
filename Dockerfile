# Pull base image.
FROM debian:jessie

MAINTAINER Marc Lennox <marc.lennox@gmail.com>

# Set environment.
ENV DEBIAN_FRONTEND noninteractive

# Install packages.
RUN apt-get update
RUN apt-get install -y curl mysql-client nano python sqlite3 wget

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Define working directory.
WORKDIR /opt/btmon

# Add files to the container.
ADD . /opt/btmon

# Define volumes.
VOLUME ["/etc/bind", "/var/lib/bind", "/var/run/named"]

# Define the command script.
CMD ["/bin/sh", "-c", "/opt/btmon/btmon"]
