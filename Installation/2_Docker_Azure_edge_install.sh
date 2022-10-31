### install cuda toolkit, docker, diable update

## Set up docker and nvidia
# to install Curl command
sudo apt install curl
# to install cuda toolkit
sudo apt install nvidia-cuda-toolkit -y
# to add official GPG public key and distribution list and install nvidia-docker2
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
distribution=$(
    . /etc/os-release
    echo $ID$VERSION_ID
)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt install nvidia-docker2 -y
sudo pkill -SIGHUP dockerd
# to disable auto-update
sudo sed -i 's/APT::Periodic::Update-Package-Lists "1"/APT::Periodic::Update-Package-Lists "0"/' /etc/apt/apt.conf.d/20auto-upgrades
sudo sed -i 's/APT::Periodic::Unattended-Upgrade "1"/APT::Periodic::Unattended-Upgrade "0"/' /etc/apt/apt.conf.d/20auto-upgrades

## Set up moby and Azure iotedge
# to install the repository configuration that matches your device operating system; for Ubuntu 18.04 and 20.04:
curl https://packages.microsoft.com/config/ubuntu/18.04/multiarch/prod.list >./microsoft-prod.list
# to copy the generated list to the sources.list.d directory:
sudo cp ./microsoft-prod.list /etc/apt/sources.list.d/
# to install the Microsoft GPG public key:
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >microsoft.gpg
sudo cp ./microsoft.gpg /etc/apt/trusted.gpg.d/
# to update all packages
sudo apt update
# to install fix version moby
sudo apt install moby-runc=1.0.3+azure-1 -y
sudo apt install moby-engine=20.10.11+azure-3 -y

# to install fix version aziot-edge
# ! 1.3.7 not compatible
sudo apt-get install aziot-edge -y

## Auto Remove
# sudo apt autoremove

# to disable module update
sudo apt-mark hold moby-runc
sudo apt-mark hold moby-engine
sudo apt-mark hold aziot-edge

# to disable docker and nvidia update
sudo apt-mark hold nvidia-container-toolkit
sudo apt-mark hold docker-compose
sudo apt-mark hold docker.io
sudo apt-mark hold docker
sudo apt-mark hold nvidia-docker2

# to configure the device prepare the config.toml file using the template installed:
sudo cp /etc/aziot/config.toml.edge.template /etc/aziot/config.toml

# to expend day from 90 to 365 day
sudo sed -i '353,355s/#//' /etc/aziot/config.toml
#change 90 to 365
# sudo sed -i '353,355s/90/365/' /etc/aziot/config.toml

# to install monitoring commands
sudo apt install htop -y        # check real-time processes monitoring
sudo apt install atop -y        # check system recources
sudo apt install iotop -y       # check real-time Dick I/O and processes monitoring
sudo apt install iftop -y       # check current network usage
sudo apt install gpustat -y     # check gpu stats

# to check if docker exist
sudo docker run --runtime=nvidia --rm nvidia/cuda:10.1-base nvidia-smi
