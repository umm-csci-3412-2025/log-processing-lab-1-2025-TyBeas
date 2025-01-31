#!/bin/bash

textFile=$1 #Stores the text file as an argument
headerAndFooter=$2 #Stores the files that contain the header and footer as an argument
fileDestination=$3 #Stores the destination file as an argument

# Use concatnate to combine the header and footer files with the text file
# Subsequentally output the result to the destination file
cat "${headerAndFooter}_header.html" "$textFile" "${headerAndFooter}_footer.html" > "$fileDestination"