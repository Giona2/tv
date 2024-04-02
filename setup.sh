#!/bin/bash

echo "This setup bash script will install:"
echo "- nala\n- python3\n- python3-tk\n- openbox"
echo "\nContinue (Y/n)? "
read confirmed_install

if [ $confirmed_install=="n" ]; then
    exit 0
elif [ $confirmed_install!="Y" ]; then
    read $confirmed_install
fi

sudo apt -y update
sudo apt -y upgrade
sudo apt install -y nala

sudo nala install -y python3
sudo nala install -y python3-tk
sudo nala install -y openbox
