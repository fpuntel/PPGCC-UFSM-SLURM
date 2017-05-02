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
	
	echo "scontrol update NodeName=$no State=IDLE"
	scontrol update NodeName=$no State=IDLE
	
	i=`expr $i + 1`
done
