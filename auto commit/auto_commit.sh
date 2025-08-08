#! /bin/bash
# программа делает автокомит каждые 10 минут

gh repo clone julianwagle/kommit-king &&
cd kommit-king &&
bash kommit.sh -u <YOUR_GITHUB_USERNAME> -e <YOUR_GITHUB_EMAIL> -t <YOUR_GITHUB_TOKEN>


# чтобы ее остановить

# cd kommit-king && crontab blank.txt 
