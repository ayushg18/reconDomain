#!/bin/bash
figlet "     reconDomain      "
printf "   ░▒ ░ ▒░ ░ ░  ░  ░  ▒     ░ ▒ ▒░ ░ ░░   ░ ▒░ ░          ░      ▒ ░ ░  \n"
printf "   ░░   ░    ░   ░        ░ ░ ░ ▒     ░   ░ ░  ░ ░      ░        ░   ░  \n"
printf "    ░        ░  ░░ ░          ░ ░           ░                      ░    \n"
printf "                 ░                                                      \n"
printf " by @vuln4n6\n\n"

read -p "Enter the target: " target
read -p "Target Name: " fileName

subfinder -d $target | tee subdomain-$fileName.txt
cat subdomain-$fileName.txt | httpx -mc 200 | tee 200-$fileName.txt
cat subdomain-$fileName.txt | httpx -mc 404 | tee 404-$fileName.txt
cat subdomain-$fileName.txt | httpx -mc 403 | tee 403-$fileName.txt
cat subdomain-$fileName.txt | waybackurls | tee waybackurls-$fileName.txt
