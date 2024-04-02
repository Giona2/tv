#!/bin/bash

echo ""
echo "This setup bash script will install:"
echo "- nala"
echo "- python3"
echo "- python3-tk"
echo "- openbox"
echo ""
echo -n "Continue? [Y/n] "
read confirmed_install

sudo su

cd /home/$USER/

if [ "$confirmed_install" != "y" ] && [ "$confirmed_install" != "Y" ]; then
    echo "Cancelling..."
    exit 0
fi

apt -y update
apt -y upgrade
apt install -y nala

nala install -y python3
nala install -y python3-tk
nala install -y openbox

mv tv/main.py ../main.py

exit
