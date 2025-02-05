#!/bin/bash

inputFiles=("$@")
tempDir=$(mktemp -d)

for logFile in "${inputFiles[@]}"
do
baseFileName="${logFile%_secure.*}"
baseFileName=$(basename "$baseFileName")
logDir="$tempDir"/"$baseFileName"
mkdir -p "$logDir"
tar -xzf "$logFile" -C "$logDir"
bin/process_client_logs.sh "$logDir"
done

bin/create_username_dist.sh "$tempDir"
bin/create_hours_dist.sh "$tempDir"
bin/create_country_dist.sh "$tempDir"
bin/assemble_report.sh "$tempDir"

mv "$tempDir"/failed_login_summary.html ./failed_login_summary.html