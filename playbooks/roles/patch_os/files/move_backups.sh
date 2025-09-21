#!/bin/bash
# Example script to move backups to NFS mount with date suffix

src_dir="/var/log"
dest_dir="/mnt/nfs/backups"

# ISO date (YYYY-MM-DD)
date_suffix=$(date +%F)

mkdir -p "$dest_dir"

for file in "$src_dir"/*; do
  if [ -f "$file" ]; then
    base=$(basename "$file")
    mv "$file" "$dest_dir/${base}.${date_suffix}"
  fi
done