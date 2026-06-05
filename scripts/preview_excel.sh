#!/bin/bash

# A reusable script to quickly convert or preview .xlsx files as CSV.
# Usage: ./preview_excel.sh <path_to_excel_file> [lines_to_preview]

FILE_PATH=$1
LINES=${2:-20} # Default to previewing the first 20 lines

if [ -z "$FILE_PATH" ]; then
  echo "Error: Please provide a path to an Excel file."
  echo "Usage: ./preview_excel.sh <path_to_excel_file> [lines_to_preview]"
  exit 1
fi

echo "Extracting data from $FILE_PATH..."
echo "--------------------------------------------------------"

# Uses the xlsx-cli tool to read the excel file and dump it as CSV, then we preview the top lines
npx -y xlsx-cli "$FILE_PATH" | head -n $LINES
