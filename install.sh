#!/bin/bash

if [ $(uname) == "Darwin" ] #should install only on a Mac
then
    if [ -f /usr/local/bin/backup_deleter ] #check if already installed
    then
        echo -e "\nScript already installed. Run it at any time using 'backup_deleter'."
        
    else #not installed, continue installing
        echo -e "\nDo you want to continue installation? Y/N"
        read choice
        
        if [ $choice == "Y" -o $choice == "y" ]
        then #installer
            echo -e "Installing..."
            cp backup_deleter.sh /usr/local/bin #copies file to /usr/local/bin
            mv /usr/local/bin/backup_deleter.sh /usr/local/bin/backup_deleter #removes file extension
            chmod +x /usr/local/bin/backup_deleter #makes it an executable
            echo -e "Installation complete. Run the program at any time using 'backup_deleter'."
            
        else
            echo -e "Installation aborted."
        fi
    fi
    
else
    echo -e "\nSorry, this script only works on a Macintosh and not on $(uname)!"
fi
