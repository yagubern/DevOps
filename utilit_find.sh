#! /bin/bash
if [ "$1" = "--help" ] ; then
	echo "That utility can help you to find broken links in path."
	echo "USAGE: type ./brlfind /path where /path - path to your directory"
	echo "NOTE: if you have permission denied errors use it under root"
	exit 0
fi

find $1 -type l | while read link; do [ -e 'readlink $link' ] || echo $link; done