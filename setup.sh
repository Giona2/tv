#!/bin/bash

echo "This setup bash script will install:"
echo "- nala"
echo "- python3"
echo "- python3-tk"
echo "- openbox"
echo ""
echo -n "Continue? [Y/n] "
read confirmed_install

while [ $confirmed_install!="Y" ]; do
if [ $confirmed_install=="n" ]; then
    exit 0
else; then
    read $confirmed_install
fi
done

sudo apt -y update
sudo apt -y upgrade
sudo apt install -y nala

sudo nala install -y python3
sudo nala install -y python3-tk
sudo nala install -y openbox
