#! /bin/bash
name=$USER
arg=$1
echo $arg

function test {
if ! [ -w "$PWD" ]
then
echo "ERROR: cannt write to directory"
return 1
elif [[ -e "$name" && ! -w "$name" ]]
then
echo "ERROR: cannt write to file"
return 1
else
echo "Write OK"
return 0
fi
}

if test
then
printf "%s\n" "$arg" > "$name"
exit 0
else
exit 1
fi
