#!/bin/bash

## D4nk0St0rM
#### #### #### #### spread l0ve & kn0wledge #### #### #### ####
# Inspiration from blacklanternsecurity & g0tmi1k scripts

# Enable debug mode
# set -x

# Colour output
RED="\033[01;31m"      # Issues/Errors
GREEN="\033[01;32m"    # Success
YELLOW="\033[01;33m"   # Warnings/Information
BLUE="\033[01;34m"     # Heading
BOLD="\033[01;01m"     # Highlight
RESET="\033[00m"       # Normal

# Exclude regular history entries
export HISTIGNORE="&:ls:[bf]g:exit:history"

mylist="https://raw.githubusercontent.com/D4nk0St0rM/Gen_Tech_Set_Up_Code_Misc/main/Linux/Kali_Linux/app-install.list"
gitlist="https://raw.githubusercontent.com/D4nk0St0rM/Gen_Tech_Set_Up_Code_Misc/main/Linux/Kali_Linux/git-clone.list"

# update
echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Updating OS${RESET} from repositories ~ this ${BOLD}may take a while${RESET} depending on your connection & last time you updated / distro version"
echo "sudo apt-get update"
sudo apt-get update -y
echo "sudo apt-get upgrade"
sudo apt-get -y upgrade --fix-missing
sudo apt-get upgrade -y
echo "apt-get dist-upgrade"
sudo apt-get dist-upgrade -y
echo "apt-get full-upgrade"
sudo apt-get full-upgrade -y
echo "sudo apt-get autoremove"
sudo apt-get autoremove -y
echo "apt-get clean"
sudo apt-get clean -y


# sudo no passwd - manual
sudo apt install -y kali-grant-root && sudo dpkg-reconfigure kali-grant-root

#  GB Locales
echo -e "\n ${GREEN}[+]${RESET} Updating ${GREEN}location information${RESET} ~ Locales (${BOLD}gb${RESET})"
# sudo locale-gen en_GB.UTF-8
sudo dpkg-reconfigure locales # manual input required
sudo update-locale LANG=en_GB.UTF-8
sudo setxkbmap -layout gb

#   Changing time zone
echo -e "\n ${GREEN}[+]${RESET} Updating ${GREEN}location information${RESET} ~ time zone (${BOLD}Europe/London${RESET})"
sudo cp /usr/share/zoneinfo/Europe/London /etc/localtime

# shared folder set up
mkdir shares && sudo /usr/bin/vmhgfs-fuse .host:/ /home/kali/shares -o subtype=vmhgfs-fuse,allow_other


# install applications

wget $mylist 1>/dev/null
cat app-install.list | while read app || [[ -n $line ]];
do
    echo -e "\n ${GREEN}[+]${RESET} Installation of applications ${GREEN} - $app ${RESET}"
    sudo apt-get install -y $app
    if [[ "$?" -ne 0 ]]; then
        echo -e ' '${RED}'[!]'${RESET}" There was an ${RED}issue installing $app${RESET}" 1>&2
        echo -e " ${YELLOW}[i]${RESET} There was an ${RED}issue installing $app ${YELLOW} sending to list to review${RESET}"
        echo $app >> app_not_installed.list
    fi
done

echo -e "\n ${GREEN}[+]${RESET} Installation of applications ${GREEN} - tempomail ${RESET}"
wget https://github.com/kavishgr/tempomail/releases/download/1.1.0/linux-amd64-tempomail.tgz
tar -xzvf linux-amd64-tempomail.tgz
sudo mv tempomail /usr/local/bin/
sudo rm linux-amd64-tempomail.tgz

echo -e "\n ${GREEN}[+]${RESET} Installation of applications ${GREEN} - chromium ${RESET}"
sudo apt-get install chromium -y


# git clone from list

cd /opt
sudo wget $gitlist 1>/dev/null
cat git-clone.list | while read app || [[ -n $line ]];
do
    echo -e "\n ${GREEN}[+]${RESET} Installation of applications ${GREEN} - $app ${RESET}"
    sudo git clone $app
    if [[ "$?" -ne 0 ]]; then
        echo -e ' '${RED}'[!]'${RESET}" There was an ${RED}issue installing $app${RESET}" 1>&2
        echo -e " ${YELLOW}[i]${RESET} Try one thing ${RED} by deleting existing install $app ${YELLOW} removing any folders${RESET}"
    fi
done
sudo rm git-clone.list
cd ~/


echo -e "\n ${GREEN}[+]${RESET} Housekeeping ${GREEN} - Unzip files ${RESET}"
# sudo rm /usr/share/wordlists/rockyou.txt || echo -e ' '${RED}'[!] rockyou.txt does not exist'${RESET} 1>&2
sudo gunzip /usr/share/wordlists/rockyou.txt.gz || echo -e ' '${RED}'[!] rockyou.txt.gz does not exist'${RESET} 1>&2
# add rockyou2021 via shared folder


echo -e "\n ${GREEN}[+]${RESET} Housekeeping ${GREEN} - add architecure & windows tools ${RESET}"
sudo dpkg --add-architecture i386 && sudo apt-get update 1> /dev/null

echo -e "\n ${GREEN}[+]${RESET} Dependancies ${GREEN} - wifite ${RESET}"
# wifite dependancies
sudo apt install hcxdumptool && sudo apt install hcxtools

# pyrit:
echo -e "\n ${GREEN}[+]${RESET} Dependancies ${GREEN} - pyrit-installer ${RESET}"
git clone https://github.com/hacker3983/pyrit-installer && cd pyrit-installer && sudo bash install.sh
cd ../
sudo rm -r pyrit-installer
sudo apt-get install libpcap-dev -y
sudo apt-get install python2.7-dev libssl-dev zlib1g-dev libpcap-dev -y
cd /opt
sudo git clone https://github.com/JPaulMora/Pyrit.git
cd Pyrit && sudo python2 setup.py clean && sudo python2 setup.py build && sudo python2 setup.py install
cd ~/

# python2 & python3 pip install
# pip2
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
chmod u+x get-pip.py
sudo python2 get-pip.py
sudo rm get-pip.py
# pip3

wget https://bootstrap.pypa.io/get-pip.py
chmod u+x get-pip.py
sudo python3 get-pip.py
sudo rm get-pip.py

## setup-tools
sudo pip2 install --upgrade setuptools
sudo pip3 install --upgrade setuptools

## pip installs
sudo python3 -m pip install impacket
sudo python2 -m pip install impacket
sudo pip install badchars
