#!/bin/sh

# function for counting files within a specified directory
# usage: count_files <directory> <file_extension> 
count_files () {
        if [ "$#" == 2 ]; then
                local target=$1
                local ext=$2
        elif [ "$#" == 1 ]; then
                local target=$1
                local ext=-1
        else
                local target="./"
                local ext=-1
        fi
        
        if [ "$ext" != -1 ]; then
                local res=$(find $target -maxdepth 1 -type f -name "*.$ext" -printf x | wc -c)
        else
                local res=$(find $target -maxdepth 1 -type f -name "*" -printf x | wc -c)
        fi

        echo "$res"
}

# function for counting directories within a specified one
# usage: count_dirs <directory>
count_dirs () {
        if [ "$#" == 1 ]; then
                local target=$1
        else
                local target="./"
        fi

        local res=$(echo "$(find $target -maxdepth 1 -type d -name "*" -printf x | wc -c) - 1" | bc)
        echo "$res"
}

# count .zip files
zip_count=$(count_files ./ zip)

# count .rar files
rar_count=$(count_files ./ rar)

# count .7z files
sz_count=$(count_files ./ 7z) 

# total count
count_total=$(echo "$zip_count + $rar_count + $sz_count" | bc)

# check if any archives were found
if [ $count_total == 0 ]; then
        echo "No archives were found"
        exit 1
else
        echo "Start extracting"
        start_time=$SECONDS
fi

# check if a path for already processed archives exist
if [ ! -d "archives_done"  ]; then
        # if it doesnt then we make a new one
        mkdir "archives_done"
fi

count_current=0

echo "Processing .zip archives"

# process .zip archives
if [ $zip_count != 0 ]; then 
        for archive in *.zip; do
                count_current=$(echo "$count_current + 1" | bc)
                echo "$count_current/$count_total -- $archive in process..."
                mkdir ".tmp"
                unzip -qq -d ".tmp" "$archive"
        
                # check if the insides of the archive are contained in a folder
                if [ $(count_files .tmp) == 1 -a $(count_dirs .tmp) == 1 ]; then
                        folder_name=$(basename ".tmp/*/")
                        mv ".tmp/$folder_name" "$folder_name"
                else
                        folder_name=$(basename "$archive" ".zip")
                        mv ".tmp" "$folder_name"
                fi

                mv "$archive" "archives_done"/"$archive"
                rm -rf ".tmp"
                echo "done"
        done
else
        echo "No .zip archives were found, moving on..."
fi

echo "Processing .rar archives"

# process .rar archives
if [ $rar_count != 0 ]; then
        for archive in *.rar; do
                count_current=$(echo "$count_current + 1" | bc)
                echo "$count_current/$count_total -- $archive in process..."
                mkdir ".tmp"
                unrar -idq e "$archive" ".tmp"

                # check if the insides of the archive are contained in a folder
                if [ $(count_files .tmp) == 1 -a $(count_dirs .tmp) == 1 ]; then
                        folder_name=$(basename ".tmp/*/")
                        mv ".tmp/$folder_name" "$folder_name"
                else
                        folder_name=$(basename "$archive" ".rar")
                        mv ".tmp" "$folder_name"
                fi

                mv "$archive" "archives_done"/"$archive"
                rm -rf ".tmp"
                echo "done"
        done
else
        echo "No .rar archives were found, moving on..."
fi

echo "Processing .7z archives"

# process .7z archives
if [ $sz_count != 0 ]; then
        for archive in *.7z; do
                count_current=$(echo "$count_current + 1" | bc)
                echo "$count_current/$count_total -- $archive in process..."
                mkdir ".tmp"
                7za e -o".tmp" -bso0 -bd -- "$archive"

                # check if the insides of the archive are contained in a folder
                if [ $(count_files .tmp) == 1 -a $(count_dirs .tmp) == 1 ]; then
                        folder_name=$(basename ".tmp/*/")
                        mv ".tmp/$folder_name" "$folder_name"
                else
                        folder_name=$(basename "$archive" ".7z")
                        mv ".tmp" "$folder_name"
                fi

                mv "$archive" "archives_done"/"$archive"
                rm -rf ".tmp"
                echo "done"
        done
else
        echo "No .7z archives were found, moving on..."
fi

elapsed_time=$(($SECONDS - $start_time))
echo "Extracting finished. Extracted $count_total archives in $elapsed_time seconds"
