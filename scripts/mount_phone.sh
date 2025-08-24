#!/bin/bash

# Check if already mounted
if mountpoint -q ~/phone; then
	echo "Phone already mounted."
	exit 0
fi

# Attempt to mount
sshfs phone:/sdcard/Download ~/phone -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3

echo "Phone mounted at ~/phone"
