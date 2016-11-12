#!/bin/bash

#license file path
RUTA=.

function insert_gpl()
{
        mv $1 /tmp/tmp.c
        #open comment
        echo "/**" > $1
        #copy GPL
        cat $RUTA/gpl.txt >> $1
        #close comentario
        echo " */" >> $1
        #insert empty line
        echo "" >> $1        
        #insert original file
        cat /tmp/tmp.c >> $1
        #delete copy
        rm /tmp/tmp.c
}

function usage () 
{
    echo "Usage: $0 <directory> <file_extension>"
    exit 1
}

if [ ! $# == 2 ]
then
    usage
fi

#Check if is a directory
[ -d $1 ] && cd $1

#get extension from comand line
ext=$2

#put gpl in directory files
for file in *.$ext
do
        insert_gpl $file
done
