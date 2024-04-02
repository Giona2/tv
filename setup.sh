#!/bin/bash

echo ""
echo "This setup bash script will install:"
echo "- nala"
echo "- python3"
echo "- python3-tk"
echo "- xserver-xorg"
echo "- openbox"
echo ""
echo -n "Continue $USER? [Y/n] "
read confirmed_install

if [ "$confirmed_install" != "y" ] && [ "$confirmed_install" != "Y" ]; then
    echo "Cancelling..."
    exit 0
fi

sudo apt -y update
sudo apt -y upgrade
sudo apt install -y nala

sudo nala install -y python3
sudo nala install -y python3-tk
sudo nala install -y xserver-xord
sudo nala install -y openbox

rename /home/$USER/tv/main.py /home/$USER/main.py
