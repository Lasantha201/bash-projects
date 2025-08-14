#!/bin/bash

# COLORS
RED="\033[1;31m"
BLUE="\033[1;34m"
RESET="\033[0m"

# Check entered exactly 2 arguments
if [ $# -ne 2 ]; then
    echo -e "${RED}Usage: backup.sh <source_directory> <target_directory>${RESET}"
    echo -e "${RED}Please Try again!${RESET}"
    exit 1
fi

# Check if rsync is installed
if ! command -v rsync > /dev/null 2>&1; then
    echo -e "${RED}This Script requires rsync to be installed.${RESET}"
    echo -e "${RED}Please use your distribution's package manager to install rsync.${RESET}"
    exit 2
fi

# Add date for proper format
current_date=$(date +%Y-%m-%d)

# Ensure target directories exist
mkdir -p "$2/$current_date"
mkdir -p "$2/current"

# Rsync options
rsync_options="-avb --backup-dir=$2/$current_date --delete"

# Run rsync
rsync $rsync_options "$1" "$2/current" >> "backup_$current_date.log"

# Done
echo -e "${BLUE}Backup completed successfully! Log saved as backup_$current_date.log${RESET}"
