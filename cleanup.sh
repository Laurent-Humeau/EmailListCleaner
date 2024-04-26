#!/bin/bash

# Function to check if file name ends with .txt
validate_filename() {
    filename="$1"
    if [[ ! "$filename" =~ \.txt$ ]]; then
        echo "Error: File name must end with .txt"
        exit 1
    fi
}

# Ask user for input file name
read -p "Enter input file name: " input_filename
validate_filename "$input_filename"

# Ask user for output file name
read -p "Enter output file name: " output_filename
validate_filename "$output_filename"

# Read content from input file
if [[ ! -f "$input_filename" ]]; then
    echo "Error: Input file not found"
    exit 1
fi

# Sort content alphabetically
sort "$input_filename" -o "$input_filename"

# Function to prompt user for keywords
prompt_keywords() {
    read -p "Enter GOOD keywords separated by spaces or commas: " good_input
    read -p "Enter BAD keywords to filter out separated by spaces or commas: " bad_input

    # Convert comma-separated input to space-separated
    good_keywords=($good_input)
    bad_keywords=($bad_input)
}

# Function to check if line contains any keyword
contains_keyword() {
    local line="$1"
    local keywords=("${!2}")

    for keyword in "${keywords[@]}"; do
        if [[ "$line" == *"$keyword"* ]]; then
            return 0
        fi
    done
    return 1
}

#call the funtion for the input of bad_keywords
prompt_keywords
# Filter lines based on keyword matching
filtered_lines=()
while IFS= read -r line; do
    if contains_keyword "$line" good_keywords[@]; then
        filtered_lines+=("$line")
    elif ! contains_keyword "$line" bad_keywords[@]; then
        filtered_lines+=("$line")
    fi
done < "$input_filename"




# Write results to output file
printf "%s\n" "${filtered_lines[@]}" > "$output_filename"

echo "Filtered content has been written to $output_filename"
