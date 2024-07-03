# Linux Answers

1. **Question 1:**
   - "ls -l" lists the content of the directory with detailled information about each entry, 	 while "ls -a" lists all files in the directory including hidden files.

2. **Question 2:**
   - One scenario is not having the permission to create the directory when working in the /root directory for example. To solve this issue we can use a script to automate handling it:
   *****************************
#!/bin/bash

##Directory to be created##
DIR="/root/new_directory"

##Function to create directory with necessary measures##
create_directory() {
  local dir=$1
  if mkdir "$dir"; then
    echo "Directory '$dir' created successfully."
  else
    local error=$?
    echo "Failed to create directory '$dir'. Error code: $error"
    
    # Handle specific errors
    if [ $error -eq 1 ]; then
      echo "Permission denied. Trying to create directory with sudo."
      if sudo mkdir "$dir"; then
        echo "Directory '$dir' created successfully with sudo."
      else
        echo "Failed to create directory '$dir' even with sudo."
        exit 1
      fi
    elif [ $error -eq 2 ]; then
      echo "No such file or directory. Trying to create parent directories."
      if mkdir -p "$dir"; then
        echo "Directory '$dir' created successfully with parent directories."
      else
        echo "Failed to create directory '$dir' with parent directories."
        exit 1
      fi
    else
      echo "An unexpected error occurred: $error"
      exit 1
    fi
  fi
}

##Call the function to create the directory##
create_directory "$DIR"

*********************************
this script checks the error code and acts accordingly using conditions.

3. **Question 3:**
   - cat file1 file2 > newfile.
 
1. **Question 4:**
   - To use cat for file creation you have to use echo and the '>' operator to add the the text to the new file, if the file already exists iti will be overwritten.
example: echo "hi" | cat > textfile.txt
Touch is used to update file timestamps. Creates an empty file if it does not exist, or updates timestamps if the file exists.

2. **Question 5:**
   - When used with the cp command wildcards (such as *, ? or []) can be used to create patterns to selectively copy files with names that matches the pattern. Example: cp *.pdf /path/to/destination copies all files with .pdf extension to the destination directory.
   
3. **Question 6:**
   - To navigate to the parent directory we use "cd ..".
   
1. **Question 7:**
   - When using the mv command to move or rename files, if the destination file already exists, it will be overwritten without any prompt by default. To avoid accidental overwrites, you can use the -i (interactive) option, which prompts before overwriting.

2. **Question 8:**
   - The pwd command prints the current working directory. In scripting, pwd is significant because it can be used to obtain and store the current directory path for various purposes.

3. **Question 9:**
   - whereis: Locates the binary, source, and manual page files for a command.
     whatis: Provides a brief description of a command.
     which: Shows the path of the executable that would run when the command is entered.
1. **Question 10:**
   - man: Provides manual pages that are usually concise and structured in sections (NAME, SYNOPSIS, DESCRIPTION, etc.).
     info: Provides more detailed and often more readable documentation, including hypertext navigation.

2. **Question 11:**
   - The grep command searches for a specific pattern in files.
     To search for a pattern in all text files within a directory:
     grep "pattern" *.txt

3. **Question 12:**
   - head: Displays the first 10 lines of a file.
     tail: Displays the last 10 lines of a file.
     To customize the number of lines displayed, use the -n option. Example: "head -n 20 file.txt" shows the first 20 lines of file.txt.
1. **Question 13:**
   - The tac command concatenates and displays files in reverse. It is useful in text processing or data analysis when you need to reverse the order of lines.

2. **Question 14:**
   - The echo command is used to display text. It can show both static content (such as plain text) and dynamic content (such as variable values).

3. **Question 15:**
   - The df command reports file system disk space usage. It is useful for system administrators to monitor disk usage.
1. **Question 16:**
   - df: Provides an overview of disk space usage for file systems.
     du: Summarizes disk usage of files and directories.

2. **Question 17:**
   - To identify processes consuming the most CPU resources, use the ps command with sorting    and head: ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head

3. **Question 18:**
   - An alias is a shortcut for a command or a series of commands. Aliases improve command-line efficiency
   .
1. **Question 19:**
   - The uname command provides system information such as the kernel name, version, and architecture.

2. **Question 20:**
   - sudo: Executes a single command with superuser privileges.
     su: Switches to the superuser account (or another user account).
     Use sudo for specific commands requiring elevated privileges and su to switch user contexts entirely. 
