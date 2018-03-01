#!/bin/bash

set -e
set -x

mkdir /tmp/nginx
cd /tmp/nginx

wget -q http://nginx.org/download/nginx-1.9.2.tar.gz
tar -xzvf nginx-1.9.2.tar.gz

wget -q https://github.com/chobits/ngx_http_proxy_connect_module/archive/master.zip 

unzip master.zip

cd /tmp/nginx/nginx-1.9.2/
patch -p1 < /tmp/nginx/ngx_http_proxy_connect_module-master/proxy_connect.patch
./configure --add-module=/tmp/nginx/ngx_http_proxy_connect_module-master
make
make install

rm -rf /tmp/nginx
ln -sf /dev/stdout /usr/local/nginx/logs/access.log
ln -sf /dev/stderr /usr/local/nginx/logs/error.log
