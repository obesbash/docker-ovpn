#!/usr/bin/env bash

docker run --cap-add=NET_ADMIN \
-p 1194:1194/udp -p 80:8080/tcp \
-e HOST_ADDR=localhost \
--name dockovpn --rm \
alekslitvinenk/openvpn "$@"