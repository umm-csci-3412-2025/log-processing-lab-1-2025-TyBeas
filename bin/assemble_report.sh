#!/usr/bin/env bash

cd "$1" || exit

touch content.html
touch failed_login_summary.html

cat ./country_dist.html ./hours_dist.html ./username_dist.html > content.html

cat ./html_components/header.html ./content.html ./html_components/footer.html > failed_login_summary.html