#!/bin/bash
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=185G
#SBATCH -c 20
#SBATCH -C icosa192gb
#SBATCH --time=100:00:00

module load gatk

cd /mnt/rds/txl80/LaframboiseLab/vst14/AR_BAM/

gatk --java-options "-Xmx175G" GenomicsDBImport --genomicsdb-workspace-path /scratch/users/vst14/genomicsdb_D/ --tmp-dir /scratch/users/vst14/tmp/ --sample-name-map /mnt/rds/txl80/LaframboiseLab/vst14/AR_BAM/cohort.sample_map -L /mnt/rds/txl80/LaframboiseLab/vst14/SLURMS/intervals.list