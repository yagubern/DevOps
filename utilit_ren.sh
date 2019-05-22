#! /bin/bash
old=$1
new=$2
for file in *.old; do
	mv "$file" "$(basenmae "$file" .$old).$new";
done