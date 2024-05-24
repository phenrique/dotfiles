#!/bin/bash

#imux
imux (){
    echo " - >>>>>>  Intall IMUX"
    cd ~
    git clone https://gitlab.com/iasj/imux
    cd imux
    sudo make install

    echo complete -W "$(ls ~/.config/imux)" imux >> ~/.bashrc
}

insomnia (){
    echo " - >>>>>>  Insomnia"
    yay -S insomnia
}

intellij (){
    echo " - >>>>>>  Intellij"
    sudo pacman -S intellij-idea-community-edition
}

java (){
    echo " - >>>>>>  Java JDK"
    yay -S jdk11
    sudo arch-linux set java-11-jdk
}

mvn (){
    echo " - >>>>>>  MVM VM"
    yay -S mvnvm
}

#tomcat
tomcat (){

    echo " Installing - >>>>>>  Tomcat 9"
    cd ~/Downloads
    wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.35/bin/apache-tomcat-9.0.35.tar.gz
    sudo tar zxvf apache-tomcat-9.0.35.tar.gz
    sudo mv apache-tomcat-9.0.35 /opt/
    sudo chmod 777 -R /opt/apache-tomcat-9.0.35

}

docker (){

    sudo pacman -S docker
    sudo tee /etc/modules-load.d/loop.conf <<< "loop"
    sudo modprobe loop
    
    sudo systemctl start docker.service
    sudo systemctl enable docker.service
    sudo groupadd docker
    sudo usermod -aG docker $USER
}

# -> pgadmin4
# email : pgadmin@pgadmin.com senha: pgadmin
pgadmin4 (){

    echo " Installing - >>>>>>  Pgadmin4"
    cd ~
    sudo mkdir /var/lib/pgadmin
    sudo mkdir /var/log/pgadmin
    sudo chown $USER /var/lib/pgadmin
    sudo chown $USER /var/log/pgadmin
    python3 -m venv pgadmin4
    source pgadmin4/bin/activate
    pip install pgadmin4
}


mongocompass(){
    echo " Installing - >>>>>>  Mongo Compass"
    yay -S mongodb-compass
}

mongo(){
    echo " Installing - >>>>>>  Mongo"
    docker pull mongo 
    docker run --name mongodb -v ~/.mongodb/data/db:/data/db -p 27017:27017 -d mongo 
}

arduino(){
  echo " Installing - >>>>>>  Arduino"
  sudo pacman -S arduino arduino-avr-core arduino-cli
  sudo usermod -aG uucp $USER
  # install boards in arduino GUI interface
}

flutter(){
  echo " Installing - >>>>>>  Flutter"
  #yay -S flutter
  #sudo groupadd flutterusers
  #sudo gpasswd -a $USER flutterusers
  #sudo chown -R :flutterusers /opt/flutter
  #sudo chmod -R g+w /opt/flutter/
  #sudo chown -R $USER /opt/flutter



  #yay -S android-sdk android-sdk-platform-tools android-sdk-build-tools
  #yay -S android-platform sdkmanager

  sudo groupadd android-sdk
  sudo gpasswd -a $USER android-sdk
  sudo setfacl -R -m g:android-sdk:rwx /opt/android-sdk
  sudo setfacl -d -m g:android-sdk:rwX /opt/android-sdk
}


# > run
#imux
#java
#intellij
#insomnia
#docker
#tomcat 
#arduino
#flutter
pgadmin4

