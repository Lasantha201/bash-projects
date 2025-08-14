# Bash Scripting Projects

This repository contains Bash scripting practice projects for automation and system management.  
It currently includes two scripts:

1. Backup Script (`backup.sh`)  
2. System Monitoring Script (`system_report.sh`)

---------------------------------

## 📂 Repository Structure

bash-Projects/
├── Monitoring/
|      └──system_info_report.sh
├── Backup/
|      └──backup.sh
├── README.md


--------------------------------

## 1️⃣ Backup Script (`backup.sh`)

### Description
A Bash script to automate backups of a source directory to a target directory using `rsync`.  

- Checks if exactly 2 arguments are provided (source and target directories).  
- Validates that rsync is installed.  
- Creates a date-stamped backup folder and maintains a `current` directory.  
- Logs the backup process to a timestamped log file.  
- Color-coded terminal output for better readability.

### Usage

./backup.sh <source_directory> <target_directory>

--------------------------------


## 2️⃣ System Monitoring Script (`system_report.sh`)

### Description
A Bash script to generate a system information report.  

- Collects user, OS, kernel, CPU, RAM, disk usage, IP address, and uptime.  
- Outputs report both to terminal with colors and to a plain text file in a `report` directory.  
- Designed for Linux systems.

### Usage
./system_report.sh

The report will be saved in:
~/report/system_report_<YYYY-MM-DD>.txt


--------------------------------

### Requirements

-Bash shell (Linux) or Window WSL or Git bash Terminal

--------------------------------

### Notes

-Make script executable:
    chmod +x backup.sh
    chmod +x system_info_report.sh

--------------------------------

### Author

Lasantha Wijewardhana

- Github: (https://github.com/Lasantha201)

- Linked In: (https://www.linkedin.com/in/lasantha-wijewardhana-ba0bb32b2/?trk=opento_sprofile_details)

