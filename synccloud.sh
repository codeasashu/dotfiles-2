#!/usr/bin/env bash

####
# This script sync private configs from remote cloud to local filesystem
####
FOLDERS=(.ssh .aws .gnupg Keepass)

connect_cloud() {
    DESTN="$1"
    echo "Generating drive config..."
    read -p "Enter drive emailid: " cloud_email
    echo "Please wait while I download secret files...."
    rclone config create mycloud drive user $cloud_email config_is_local false
    for folder in ${FOLDERS[@]}; do
        if [ ! -d "$DESTN/$folder" ]; then
            mkdir -p "$DESTN/$folder"
        fi;
        rclone copy mycloud:/dotfiles/$folder $DESTN/$folder
    done;
}

connect_cloud ~