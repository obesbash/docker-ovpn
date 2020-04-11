#!/bin/bash

source ./functions.sh

CLIENT_PATH="$(createConfig)"
CONTENT_TYPE=application/text
FILE_NAME=client.ovpn
FILE_PATH="$CLIENT_PATH/$FILE_NAME"
echo "$(datef) $FILE_PATH file has been generated"

echo "$(datef) Config server started, download your $FILE_NAME config at http://$HOST_ADDR/"
echo "$(datef) NOTE: After you download you client config, http server will be shut down!"

{ echo -ne "HTTP/1.1 200 OK\r\nContent-Length: $(wc -c <$FILE_PATH)\r\nContent-Type: $CONTENT_TYPE\r\nContent-Disposition: attachment; fileName=\"$FILE_NAME\"\r\nAccept-Ranges: bytes\r\n\r\n"; cat "$FILE_PATH"; } | nc -w0 -l 8080

echo "$(datef) Config http server has been shut down"
