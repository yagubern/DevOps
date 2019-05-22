#! /bin/bash
name=$USER
arg=$1
echo $arg

function check {
if ! [ -w "$PWD" ]
then
echo "ERROR: you can't write to directory"
return 1
elif [[ -e "$name" && ! -w "$name" ]]
then
echo "ERROR: you can't write to file"
return 1
else
echo "Write successful"
return 0
fi
}

if check
then
printf "%s\n" "$arg" > "$name"
exit 0
else
exit 1
fi