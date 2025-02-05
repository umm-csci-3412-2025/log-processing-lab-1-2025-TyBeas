#!/usr/bin/env bash

mkdir /tmp/SCRATCH

temp_dir=/tmp/SCRATCH

for dir in "$@"
do
	computer=$(basename "$dir" .tgz)
	mkdir -p "$temp_dir"/"$SCRATCH"
	tar zxf "$dir" --directory "$temp_dir"/"$SCRATCH"
	./bin/process_client_logs.sh "$temp_dir"/"$SCRATCH"
done

./bin/create_username_dist.sh "$temp_dir"
./bin/create_hours_dist.sh "$temp_dir"
./bin/create_country_dist.sh "$temp_dir"
./bin/assemble_report.sh "$temp_dir"

mv "$temp_dir"/failed_login_summary.html "$(pwd)"

rm -rf "$temp_dir"