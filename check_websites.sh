#!/bin/bash

# Check if websites.txt exists
if [ ! -f "websites.txt" ]; then
    echo "Error: websites.txt not found."
    exit 1
fi

# Use wget to browse each website listed in websites.txt
wget -q -O /dev/null -i websites.txt

# Check the exit status of wget
if [ $? -eq 0 ]; then
    echo "All websites are reachable."
else
    echo "Some websites are unreachable or an error occurred."
fi
