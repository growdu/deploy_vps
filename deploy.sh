#!/bin/bash
pass=$1
if [ "${pass}"x == ""x ]
then
    pass="test"
fi
sudo apt install shadowsocks-libev -y
conf="
{
    \"server\":\"0.0.0.0\",
    \"mode\":\"tcp_and_udp\",
    \"server_port\":10024,
    \"local_port\":1080,
    \"password\":\"${pass}\",
    \"timeout\":60,
    \"method\":\"chacha20-ietf-poly1305\"
}
"
echo "${conf}" > /etc/shadowsocks-libev/config.json
sudo systemctl restart shadowsocks-libev.service
sudo ufw allow 10024
sudo systemctl restart shadowsocks-libev.service
sudo systemctl status shadowsocks-libev.service
