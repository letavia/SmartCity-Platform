#!/bin/bash
modprobe fuse 
dmesg | grep -i fuse 
sudo modprobe dm_snapshot 
sudo modprobe dm_mirror 
sudo modprobe dm_thin_pool 
lsmod | grep dm_*

sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:gluster/glusterfs-4.1 
sudo apt-get -y update 
sudo apt-get -y install glusterfs-client 
sudo apt-get -y install attr

#edit #!/bin/bash` at the start of mount.glusterfs

sudo sed -i '1s/'sh'/'bash'/g' /sbin/mount.glusterfs
mount.glusterfs -V
sudo fdisk -l 
sudo iptables -A INPUT -p tcp --dport 8080 --jump ACCEPT
sudo iptables -A INPUT -p tcp --dport 2222 --jump ACCEPT
sudo iptables -A INPUT -p tcp --dport 24007:24008 --jump ACCEPT
sudo iptables -A INPUT -p tcp --dport 49152:49251 --jump ACCEPT

