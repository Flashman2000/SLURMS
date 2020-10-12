#!/bin/bash
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=6G
#SBATCH -n 8
#SBATCH -N 1
#SBATCH --time=16:00:00

module load gatk
module load samtools

cd /mnt/rds/txl80/LaframboiseLab/vst14/AR_BAM/

samtools index $bam

gatk --java-options "-Xmx8G" HaplotypeCaller -R /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.fa -I $bam -O $filename\.g.vcf.gz -ERC GVCF