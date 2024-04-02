#!/bin/bash

arg=$1

if [ "$arg" == "--help" ] || [ "$arg" == "-h" ]; then
    echo -e "\n./setup.sh <command> <argument>"
    echo
    echo "Commands"
    echo "========================================================================================"
    echo "./setup.sh -h/--help                    prints the documentation for all commands for this program"
    echo -e "./setup.sh -s/--start                   begins the setup bash script\n"
    exit 0
elif [ "$arg" != "--start" ] && [ "$arg" != "-s" ]; then
    exit 0
fi

echo "This setup script will install"
echo -e "- nala\n- python3\n- python3-tk\n- xorg\n- xterm"
echo -n "Do you wish to continue? [Y/n] "
read confirmed_install
while [ "$confirmed_install" != "Y" ] && [ "$confirmed_install" != "y" ]; do
if [ "$confirmed_install" == "N" ] || [ "$confirmed_install" == "n" ]; then
    echo "Cancelled..."
    exit 0
elif [ "$confirmed_install" != "Y" ] && [ "$confirmed_install" != "y" ]; then
    read $confirmed_install
fi
done

sudo apt -y update
sudo apt -y upgrade
sudo apt install -y nala

sudo nala install -y python3
sudo nala install -y python3-tk
sudo nala install -y xorg
sudo nala install -y xterm
