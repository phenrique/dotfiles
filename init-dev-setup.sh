#!/bin/bash

#imux
#echo " - >>>>>>  Intall IMUX"
#cd ~
#git clone https://gitlab.com/iasj/imux
#cd imux
#sudo make install
#
#echo complete -W "$(ls ~/.config/imux)" imux >> ~/.bashrc

#insomnia
#echo " - >>>>>>  Insomnia"
#yay -S insomnia
#
##intellij
#echo " - >>>>>>  Intellij"
#sudo pacman -S intellij-idea-community

#java
#echo " - >>>>>>  Java"
#yay -S jdk-lts
#yay -S jdk11
#sudo arch-linux set jdk-lts

#mvn
#yay -S mvnvm
#

#tomcat
tomcat (){

    echo " Installing - >>>>>>  Tomcat 9"
    cd ~/Downloads
    wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.35/bin/apache-tomcat-9.0.35.tar.gz
    sudo tar zxvf apache-tomcat-9.0.35.tar.gz
    sudo mv apache-tomcat-9.0.35 /opt/
    sudo chmod 777 -R /opt/apache-tomcat-9.0.35

}


#docker
#sudo pacman -S docker
#sudo tee /etc/modules-load.d/loop.conf <<< "loop"
#sudo modprobe loop
#
#sudo systemctl start docker.service
#sudo systemctl enable docker.service
#sudo groupadd docker
#sudo usermod -aG docker $USER

#pgadmin4
# email : pgadmin@pgadmin.com senha: pgadmin
#tomcat (){
#
#    echo " Installing - >>>>>>  Tomcat 9"
#    cd ~
#    sudo mkdir /var/lib/pgadmin
#    sudo mkdir /var/log/pgadmin
#    sudo chown $USER /var/lib/pgadmin
#    sudo chown $USER /var/log/pgadmin
#    python3 -m venv pgadmin4
#    source pgadmin4/bin/activate
#    pip install pgadmin4
#}

tomcat 
