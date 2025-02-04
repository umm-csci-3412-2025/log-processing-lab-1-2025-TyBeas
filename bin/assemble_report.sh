#!/usr/bin/env bash

cd "$1" || exit

touch content.html
touch failed_login_summary.html

{
    echo "<!-- ++++++++++++ START OF COUNTRY HEADER +++++++++++++++++++++++++++++++ -->"
    cat ./country_dist.html
    echo "<!-- ++++++++++++ END OF COUNTRY HEADER +++++++++++++++++++++++++++++++ -->"
    echo "<!-- ++++++++++++ START OF HOURS HEADER +++++++++++++++++++++++++++++++ -->"
    cat ./hours_dist.html
    echo "<!-- ++++++++++++ END OF HOURS HEADER +++++++++++++++++++++++++++++++ -->"
    echo "<!-- ++++++++++++ START OF USERNAME HEADER +++++++++++++++++++++++++++++++ -->"
    cat ./username_dist.html
    echo "<!-- ++++++++++++ END OF USERNAME HEADER +++++++++++++++++++++++++++++++ -->"
} > content.html

../bin/wrap_contents.sh ./content.html ../html_components/summary_plots ./failed_login_summary.html