#!/bin/bash
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=185G
#SBATCH -p gpu -C gpu4v100
#SBATCH -n 24
#SBATCH --time=100:00:00

module load gatk

cd /mnt/rds/txl80/LaframboiseLab/vst14/

gatk --java-options "-Xmx180G" GenotypeGVCFs -R /mnt/rds/txl80/LaframboiseLab/vst14/ref/GRCh37-lite.fa \
-V gendb://genomicsdb_D \
-O PB_Test/TEST_OUT.vcf