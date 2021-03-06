#!/bin/bash

function datef() {
    # Output Date:
    date "+%a %b %-d %T %Y"
}

function createConfig() {
    CLIENT_ID="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)"
    CLIENT_PATH="clients/$CLIENT_ID"

    # Redirect stderr to the black hole
    /usr/share/easy-rsa/easyrsa build-client-full "$CLIENT_ID" nopass &> /dev/null
    # Writing new private key to '/usr/share/easy-rsa/pki/private/client.key
    # Client sertificate /usr/share/easy-rsa/pki/issued/client.crt
    # CA is by the path /usr/share/easy-rsa/pki/ca.crt

    mkdir -p $CLIENT_PATH

    cp "pki/private/$CLIENT_ID.key" "pki/issued/$CLIENT_ID.crt" pki/ca.crt /etc/openvpn/ta.key $CLIENT_PATH

    cd /opt/dockerovpn
    cp config/client.ovpn $CLIENT_PATH

    echo -e "\nremote $HOST_ADDR 1194" >> "$CLIENT_PATH/client.ovpn"

# Writing authentication info into client.ovpn
    cat <(echo -e '<ca>') \
        "$CLIENT_PATH/ca.crt" <(echo -e '</ca>\n<cert>') \
        "$CLIENT_PATH/$CLIENT_ID.crt" <(echo -e '</cert>\n<key>') \
        "$CLIENT_PATH/$CLIENT_ID.key" <(echo -e '</key>\n<tls-auth>') \
        "$CLIENT_PATH/ta.key" <(echo -e '</tls-auth>') \
        >> "$CLIENT_PATH/client.ovpn"

    echo $CLIENT_PATH
}
