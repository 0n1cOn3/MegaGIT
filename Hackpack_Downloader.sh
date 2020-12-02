#!/bin/bash
#AZZATSSINS
#Linux Hacking Tools
#Thx to Mehedi Shakeel for Recommendation
#GUI Made by @0n1cOn3
#Script from TheMasterCH/Pastebin
# ///
#import repos
path=$(pwd)
file="repo.txt"
maxgit=$(wc -l repo.txt)
#Some Colors :) 
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
RESTORE="\e[39"
BOLD="\e[1m"
NORMAL="\e[0m"
#Spinner
spinner()
{
    local pid=$1
    local delay=0.50
    local spinstr='-._'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}
#Banner
banner(){
clear
echo -e $RED "
Welcome to

██╗  ██╗ █████╗  ██████╗██╗  ██╗██████╗  █████╗  ██████╗██╗  ██╗                      
██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔══██╗██╔══██╗██╔════╝██║ ██╔╝                      
███████║███████║██║     █████╔╝ ██████╔╝███████║██║     █████╔╝                       
██╔══██║██╔══██║██║     ██╔═██╗ ██╔═══╝ ██╔══██║██║     ██╔═██╗                       
██║  ██║██║  ██║╚██████╗██║  ██╗██║     ██║  ██║╚██████╗██║  ██╗                      
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝                      
                                                                                      
██████╗  ██████╗ ██╗    ██╗███╗   ██╗██╗      ██████╗  █████╗ ██████╗ ███████╗██████╗ 
██╔══██╗██╔═══██╗██║    ██║████╗  ██║██║     ██╔═══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗
██║  ██║██║   ██║██║ █╗ ██║██╔██╗ ██║██║     ██║   ██║███████║██║  ██║█████╗  ██████╔╝
██║  ██║██║   ██║██║███╗██║██║╚██╗██║██║     ██║   ██║██╔══██║██║  ██║██╔══╝  ██╔══██╗
██████╔╝╚██████╔╝╚███╔███╔╝██║ ╚████║███████╗╚██████╔╝██║  ██║██████╔╝███████╗██║  ██║
╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝
"
echo ""
echo -e $BLUE "Source based on @AZZATSSINS"
echo -e $YELLOW "GUI made by @0n1cOn3"
echo ""
}

reset(){
    clear
    reset screen
    sleep 1.2
}

repobanner(){
    clear
    banner
    echo -e $GREEN "Reading repo list"
    sleep 0.3
    clear
    banner
    echo -e $GREEN "Reading repo list."
    sleep 0.3
    clear
    banner
    echo -e $GREEN "Reading repo list.."
    sleep 0.3
    clear
    banner
    echo -e $GREEN "Reading repo list..."
    sleep 0.3
    clear
    banner
    echo -e $GREEN "Reading repo list"
    sleep 0.3
    clear
    banner
    echo -e $GREEN "Reading repo list."
    sleep 0.3
    clear
    banner
    echo -e $GREEN "Reading repo list.."
    sleep 0.3
    clear
    banner
    echo -e $GREEN "Reading repo list..."
    sleep 0.3
    clear
    banner

}

setup(){
    banner
    sleep 3
    repobanner
    i=1  
    while read line; do 
    #Reading each line 
    clear
    banner 
    echo " Repo No. $i of $maxgit file cloned "
    git clone --progress $line &
    echo -e $GREEN "Cloning in Progress... Please wait" && spinner $!
    i=$((i+1))
    done < $file  
}

cleanup(){
    reset
    banner
    echo -e "Everything has been cloned..."
    sleep 1
    echo -e "Thanks for using HackPack Downloader"
    sleep 2
    clear
    ls
}

setup
cleanup