#!/usr/bin/env bash
SCRATCH=$(mktemp -d)
home=$(pwd)
cd "$1" || exit
cat "$home/html_components/hours_dist_header.html" > hours_dist.html
for f in */; do
    [[ -d $f ]] || continue
    awk '{print $2}' "$f/failed_login_data.txt" >> "$SCRATCH/listOfHours.txt"
done
sort "$SCRATCH/listOfHours.txt" | uniq -c | sort -k2,2n | awk '{printf "data.addRow([\x27%02d\x27, %d]);\n", $2, $1}' >> hours_dist.html

cat "$home/html_components/hours_dist_footer.html" >> hours_dist.html
rm -r "$SCRATCH"
