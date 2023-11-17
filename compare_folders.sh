#!/bin/bash

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to display usage information
usage() {
    echo -e "${RED}Usage: $0 <folder1_path> <folder2_path>${NC}"
    echo "Compares the contents of two directories."
}

# Validate arguments
if [ $# -ne 2 ]; then
    usage
    exit 1
fi

folder1="$1"
folder2="$2"

# Check directory existence
if [ ! -d "$folder1" ] || [ ! -d "$folder2" ]; then
    echo -e "${RED}Error: One or both directories do not exist.${NC}"
    usage
    exit 1
fi

# Process and print each line
process_line() {
    local base_folder=$(basename "$2")
    echo "${1/Only in ${2}: /[${base_folder}]:}"
}

# Process diff output for a specific pattern
process_diff_output() {
    local pattern="$1"
    local color="$2"
    echo -e "${color}Unique to ${pattern}:${NC}"
    diff -rq "$folder1" "$folder2" | grep "Only in ${pattern}" | while read -r line; do
        process_line "$line" "$pattern"
    done
}

# Compare directories
compare_directories() {
    process_diff_output "$folder1" "$GREEN"
    process_diff_output "$folder2" "$GREEN"

    # Common but different files
    echo -e "${GREEN}Common but Different:${NC}"
    diff -rq "$folder1" "$folder2" | grep -v "Only in" | while read -r line; do
        echo "$line"
    done
}

compare_directories
