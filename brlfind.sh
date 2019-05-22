#! /bin/bash
if [ "$1" = "--help" ] ; then
	echo "This is console utility that helps you to find broren links in path."
	echo "USAGE: type ./brlfind /path where /path - path to your directory"
	echo "NOTE: if you have permission denied error use it under root"
	exit 0
fi

find $1 -type l | while read link; do [ -e 'readlink $link' ] || echo $link; done

