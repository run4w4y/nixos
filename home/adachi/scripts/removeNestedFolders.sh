#!/bin/sh

# function for counting files within a specified directory
# usage: count_files <directory> <file_extension> 
count_files () {
        if [ "$#" == 2 ]; then
                local target="$1"
                local ext="$2"
        elif [ "$#" == 1 ]; then
                local target="$1"
                local ext=-1
        else
                local target="./"
                local ext=-1
        fi
        
        if [ "$ext" != -1 ]; then
                local res=$(find "$target" -maxdepth 1 -type f -name "*.$ext" -printf x | wc -c)
        else
                local res=$(find "$target" -maxdepth 1 -type f -name "*" -printf x | wc -c)
        fi

        echo "$res"
}

# function for counting directories within a specified one
# usage: count_dirs <directory>
count_dirs () {
        if [ "$#" == 1 ]; then
                local target="$1"
        else
                local target="./"
        fi

        local res=$(echo "$(find "$target" -maxdepth 1 -type d -name "*" -printf x | wc -c) - 1" | bc)
        echo "$res"
}

if [ ! -d empty_folders ]; then
        mkdir empty_folders
fi

for folder in */; do
        if [ $(count_files "$folder") == 0 -a $(count_dirs "$folder") == 1 ]; then
                echo "Processing folder $folder..."
                folder_name=$(basename ./"$folder"/*/)
                mv "$folder"/"$folder_name" ".to_be_renamed"
                mv "$folder" empty_folders/"$folder"
                mv ".to_be_renamed" "$folder_name"
                echo "done"
        fi
done

