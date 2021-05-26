#!/bin/bash


# Important note:
# If you don't synchronize but then edit the other file,
# the newer modification time on the second file edited
# will cause data to be overridden.
# The solution would be to merge manually
# (Database --> Merge from database).


#####################
##  Configuration  ##
#####################

# Name of your remote storage as defined in Rclone
DRIVE_NAME="mycloud"

# Name and locations of the passwords file
DB_FILE_NAME="Passwords.kdbx"
LOCAL_LOCATION="$HOME/Keepass"
REMOTE_LOCATION="dotfiles/Keepass"

#####################


# Compose full path to local and remote database files
LOCAL_PATH="$LOCAL_LOCATION/$DB_FILE_NAME"
REMOTE_PATH="$REMOTE_LOCATION/$DB_FILE_NAME"

# Alias import and export commands and make them available within the functions
alias passwords_export="rclone copy $LOCAL_PATH $DRIVE_NAME:$REMOTE_LOCATION"
alias passwords_import="rclone copy $DRIVE_NAME:$REMOTE_PATH $LOCAL_LOCATION"
shopt -s expand_aliases

# Parse remote passwords file modification time using Rclone's lsl command
# See: https://rclone.org/commands/rclone_lsl/
function get_remote_passwords_mtime ()
{
	output=`rclone lsjson $DRIVE_NAME:$REMOTE_PATH 2>/dev/null`
	if [ $? -eq 3 ]; then
		unset output
		return 1
	else
    local string=`echo "$output" | jq -c ".[] | select( .Path | contains(\"$DB_FILE_NAME\") ) | .ModTime |= (sub(\"\\\\\.[0-9]+Z\";\"Z\") | fromdate) | .ModTime"`
    echo $string
		unset output
		return 0
	fi

}

function sync_passwords ()
{

	# The conversion is required for the comparison in the following if statement
        local_mtime_in_seconds_since_epoch=`stat -f "%Fm" $LOCAL_PATH | cut -d '.' -f 1`
        remote_mtime_in_seconds_since_epoch=`get_remote_passwords_mtime`

        echo "Local modtime: $local_mtime_in_seconds_since_epoch"
        echo "Remote modtime: $remote_mtime_in_seconds_since_epoch"

        # Handle local being newer than remote
        if [ "$local_mtime_in_seconds_since_epoch" -gt "$remote_mtime_in_seconds_since_epoch" ]; then
                printf "Local passwords file found to be newer than remote!\n"
                printf "Exporting...\t"
                passwords_export
                printf "Done!\n"
		return 0

        # Handle remote being newer than local
        elif [ "$local_mtime_in_seconds_since_epoch" -lt "$remote_mtime_in_seconds_since_epoch" ]; then
                printf "Local passwords file found to be older than remote!\n"
                printf "Importing...\t"
                passwords_import
                printf "Done!\n"
		return 0

        else
                printf "Password files are synchronized.\n"
		return 0
        fi
}

sync_passwords
