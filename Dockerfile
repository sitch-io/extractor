FROM ubuntu:16.04
MAINTAINER @ashmastaflash

# First, install the basic requirements:
RUN apt-get update && \
    apt-get install -y \
        apt-transport-https \
        curl

# I know this is gross, but it's how Node says we should do it...
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

# Now we install nodejs and npm
RUN apt-get update && \
    apt-get install -y \
        nodejs

# Install elasticdump
RUN npm install -g elasticdump

CMD /usr/bin/elasticdump --input="http://elasticsearch:9200/logstash* --output=$"
