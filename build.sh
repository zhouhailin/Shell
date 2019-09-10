#!/bin/bash

#
#
#
#

# static 
CFLAGS=-static


# enter current directory.
SHELL_HOME=`cd $(dirname "$0") && pwd`
cd $SHELL_HOME

# md5 file
MD5_FILE=$SHELL_HOME"/.shell.md5"
MD5_FILE_TMP=$SHELL_HOME"/.shell.md5.tmp"


# $1 filename  md5
file_md5_match(){
  return `cat $MD5_FILE|grep "$1"|wc -l`
}

# $1 filename
do_shc(){
  FILENAME=$1
  echo "shc $FILENAME --> bin/$FILENAME"
  echo $FILENAME
  shc -f $FILENAME
  if [ -f "../bin/"$FILENAME ];then  
    rm -f "../bin/"$FILENAME
  fi
  rm -f $FILENAME".x.c"
  mv $FILENAME".x" "../bin/"$FILENAME
}

do_working(){
  cd $SHELL_HOME
  # enter src directory
  if [ -f "$MD5_FILE_TMP" ];then
    rm -f $MD5_FILE_TMP
  fi

  HAS_DIFF=0
  cd src
  for f in `ls`
  do
    MD5_STR=`md5sum $f`
    file_md5_match "$MD5_STR"
    if [ $? -eq 0 ];then
      do_shc $f
      HAS_DIFF=1
    fi
    echo "$MD5_STR" >> $MD5_FILE_TMP
  done
  if [ $HAS_DIFF -eq 1 ];then
    cat $MD5_FILE_TMP > $MD5_FILE
  fi

  rm -f $MD5_FILE_TMP
}

do_clean(){
  cd $SHELL_HOME
  rm -f src/*.x
  rm -f src/*.x.c
}

main(){

  do_clean

  do_working

}

main $*
