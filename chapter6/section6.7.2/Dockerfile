FROM i386/debian

# install required packages
RUN apt-get -y update && \
    apt-get install -y build-essential \
                       bc \
                       e2fslibs-dev \
	               gawk \ 
                       libncurses5-dev \ 
                       libssl-dev \
                       nasm \
                       vim \
                       uuid-dev \
                       wget 

WORKDIR /opt
COPY syslinux-6.03.tar.gz /syslinux-6.03.tar.gz
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
