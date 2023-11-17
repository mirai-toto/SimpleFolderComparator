# Directory Comparison Script (dircompare.sh)

## Description

dircompare.sh is a Bash script for comparing the contents of two directories. It highlights the unique files in each directory and identifies common files with differences.

## Requirements

- Bash shell
- Linux/Unix environment

## Installation

1. Download the dircompare.sh script.
2. Make the script executable:
   chmod +x dircompare.sh
3. Optionally, move the script to a directory in your PATH to run it from anywhere.

## Usage

Run the script with two directory paths as arguments:
   ./dircompare.sh <folder1_path> <folder2_path>
If the directories do not exist or the incorrect number of arguments is provided, the script will display a usage message.

## Example

Compare two directories named folder1 and folder2:
   ./dircompare.sh /path/to/folder1 /path/to/folder2
The script will output a list of unique files in each directory and any