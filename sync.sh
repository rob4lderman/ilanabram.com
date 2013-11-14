#!/bin/sh
#
# Usage: 
# $ cd ilanabram.com
# $ ./sync.sh <user> <pass>
#
# NOTE: as currently written, this script must be run from the source dir.
#
# NOTE: LFTP: if you specify a source-dir without a target-dir, then LFTP will append
#       the basename of the source-dir to the target-dir name (since target-dir is unspecified,
#       it takes on the root).  The same will happen if you specify a target-dir that ends
#       in a "/" (except the root).
#       
#       E.g., 
#           $ mirror --reverse .. /easy/ilanabram.com 
#
#       will create a dir called ilanabram.com on the target host and transfer all files
#       under that directory.
#
#


if [ -z $1 ]; then
    echo "usage: ./sync.sh <user> <pass>"
    exit 1
fi

HOST=ilanabram.com
LDIR=/easy/ilanabram.com
RDIR=/
USER="$1"
PASS="$2"

lftp -c "
open $HOST
user $USER $PASS
mirror --reverse --exclude sync.sh --exclude .git --exclude-glob .git* --exclude-glob *.swp 
"


