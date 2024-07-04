#!/bin/bash

# Function to check connectivity
check_connectivity() {
    while IFS= read -r website
    do
        echo "Checking $website..."
        wget -q --spider "$website"

        if [ $? -eq 0 ]; then
            echo "$website is reachable."
        else
            echo "$website is unreachable."
        fi
    done < "websites.txt"
}

# Infinite loop to continuously check connectivity
while true
do
    check_connectivity
    echo "Sleeping for 60 seconds..."
    sleep 60
done
