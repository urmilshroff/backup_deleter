# macOS local Time Machine backup deleter

This is a shell script to manage and delete all local Time Machine backups that get created automatically on macOS versions -ge High Sierra 10.13.

This will not affect your regular Time Machine backups to an external hard drive, nor will it wipe any data on your Mac. It will only delete those locally generated backups or "snapshots" to free up some precious storage space.

## Installation

1. Clone/fork this repo to your Mac
2. Open Terminal.app and `cd` into the repo directory
3. Install by running `bash install.sh`
4. Once installed, you can run the script at any time by typing `backup_deleter`.
5. Profit!
