#!/bin/bash

GRAY='/033[0;37m'

arg=$1

if [ "$arg" == "--help" ] || [ "$arg" == "-h" ]; then
    echo
    echo "${GRAY} *this setup script should be ran as the root user"
    echo "./setup.sh <command> <argument>"
    echo
    echo "Commands"
    echo "=================================================================================================="
    echo "./setup.sh -h/--help                    prints the documentation for all commands for this program"
    echo "./setup.sh -s/--start                   begins the setup bash script"
    echo
    exit 0
elif [ "$arg" != "--start" ] && [ "$arg" != "-s" ]; then
    exit 0
fi

echo
echo "This setup script will install"
echo -e "- nala\n- python3\n- python3-tk\n- xorg\n- xterm"
echo "And will"
echo -e "- add a login user to manage login properties"
echo
echo "${GRAY} *this setup script should be ran as the root user"
echo -n "Do you wish to continue? [Y/n] "
while read confirmed_install; do
if [ "$confirmed_install" == "N" ] || [ "$confirmed_install" == "n" ]; then
    echo "Cancelled..."
    exit 0
elif [ "$confirmed_install" == "Y" ] || [ "$confirmed_install" == "y" ]; then
    break
fi
done

user=$(ls /home)

useradd -m -s /bin/bash login
passwd -d login
usermod -aG video login
/home/$user/tv/enable_auto_login

apt -y update
apt -y upgrade
apt install -y nala

nala install -y python3
nala install -y python3-tk
nala install -y xorg
nala install -y xterm

mv /home/$user/tv/ /home/login
mv /home/login/tv/.xinitrc /home/login/
rm /home/login/tv/setup.sh
chmod +x /home/login/tv/startup.sh
