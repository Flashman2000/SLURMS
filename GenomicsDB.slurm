#!/bin/bash
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=185G
#SBATCH -c 24
#SBATCH -p gpu -C gpu4v100
#SBATCH --time=10-00:00:00

module load gatk

cd /mnt/rds/txl80/LaframboiseLab/vst14/AR_BAM/

gatk --java-options "-Xmx175G" GenomicsDBImport --genomicsdb-workspace-path /mnt/rds/txl80/LaframboiseLab/vst14/PB_Test/genomicsdb_D/ --tmp-dir /scratch/users/vst14/tmp/ --sample-name-map /mnt/rds/txl80/LaframboiseLab/vst14/AR_BAM/cohort.sample_map -L /mnt/rds/txl80/LaframboiseLab/vst14/SLURMS/intervals.list