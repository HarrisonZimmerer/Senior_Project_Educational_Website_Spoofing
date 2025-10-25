#!/bin/bash

echo "[*] Reverting spoofing changes..."

#Stop and remove dnsmasq
echo "password" | sudo -S systemctl stop dnsmasq-base
echo "password" | sudo -S apt purge -y dnsmasq-base
echo "password" | sudo -S rm -f /etc/dnsmasq.conf

#Restore resolv.conf
echo "password" | sudo -S chattr -i /etc/resolv.conf
echo "password" | sudo -S cp /home/resolv.conf /etc/resolv.conf

echo "Spoof cleanup complete. Reboot GUI/network if problems persist."
