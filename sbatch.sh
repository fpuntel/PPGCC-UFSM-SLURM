#!/bin/bash

srun -o slurm10.out -e slurm10.err INPUT2017-85-10.sh &
srun -o slurm11.out -e slurm11.err INPUT2017-85-11.sh &

wait

