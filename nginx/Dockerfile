FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install -y wget zip patch libpcre3-dev zlib1g-dev build-essential libtool 

add build-nginx.sh /bin/

RUN /bin/build-nginx.sh

ADD nginx.conf /usr/local/nginx/conf/nginx.conf

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
