#!/bin/bash

while true
do
    backup=$(tmutil listlocalsnapshots / | head -1) #stores oldest backup name
    
    echo -e "\nWhat would you like to do?\n1. Display all backups\n2. Delete oldest backup\n3. Delete all backups\n4. Check storage status\n5. Exit"
    read choice

    case $choice in
        1) #displays all backups
        if [ -z "$backup" ] #if no backup exists
        then
            echo -e "\nNo backups to display!"
            break
        else
            echo -e "\nAll local backups are"
            tmutil listlocalsnapshots /
        fi
        ;;
        
        2) #deletes oldest backup
        if [ -z "$backup" ]
        then
            echo -e "\nNo backups to delete!"
            break
        else
            backup=$(tmutil listlocalsnapshots / | head -1)
            backup_date=${backup#"com.apple.TimeMachine."} #stores only date of backup
            echo -e "\nDeleting com.apple.TimeMachine.$backup_date..."
            tmutil deletelocalsnapshots $backup_date
        fi
        ;;
    
        3) #deletes all backups
        if [ -z "$backup" ]
        then
            echo -e "\nNo backups to delete!"
            break
        else
            while true #keeps looping to delete all remaining backups
            do
                backup=$(tmutil listlocalsnapshots / | head -1)
                if [ -z "$backup" ]
                then
                    echo -e "\nAll backups deleted!"
                    break
                else
                    backup_date=${backup#"com.apple.TimeMachine."}
                    echo -e "\nDeleting com.apple.TimeMachine.$backup_date..."
                    tmutil deletelocalsnapshots $backup_date
                fi
            done
        fi
        break
        ;;
        
        4)
        echo -e "\nCurrent storage status is"
        df -h /
        ;;
        
        5)
        break
        ;;
        
        *)
        echo -e "\nInvalid choice, try again!"
        ;;
    esac
done