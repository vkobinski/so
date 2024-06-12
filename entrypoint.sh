#!/bin/bash

# Wait for the NFS server to be available
/usr/local/bin/wait-for-it.sh nfs_server:2049 -t 60

# Mount the NFS share
mount -t nfs nfs_server:/exports/home /mnt/home

# Keep the container running
exec "$@"