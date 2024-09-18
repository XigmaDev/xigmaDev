#!/bin/sh
# Script which helps to configure Ubuntu
# Author: XigmaDev
sudo apt -y update
sudo apt -y upgrade
sudo apt-get -y install openssh-server

sudo apt-get -y install realpath
sudo apt-get -y install screen 
# For: sfill - secure free disk and inode space wiper
sudo apt-get -y install secure-delete
# Web tools
sudo apt-get -y install aria2 links curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser
sudo apt-get -y install youtube-dl
sudo apt-get -y install autoconf libtool automake
sudo apt-get -y install python-setuptools python-pip
sudo apt-get -y install python-mysqldb python-docutils
# Fix for dnsmasq conflict
#   <warn> dnsmasq not available on the bus, can't update servers.
#   <error> [1373987121.101145] [nm-dns-dnsmasq.c:402] update(): dnsmasq owner not found on bus: Could not get owner of name 'org.freedesktop.NetworkManager.dnsmasq': no such name
#   <warn> DNS: plugin dnsmasq update failed
#
# See: http://askubuntu.com/questions/262301/is-dnsmasq-not-loading-because-of-a-network-manager-conflict
sudo apt-get -y install dnsmasq-base


sudo apt-get -y install beep sl
sudo apt -y install anydesk

# CONFIGURATION CHANGES
#
# Alt+SysRq has been disabled since Ubuntu 10.10 maverick, so re-activating it.
# It is useful for kernel debugging and troubleshooting kernel crashes.
# See: http://en.wikipedia.org/wiki/Magic_SysRq_key
#echo 1 | sudo tee /proc/sys/kernel/sysrq
#sudo sed -i'.bak' "s/kernel.sysrq.=.[0-9]*/kernel.sysrq = 1/" /etc/sysctl.d/10-magic-sysrq.conf
echo "kernel.sysrq=1" | sudo tee /etc/sysctl.conf 