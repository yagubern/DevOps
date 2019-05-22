!/bin/bash

# каталогом поиска это текущая директория, если нет ввода с командной строки

[ $# -eq 0 ] && directorys=`pwd` || directorys=$@

#Функция linkchk проверяет каталог поиска
#на наличие в нем ссылок на несуществующие файлы, и выводит их имена.

linkchk () {
    for element in $1/*; do
    [ -h "$element" -a ! -e "$element" ] && echo \"$element\"
    [ -d "$element" ] && linkchk $element
    done
}

for directory in $directorys; do
    if [ -d $directory ]
        then linkchk $directory
        else
            echo "$directory is't directory"
            echo "order of use: $0 dir1 dir2 ..."
    fi
done

exit 0