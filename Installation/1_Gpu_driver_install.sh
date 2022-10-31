### Set up gpu and docker env
# to set up package manager
sudo dpkg --configure -a -y
# to fix all potential broken packages
sudo apt --fix-broken install -y
# to install sudo command if sudo if not work properly
sudo apt install sudo
# to update all recent packages
sudo apt update -y
# to upgrade all recent packages
sudo apt upgrade -y
### Install gpu driver
# to install nvidia driver for running nvidia-smi command
sudo apt install nvidia-driver-510 -y

### Install g++ and gcc
# to install all the package links which required for compiling C/C++
sudo apt install build-essential -y
# to install tools for retrieving or downloading files from web or FTP servers
sudo apt install wget -y

### Provide apt install packege
# to allow devlopers easily manage distribution and independent software vendor software sources
sudo apt install software-properties-common -y

### After run this need run
# to reboot is function or command do not work
#sudo reboot