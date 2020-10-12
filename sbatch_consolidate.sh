#!/bin/bash

for d in /mnt/rds/txl80/LaframboiseLab/vst14/AR_BAM/*.bam
do
  File="$(basename -- $d)"
  FN=${File%.*}
  sbatch --export=bam=$File,filename=$FN --job-name=$FN generic_consolidate.slurm
done