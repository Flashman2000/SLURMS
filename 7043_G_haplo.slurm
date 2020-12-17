#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=60G
#SBATCH -n 16
#SBATCH --time=11-00:00:00

module load gatk
cd /mnt/rds/txl80/LaframboiseLab/sxl919/tape/EGA_download/St-Judes/AMKL/AMKL-1-bam
gatk --java-options "-Xmx50g" HaplotypeCaller -R /home/txl80/genomes/GRCh37-lite.fa -I SJAMLM7043_G_bqsr.bam -O SJAMLM7043_G.g.vcf -ERC GVCF
