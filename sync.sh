#!/bin/sh
#
# Usage: 
# $ cd ilanabram.com
# $ ./sync.sh 
#
# NOTE: as currently written, this script must be run from the source dir.
#
# NOTE: use ssh or .netrc for lftp authentication
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

HOST=ilanabram.com
LDIR=/easy/ilanabram.com
RDIR=/

lftp -c "
set mirror:parallel-directories true;
open $HOST;
mirror --reverse --parallel=8 --verbose=1 --exclude sync.sh --exclude .git --exclude-glob .git* --exclude-glob *.swp 
" 


