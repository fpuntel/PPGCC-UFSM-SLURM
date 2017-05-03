#!/bin/bash

# Algoritmo para colocar todos os nodes como IDLE no SLURM
# Fernando Emilio Puntel 05-2017

totalNos=`sinfo -N | wc | awk '{print $1}'`
totalNos=`expr $totalNos - 1`

echo "TotalNos: " $totalNos

i=0

while test $i -le $totalNos
do
	no=`sinfo -N | tail -$i | head -n1 | awk '{print $1}'`
	
	echo "scp /etc/slurm/slurm.conf root@$no:/etc/slurm/slurm.conf"
	scp /etc/slurm/slurm.conf root@$no:/etc/slurm/slurm.conf
	
	echo "scp /etc/slurm/slurm.conf root@$no:/usr/local/etc/slurm.conf"
	scp /etc/slurm/slurm.conf root@$no:/usr/local/etc/slurm.conf

	i=`expr $i + 1`
done




