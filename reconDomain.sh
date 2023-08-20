#!/bin/bash
figlet "     reconDomain      "
printf "   ░▒ ░ ▒░ ░ ░  ░  ░  ▒     ░ ▒ ▒░ ░ ░░   ░ ▒░ ░          ░      ▒ ░ ░  \n"
printf "   ░░   ░    ░   ░        ░ ░ ░ ▒     ░   ░ ░  ░ ░      ░        ░   ░  \n"
printf "    ░        ░  ░░ ░          ░ ░           ░                      ░    \n"
printf "                 ░                                                      \n"
printf " by @vuln4n6\n\n"

read -p "Enter the target: " target
read -p "Target Name: " fileName

subfinder -d $target | tee $fileName-subdomain.txt
cat $fileName-subdomain.txt | httpx -mc 200 | tee 200-$fileName.txt
cat $fileName-subdomain.txt | httpx -mc 404 | tee 404-$fileName.txt
cat $fileName-subdomain.txt | httpx -mc 403 | tee 403-$fileName.txt
cat $fileName-subdomain.txt | waybackurls | tee $fileName-WaybackUrls.txt
