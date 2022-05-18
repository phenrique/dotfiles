#!/bin/bash

#imux
cd
git clone https://gitlab.com/iasj/imux
cd imux
sudo make install

echo complete -W "$(ls ~/.config/imux)" imux >> ~/.bashrc

#imux
cd
git clone https://gitlab.com/iasj/imux
cd imux
sudo make install

#java
sudo arch-linux set jdk-lts

sudo tee /etc/modules-load.d/loop.conf <<< "loop"

modprobe loop

#docker
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo groupadd docker
sudo usermod -aG docker $USER

#pgadmin4
sudo mkdir /var/lib/pgadmin
sudo mkdir /var/log/pgadmin
sudo chown $USER /var/lib/pgadmin
sudo chown $USER /var/log/pgadmin
python3 -m venv pgadmin4
source pgadmin4/bin/activate
pip install pgadmin4
