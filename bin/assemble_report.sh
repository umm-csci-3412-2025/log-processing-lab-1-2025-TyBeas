#!/usr/bin/env bash

# Check if the directory argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Change to the specified directory
cd "$1" || { echo "Failed to change directory to $1"; exit 1; }

# Check if required files exist
for file in country_dist.html hours_dist.html username_dist.html; do
    if [ ! -f "$file" ]; then
        echo "File $file not found in directory $1"
        exit 1
    fi
done

# Create content.html and failed_login_summary.html
touch content.html
touch failed_login_summary.html

# Concatenate the HTML files into content.html
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

# Check if wrap_contents.sh exists and is executable
if [ ! -x ../bin/wrap_contents.sh ]; then
    echo "wrap_contents.sh script is missing or not executable"
    exit 1
fi

# Run wrap_contents.sh to generate the final report
../bin/wrap_contents.sh content.html ../html_components/summary_plots failed_login_summary.html

echo "assemble_report.sh completed successfully"