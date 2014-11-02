# Pull base image.
FROM debian:jessie

MAINTAINER Marc Lennox <marc.lennox@gmail.com>

# Set environment.
ENV DEBIAN_FRONTEND noninteractive

# Install packages.
RUN apt-get update
RUN apt-get install -y curl mysql-client nano sqlite3 wget

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Define working directory.
WORKDIR /data

# Define mountable directories.
VOLUME ["/data"]

# Define the entrypoint script.
ENTRYPOINT ["./entrypoint"]
