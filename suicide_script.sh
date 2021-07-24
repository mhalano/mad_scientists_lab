#!/bin/sh -x

# Do what you need to do
echo -n "Commiting suicide...\n"

# A nice touch
dd if=/dev/urandom of=$0 bs=1k count=1 >/dev/null

# Don't try to mess with me
chattr -i $0

# This is the end. Goodbye world (may be you like to use shred instead)
rm $0

