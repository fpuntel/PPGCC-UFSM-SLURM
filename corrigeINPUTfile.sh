#!/bin/bash

#DAY=`date +%e`
#MONTH=`date +%m`
#YEAR=`date +%y`

totalFile=`ls INPUT2017-85-*.sh | wc -l`

i=1
while test $i -le $totalFile
do
  sed -i '13,15 d' INPUT2017-85-$i.sh
  sed -i '13 a newFILESIZE=$(stat -c%s slurm10.err)' INPUT2017-85-$i.sh
  sed -i '14 a content=`expr $newFILESIZE - $FILESIZE`' INPUT2017-85-$i.sh
  sed -i '15 a FILESIZE=$newFILESIZE' INPUT2017-85-$i.sh
  i=`expr $i + 1`
done

