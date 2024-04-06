#!/bin/bash

GRAY='/033[0;37m'

# Confirm install
echo
echo "This setup script will install"
echo -e "- nala\n- python3\n- python3-tk\n- xorg\n- xterm"
echo "And will"
echo -e "- add a login user to manage login properties"
echo
echo "*this setup script should be ran as the root user"
echo -n "Do you wish to continue? [Y/n] "
read confirmed_install
if [ "$confirmed_install" != "Y" ] && [ "$confirmed_install" != "y" ]; then
	echo "Abort..."
	exit 0
fi

# Initialize variables
userhome=/home/$(ls /home/)
loginhome=/home/login/
utils=tv/utils/

# Make the utils execuable
chmod +x $userhome/$utils/make_exec/

# Add login user and edit config files
useradd -m -s /bin/bash login
passwd -d login
usermod -aG video login
$userhome/$utils/enable_auto_login login

# Download necessary packages
apt -y update
apt -y upgrade
apt install -y nala

nala install -y python3 python3-tk
nala install -y xorg xterm

# Add initialization code to the .bashrc file in login for xserver
$userhome/$utils/init_xserver login

# Hide the GRUB menu
$userhome/$utils/hide_grub_menu

# Cleanup
mv $userhome/tv/ $loginhome
rm $loginhome/$utils
rm $loginhome/tv/setup.sh

# Confirm reboot
echo -n "Would you like to reboot? [Y/n] "
read confirmed_reboot
if [ "$confirmed_reboot" == "Y" ] || [ "$confirmed_reboot" == "y" ]; then
	reboot
fi
