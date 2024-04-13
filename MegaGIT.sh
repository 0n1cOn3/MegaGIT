#!/usr/bin/env bash
# V2.0
# Rewritten by 0n1c0n3
# Year: 2023

#import repos
path=$(pwd)
file="repo.txt"
maxgit=$(wc -l repo.txt)
total_size=0

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

# Spinner function
spinner() {
  local pid=$1
  local delay=0.50
  local spinstr='-._'
  while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
    printf " [%c]  " "$spinstr"
    local temp=${spinstr#?}
    local spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b\b"
  done
  printf "    \b\b\b\b"
}

banner(){
clear
echo -e $RED "
Welcome to
 ██████   ██████                               █████████  █████ ███████████
░░██████ ██████                               ███░░░░░███░░███ ░█░░░███░░░█
 ░███░█████░███   ██████   ███████  ██████   ███     ░░░  ░███ ░   ░███  ░ 
 ░███░░███ ░███  ███░░███ ███░░███ ░░░░░███ ░███          ░███     ░███    
 ░███ ░░░  ░███ ░███████ ░███ ░███  ███████ ░███    █████ ░███     ░███    
 ░███      ░███ ░███░░░  ░███ ░███ ███░░███ ░░███  ░░███  ░███     ░███    
 █████     █████░░██████ ░░███████░░████████ ░░█████████  █████    █████   
░░░░░     ░░░░░  ░░░░░░   ░░░░░███ ░░░░░░░░   ░░░░░░░░░  ░░░░░    ░░░░░    
                          ███ ░███                                         
                         ░░██████                                          
                          ░░░░░░                                           "
echo ""
echo -e $BLUE "Original source based from @AZZATSSINS"
echo -e $YELLOW "rewritten between Oct 2022 -- Jan 2023 @0n1cOn3"
echo ""
}

reset(){
    clear
    reset screen
    sleep 1.2
}

setup() {
    banner
    sleep 3
    for i in {1..10}; do
        clear
        banner
        echo -e "$GREEN Reading repo list"
        sleep 0.3
        clear
        banner
        echo -e "$GREEN Reading repo list."
        sleep 0.3
        clear
        banner
        echo -e "$GREEN Reading repo list.."
        sleep 0.3
        clear
        banner
        echo -e "$GREEN Reading repo list..."
        sleep 0.3
    done

    i=1
    while read -r line; do
        clear
        banner
        echo "Repo No. $i of $maxgit file cloned"
        git clone --recurse-submodules --shallow-submodules --depth=1 --progress --verbose "$line" &
        echo -e "$GREEN Cloning in Progress... Please wait"
        spinner "$!"
        echo -e "$BLUE Calculating size of cloned repo..."
        repo_size=$(du -sh "$line" | awk '{print $1}')
        echo -e "$CYAN Size of $line: $repo_size"
        total_size=$((total_size + ${repo_size%K}))
        i=$((i + 1))
    done < "$file"

    echo -e "$YELLOW Total size of cloned repositories: ${total_size}K"
}

cleanup() {
    reset
    banner
    echo -e "Everything has been cloned! :)"
    sleep 1
    echo -e "Thanks for using MegaGIT"
    sleep 2
    clear
    ls
}

setup
cleanup
