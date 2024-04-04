#!/bin/bash

GRAY='/033[0;37m'

# Confirm install
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

# Initialize
user=$(ls /home)

# Add login user and edit config files
useradd -m -s /bin/bash login
passwd -d login
usermod -aG video login
chmod +x /home/$user/tv/enable_auto_login
/home/$user/tv/enable_auto_login

# Download necessary packages
apt -y update
apt -y upgrade
apt install -y nala

nala install -y python3
nala install -y python3-tk
nala install -y xorg
nala install -y xterm

echo "startx" >> /home/login/.bashrc

# Cleanup
mv /home/$user/tv/ /home/login
rm /home/login/tv/enable_auto_login
rm /home/login/tv/setup.sh
reboot
