#!/bin/bash
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=70G
#SBATCH -n 10
#SBATCH -N 1
#SBATCH --time=100:00:00

module load gatk

cd /mnt/rds/txl80/LaframboiseLab/vst14/AR_BAM/

gatk --java-options "-Xmx50G" GenomicsDBImport --genomicsdb-workspace-path /mnt/rds/txl80/LaframboiseLab/vst14/AR_BAM/genomicsdb_D/ --tmp-dir /mnt/rds/txl80/LaframboiseLab/vst14/tmp/ --sample-name-map cohort.sample_map -L 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,X,Y,MT