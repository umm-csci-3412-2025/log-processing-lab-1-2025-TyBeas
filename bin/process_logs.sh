#! /usr/bin/env bash

SCRATCH=$(mktemp -d)
for file in "$@" #for each file in the arguments, find the base name and make a directory
do 
    dirFile=$(basename "$file" .tgz)
    mkdir "$SCRATCH/$dirFile"
    tar -xzf "$file" --directory="$SCRATCH/$dirFile"
    "bin/process_client_logs.sh" "$SCRATCH/$dirFile"

done
bin/create_username_dist.sh "$SCRATCH" #run bash here
bin/create_hours_dist.sh "$SCRATCH"
bin/create_country_dist.sh "$SCRATCH"
bin/assemble_report.sh "$SCRATCH"

mv "$SCRATCH/failed_login_summary.html" . #destination