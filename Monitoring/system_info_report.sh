#!/bin/bash

#File saving Direction

REPO_DIR="$HOME/report"
mkdir -p "$REPO_DIR"
CURRENT_DATE=$(date +%Y-%m-%d)
REPORT_FILE="$REPO_DIR/system_report_$CURRENT_DATE.txt"

#Variable for generation report

USER=$(whoami)
OS_NAME=$(grep '^PRETTY_NAME' /etc/os-release | cut -d= -f2 | tr -d '"')
KERNEL=$(uname -r)
CPU_INFO=$(lscpu | grep "Model name" | awk -F: '{print $2}' | sed 's/^[ \t]*//')
CPU_CORE=$(nproc)
RAM_USED=$(free -h | awk '/Mem:/ {print $3}')
RAM_TOTAL=$(free -h | awk '/Mem:/ {print $2}')
DISK_USAGE=$(df -h)
IP_ADDR=$(hostname -I)
UP_TIME=$(uptime -p)


#COLORS

RED="\033[1;31m"
GREEN="\033[1;32m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
RESET="\033[0m"



#Display Output

{

echo -e "${RED}/////==== System Information Report ==/////${RESET}"
echo " "
echo -e "${GREEN}Generated Date:${RESET} ${BLUE}$CURRENT_DATE${RESET}"
echo -e "${GREEN}User:${RESET} ${BLUE}$USER${RESET}"
echo " "

echo -e "${GREEN}Name:${RESET} ${BLUE}$OS_NAME${RESET}"
echo -e "${GREEN}Kernel:${RESET} ${BLUE}$KERNEL${RESET}"
echo -e "${GREEN}CPU:${RESET} ${BLUE}$CPU_INFO${RESET}"
echo -e "${GREEN}CPU Cores:${RESET} ${BLUE}$CPU_CORE${RESET}"
echo -e "${GREEN}RAM:${RESET} ${BLUE}$RAM_USED / $RAM_TOTAL${RESET}"
echo -e "${GREEN}Disk:${RESET} "
echo " "

echo -e "${YELLOW}$DISK_USAGE${RESET}"
echo " "

echo -e "${GREEN}IP:${RESET} ${BLUE}$IP_ADDR${RESET}"
echo -e "${GREEN}Uptime:${RESET} ${BLUE}$UP_TIME${RESET}"
echo -e "${GREEN}Report save to:${RESET} ${BLUE}$REPORT_FILE${RESET}"

echo " "

echo -e "${RED}/////////////================/////////////${RESET}"


} > "$REPORT_FILE"

cat "$REPORT_FILE"