#!/usr/bin/env bash

here=$(pwd)
mkdir data

for name in cscirepo_secure.tgz discovery_secure.tgz ganesha_secure.tgz mylar_secure.tgz velcro_secure.tgz zeus_secure.tgz
do
        base=$(basename "$name" _secure.tgz)
        mkdir ./data/"$base"
        tar -xzf ./log_files/"$name" -C ./data/"$base"
        ./bin/process_client_logs.sh ./data/"$base"
done

./bin/create_username_dist.sh data
./bin/create_hours_dist.sh data
./bin/create_country_dist.sh data
./bin/assemble_report.sh data

mv ./data/failed_login_summary.html "$here"
rm -rf ./data