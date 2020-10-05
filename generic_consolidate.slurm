#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=50G
#SBATCH -n 6
#SBATCH -N 1
#SBATCH --time=16:00:00

module load gatk

cd $dir

gatk --java-options "-Xmx50G" HaplotypeCaller -R /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.fa -I *.bam -O $filename\.g.vcf.gz -ERC GVCF