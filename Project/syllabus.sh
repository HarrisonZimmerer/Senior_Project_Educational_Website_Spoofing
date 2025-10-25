#!/bin/bash

SPOOF_IP="104.187.148.248"
SPOOF_DOMAIN="asdf.unionps.org"
GLITCH_PDF="/media/sf_Project/Syllabus.pdf"

#Install dnsmasq
echo "kali" | sudo -S apt update -qq
echo "kali" | sudo -S apt install dnsmasq-base -y

#Dnsmasq configuring
echo "kali" | cat <<EOF | sudo -S tee /etc/dnsmasq.conf
port=53
no-resolv
address=/$SPOOF_DOMAIN/$SPOOF_IP
server=10.0.2.3
server=8.8.8.8
server=1.1.1.1
EOF

#Restart dnsmasq
echo "kali" | sudo -S dnsmasq --conf-file=/etc/dnsmasq.conf --no-daemon &

#Redirect DNS to localhost
echo "kali" | sudo -S chattr -i /etc/resolv.conf
echo "kali" | sudo -S cp /etc/resolv.conf /home/resolv.conf
echo "kali" | sudo -S echo "nameserver 127.0.0.1" | sudo -S tee /etc/resolv.conf
echo "kali" | sudo -S chattr +i /etc/resolv.conf


xdg-open $GLITCH_PDF
