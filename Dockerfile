FROM crystallang/crystal

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install curl
RUN apt-get -y install apache2-utils
RUN apt-get -y install google-perftools
RUN apt-get -y install libgoogle-perftools-dev
RUN mkdir -p /root/dev
WORKDIR /root/dev
