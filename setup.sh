#!/bin/bash

arg=$1
echo $arg

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

sudo apt -y update
sudo apt -y upgrade
sudo apt install -y nala

sudo nala install -y python3
sudo nala install -y python3-tk
sudo nala install -y xorg
sudo nala install -y xterm
