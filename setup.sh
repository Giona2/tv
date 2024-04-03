#!/bin/bash

arg=$1

if [ "$arg" == "--help" ] || [ "$arg" == "-h" ]; then
    echo -e "\n./setup.sh <command> <argument>"
    echo
    echo "Commands"
    echo "=================================================================================================="
    echo "./setup.sh -h/--help                    prints the documentation for all commands for this program"
    echo -e "./setup.sh -s/--start                   begins the setup bash script\n"
    exit 0
elif [ "$arg" != "--start" ] && [ "$arg" != "-s" ]; then
    exit 0
fi

echo "This setup script will install"
echo -e "- nala\n- python3\n- python3-tk\n- xorg\n- xterm"
echo -n "Do you wish to continue? [Y/n] "
while read confirmed_install; do
if [ "$confirmed_install" == "N" ] || [ "$confirmed_install" == "n" ]; then
    echo "Cancelled..."
    exit 0
elif [ "$confirmed_install" == "Y" ] || [ "$confirmed_install" == "y" ]; then
    break
fi
done

apt -y update
apt -y upgrade
apt install -y nala

nala install -y python3
nala install -y python3-tk
nala install -y xorg
nala install -y xterm

mv /home/$USER/tv/.xinitrc /home/$USER/
rm /home/$USER/tv/setup.sh
