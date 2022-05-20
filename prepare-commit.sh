#!/bin/bash

progs='progs.txt'


#backup config
bkp () {

 cd ~/.config
 cp -ru $1 ~/dotfiles/config

}

#copiar cada pasta com nome no txt
while read -r line; 
    do bkp $line; 
done < progs.txt
