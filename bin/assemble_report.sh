#! /usr/bin.env bash

cat html_components/summary_plots_start.html "$1/country_dist.html" "$1/hours_dist.html" "$1/username_dist.html" html_components/summary_plots_end.html > "$1/failed_login_summary.html"