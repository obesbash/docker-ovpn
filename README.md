# Docker-OVPN
Fork this project from <a href="https://github.com/alekslitvinenk/docker-openvpn">alekslitvinenk</a>. Many thanks to him!

I made this project for personal use and personal purposes. 
Added a Docker-Compose file and slightly modified the source code, since I did not need part of the original functionality. 
Left only what I need personally.

So if you want to use fully automated/often_upgraded solution go into original alekslitvinenk project(linked above) and folow him instruction. 
But in some strange reason if you decided use my solution - your welcome.

For run container put this command in terminal:
```
docker run -d --restart always --cap-add NET_ADMIN --name ovpn -p 1194:1194/udp -p 8099:8080/tcp -e HOST_ADDR=ovpn_ip_or_domain_name --sysctl net.ipv4.ip_forward=1 -v data_ovpn:/etc/openvpn obesbash/docker-ovpn:latest
```
## OR
Just download docker-compose.yml and edit one line in it HOST_ADDR=$ovpn_server_ip_or_domain_name and run:
```
docker-compose up -d
```
Next run `docker logs ovpn`(if you chose use docker run) or `docker-compose logs`(if you chose use docker-compose) you should see similar output:
```
Initialization Sequence Completed
clients/k1Gkgk573pJQMXyDtQz9uSbMOPy15rEI/client.ovpn file has been generated
Config server started, download your client.ovpn config at http://ovpn_ip_or_domain_name:8099/
NOTE: After your download you client config, http server will be shut down!
```
In your browser go to http://ovpn_ip_or_domain_name:8099/ and get your client.ovpn file(What to do with client.ovpn i think you know). After file will bee downloaded http server shut down. And in logs you will see:

`Config http server has been shut down`

Thats all, enjoy your OVPN server.
