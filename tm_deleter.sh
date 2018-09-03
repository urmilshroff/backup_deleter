#!/bin/bash

echo -e "\nAll local backups are:"
tmutil listlocalsnapshots /

oldest_backup=$(tmutil listlocalsnapshots / | head -1) #stores oldest backup name
backup_date=${oldest_backup#"com.apple.TimeMachine."} #stores oldest backup date

echo -e "\nOldest backup is from $backup_date. Would you like to delete this backup? Y/n:"
read choice

case $choice in
    y)
    echo "Deleting com.apple.TimeMachine.$backup_date..."
    sudo tmutil deletelocalsnapshots $backup_date
    ;;
    *) echo "No backup(s) deleted"
esac