#!/bin/bash

for d in /mnt/rds/txl80/LaframboiseLab/vst14/merged_bams/*/
do
	FN="$(basename -- $d)"
	sbatch --export=dir=$d,filename=$FN --job-name=$FN generic_consolidate.slurm
done