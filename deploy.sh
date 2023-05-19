#!/bin/bash
pass=$1
if [ "${pass}"x == ""x ]
then
    pass="test"
fi
sudo apt install shadowsocks-libev -y
sudo bash -c 'cat << "EOF" > /etc/shadowsocks-libev/config.json
{
    "server":"0.0.0.0",
    "mode":"tcp_and_udp",
    "server_port":10024,
    "local_port":1080,
    "password":"${pass}",
    "timeout":60,
    "method":"chacha20-ietf-poly1305"
}
EOF'
sudo systemctl restart shadowsocks-libev.service
sudo ufw allow 10024
sudo systemctl restart shadowsocks-libev.service
