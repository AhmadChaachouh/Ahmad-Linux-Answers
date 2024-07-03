#!/bin/bash 

# Function to display usage instructions in case of invalid input by the user
usage() {
    echo "Usage: $0 <directory_path>"
    exit 1
}

# Check if a directory path is provided
if [ -z "$1" ]; then
    echo "Error: No directory path provided."
    usage
fi

DIRECTORY=$1

# Check if the provided path is a valid directory
if [ ! -d "$DIRECTORY" ]; then  # the -d option helps verify wether the argument is a valid directory
    echo "Error: The provided path is not a valid directory."
    usage
fi

# Initialize counters
dir_count=0
file_count=0
link_count=0

# Use the find command to count directories, regular files, and symbolic links
while IFS= read -r -d '' item; do   #IFS=: IFS stands for Internal Field Separator.
    if [ -d "$item" ]; then         #By setting IFS to an empty value (IFS=), it prevents word splitting on spaces, tabs, and newlines, ensuring that filenames with spaces or special characters are handled correctly.
        ((dir_count++))             #The read command reads a line of input.
    elif [ -f "$item" ]; then       #The -r option tells read not to treat backslashes as escape characters. It reads the input exactly as it is.
        ((file_count++))            #The -d option specifies the delimiter. Setting it to an empty string ('') tells read to use the null character (\0) as the delimiter instead of the default newline character. This is important because filenames can contain newlines, but they cannot contain null characters.
    elif [ -L "$item" ]; then       #item is the variable that will store each line of input read by the read command.
        ((link_count++))
    fi
done < <(find "$DIRECTORY" -mindepth 1 -print0) #This is process substitution. It runs the find command and passes its output to the while loop
#The find command is used to list all items in the specified directory.
#The -mindepth 1 option ensures that the specified directory itself is not included in the count.
#The -print0 option is used to handle filenames with special characters or spaces.
#The script then iterates through each item and increments the respective counter based on the item type.

# Display the counts
echo "Directories: $dir_count"
echo "Regular files: $file_count"
echo "Symbolic links: $link_count"

# Exit the script
exit 0 #The script exits with a status code of 0, indicating successful execution.



