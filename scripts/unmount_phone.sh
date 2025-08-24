#!/bin/bash

# Check if mounted
if mountpoint -q ~/phone; then
	fusermount3 -u ~/phone
	echo "Phone unmounted from ~/phone"
else
	echo "Phone is not mounted."
fi
