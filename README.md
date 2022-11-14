<h1 align="center">
	Docker_Azure_Installation_Monitoring
   	<img src="https://media.giphy.com/media/hvRJCLFzcasrR4ia7z/giphy.gif" width="30px"/>
</h1>

> This notes is for standard scripts operation

> Make sure run the script carefully and test after

---
## :memo: Table of Contents
1. [Getting Started](#getting-started)
2. [Repository Structure](#repository-structure)
3. [Build and Test](#build-and-test)
4. [Contributer](#contributer)

---
# Getting Started
1.	This scripts will work with Ansible Playbook
2.	Ensure "nvidia-smi" package installed
3.	Ensure "top" package installed
4.  Ensure "Docker" package installed

---
# Repository Structure
```
src/
├── Monitoring/  
│   - DockerCheck.sh
│   
├── Monitoring/
│   - Gpu_driver_install.sh
│   - Docker_Azure_edge_install.sh 
│        
```
---
# Build and Test
After the Azure Installation, we need to modify the certification expiry day from 90 days to 365 days.

> sudo vim /etc/aziot/config.toml


TODO: Will have further instruction for the combination with Ansible Playbook

---
# Contributer
- Jeremy Huang
