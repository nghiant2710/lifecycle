# Base our container on a Slim Python + Debian (Jessie) Image
FROM resin/armv7hf-debian:jessie

RUN apt-get update && apt-get install -y python 

# Set our working directory
WORKDIR /usr/src/app

# Copy all our project into /usr/src/app/ folder in the container.
COPY . .
# So in our container we should now have:
# /usr/src/app/
#           |── Dockerfile
#           └── project
#               |── startup.sh
#               └── main.py

#ENV INITSYSTEM=on

COPY start.sh /usr/bin/entry.sh

CMD ["python","project/main.py"]
