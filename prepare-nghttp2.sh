#!/bin/sh -x

. /build/config-nghttp2.sh

apt-get update -y

apt-get install $minimal_apt_get_args $NGHTTP2_BUILD_PACKAGES

cd /build

git clone https://github.com/tatsuhiro-t/nghttp2

cd nghttp2

if test ! -r "configure"; then
  autoreconf -i
  automake
  autoconf
fi

./configure --enable-app --disable-hpack-tools --disable-examples \
	    --prefix=/usr
