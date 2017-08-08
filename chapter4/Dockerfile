FROM ubuntu:16.04

# install required packages
RUN apt-get -y update && \
    apt-get install -y build-essential \
                       bc \
                       gawk \ 
                       git-core \
                       libssl-dev \
                       libncurses5-dev \ 
                       libssl-dev \
                       vim \
                       wget 

WORKDIR /opt
COPY linux-4.4.tar.gz /linux-4.4.tar.gz
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh

