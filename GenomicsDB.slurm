#!/bin/bash
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=30G
#SBATCH -n 4
#SBATCH -N 1
#SBATCH --time=100:00:00

module load gatk

cd /mnt/rds/txl80/LaframboiseLab/vst14/AR_BAM/

gatk --java-options "-Xmx23G" GenomicsDBImport --genomicsdb-workspace-path /mnt/rds/txl80/LaframboiseLab/vst14/AR_BAM/genomicsdb_D/ --tmp-dir /mnt/rds/txl80/LaframboiseLab/vst14/tmp/ --sample-name-map cohort.sample_map -L chr1,chr2,chr3,chr4,chr5,chr6,chr7,chr8,chr9,chr10,chr11,chr12,chr13,chr14,chr15,chr16,chr17,chr18,chr19,chr20,chr21,chr22,chrX,chrY,MT