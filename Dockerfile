FROM debian:6

MAINTAINER Marius van den Beek <m.vandenbeek@gmail.com>

RUN mkdir conda && \
    cd conda/ && \
    echo 'deb http://archive.debian.org/debian squeeze main' > /etc/apt/sources.list && \
    echo 'deb http://archive.debian.org/debian squeeze-lts main' >> /etc/apt/sources.list && \
    echo "Acquire::Check-Valid-Until false;" > /etc/apt/apt.conf && \
    apt-get update && \
    apt-get install -y wget bzip2 zip gzip build-essential vim && \
    wget --no-check-certificate https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /root/miniconda3 && \
    export PATH=/root/miniconda3/bin/:$PATH && \
    conda install conda-build git && \
    git clone https://github.com/bioconda/bioconda-recipes && \
    cd bioconda-recipes/ && \
    ./simulate-travis.py --set-channel-order

WORKDIR /conda/bioconda-recipes

CMD export PATH=/root/miniconda3/bin/:$PATH && bash

