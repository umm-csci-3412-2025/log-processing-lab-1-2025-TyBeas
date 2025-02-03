#!/usr/bin/env bash

cd "$1" || exit
touch hours_dist.html
find . -type f -name 'failed_login_data.txt' -exec cat {} + > tmp_data.txt

sort tmp_data.txt
awk -F"[ :]+" '/.*/ {print $3}'< ./tmp_data.txt > hours_dist.html
sort -n hours_dist.html > tmp_data.txt
uniq -c tmp_data.txt | awk '/.*/ {print "data.addRow([\x27"$2"\x27, "$1"]);"}' > hours_dist.html

cd ..
./bin/wrap_contents.sh "$SCRTACH/hours_dist.html" html_components/hours_dist "$SCRATCH/tmp_data.txt"

cat "$SCRATCH/tmp_data.txt" > "$SCRATCH/hours_dist.html"