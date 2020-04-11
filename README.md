# Docker-OVPN
<p>Fork this project from <a href="https://github.com/alekslitvinenk/docker-openvpn">alekslitvinenk</a>. Many thanks to him! </p>
<p>I made this project for personal use and personal purposes. 
Added a Docker-Compose file and slightly modified the source code, since I did not need part of the rest functionality. 
Left only what I need personally.</p>
<p>So if you want to use fully automated/often_upgraded solution go into original alekslitvinenk project(linked above) and folow him instruction. 
But in some strange reason if you decided use my solution - your welcome.</p>
<p>For run container just for CLI use this command:</p>
`docker run -d --cap_add NET_ADMIN --name ovpn -p 1194:1194/udp -p 8099:8080/tcp -e HOST_ADDR=ovpn_ip_or_domain_name`
