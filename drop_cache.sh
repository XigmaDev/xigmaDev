#!/bin/bash
drop_cache() {
    local cache_type=$1
    echo "Dropping caches of type $cache_type..."
    sudo sync
    echo $cache_type | sudo tee /proc/sys/vm/drop_caches > /dev/null
    echo "Caches of type $cache_type dropped."
}

# Drop page cache, dentries, and inodes (echo 3)
drop_cache 3

# Drop page cache only (echo 1)
drop_cache 1

# Drop dentries and inodes (echo 2)
drop_cache 2

echo "Reinitializing swap..."
#sudo swapoff -a && sudo swapon -a
echo "Swap reinitialized."

echo "Cache drop and swap reinitialization complete."
