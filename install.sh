#!/bin/bash

echo -e "\nWARNING: I AM NOT RESPONSIBLE FOR ANY DAMAGE(S) THIS MAY CAUSE TO YOU OR YOUR COMPUTER!"

echo -e "\nThis will install a script to manage local Time Machine backups that get created automatically on macOS High Sierra or above. Please use with caution and only on a Macintosh computer running macOS 10.13 or higher."


if [ $(uname) == "Darwin" ] #should only install on a Mac
then
    if [ -f /usr/local/bin/backup_deleter ]
    then #already installed
        echo -e "\nScript already installed. Run it at any time using 'backup_deleter'."
        
    else #continue installing
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