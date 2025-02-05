#!/usr/bin/env bash

cd "$1" || exit
touch content.html
touch failed_login_summary.html
cat ./country_dist.html ./hours_dist.html ./username_dist.html > content.html
../bin/wrap_contents.sh ./content.html ../html_components/summary_plots ./failed_login_summary.html