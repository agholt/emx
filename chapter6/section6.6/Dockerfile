FROM ubuntu:12.04

# install required packages
RUN apt-get -y update && \
    apt-get install -y build-essential \
                       bc \
	               gawk \
	               git-core \
                       gcc-multilib \
                       g++-multilib \
                       libssl-dev \
                       libncurses-dev \ 
                       libc6-dev-i386 \
                       vim 

WORKDIR /opt
COPY linux-3.16.tar.gz /linux-3.16.tar.gz
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
