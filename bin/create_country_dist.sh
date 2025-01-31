#! /usr/bin/env bash

SCRATCH=$(mktemp -d)
home=$(pwd)
cd "$1" || exit
cat $home/html_components/country_dist_header.html > country_dist.html
for f in */; do
    [[ -d $f ]] || break
    awk '{print $5}' "$f/failed_login_data.txt" >> "$SCRATCH/listOfIP.txt"

done
sort "$SCRATCH/listOfIP.txt" | join -o 1.2 "$home/etc/country_IP_map.txt" - | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' >> country_dist.html
cat $home/html_components/country_dist_footer.html >> country_dist.html