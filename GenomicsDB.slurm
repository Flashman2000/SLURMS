#!/bin/bash
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=30G
#SBATCH -n 4
#SBATCH -N 1
#SBATCH --time=100:00:00

module load gatk

cd /mnt/rds/txl80/LaframboiseLab/vst14/AR_BAM/

gatk --java-options "-Xmx23G" GenomicsDBImport --genomicsdb-workspace-path /mnt/rds/txl80/LaframboiseLab/vst14/AR_BAM/genomicsdb_D/ --tmp-dir /mnt/rds/txl80/LaframboiseLab/vst14/tmp/ --sample-name-map cohort.sample_map -L /mnt/rds/txl80/LaframboiseLab/vst14/SLURMS/intervals.list