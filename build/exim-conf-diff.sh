#!/usr/bin/env bash

echo -e "\nNew or deleted files\n"
diff <(tree /confdir/) <(tree /etc/exim4/)

echo -e "\nChanged files\n\n"
for file in `find /confdir/ -type f`
do

  realpath=`realpath --relative-to=/confdir $file`

  if [ "`diff $file /etc/exim4/$realpath`" ]
  then
    diff --brief $file /etc/exim4/$realpath
    echo -e "\n"
    diff $file /etc/exim4/$realpath
    echo -e "\n"
  fi

done
