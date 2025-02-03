#!/usr/bin/env bash

client_dir=$1
here=$(pwd)
cd "$client_dir" || exit

touch failed_login_data.txt
cat ./var/log/* | awk -F"[ :]+" '/Failed password for invalid user/ {print $1,$2,$3,$13,$15}'>> failed_login_data.txt
cat ./var/log/* | awk -F"[ :]+" '/Failed password for/ && !/invalid/ {print $1,$2,$3,$11,$13}' >> failed_login_data.txt

cd "$here" || exit