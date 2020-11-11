#!/bin/bash
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=185G
#SBATCH -p gpu -C gpu4v100
#SBATCH -c 24
#SBATCH --time=16:00:00

module load gatk
module load samtools

cd /mnt/rds/txl80/LaframboiseLab/vst14/PB_Test/

echo "starting index"
date

samtools index 7044_D_BQSR.bam

echo "finished index"
date

gatk --java-options "-Xmx185G" HaplotypeCaller -R /mnt/rds/txl80/LaframboiseLab/vst14/ref/GRCh37-lite.fa -I 7044_D_BQSR.bam -O 7044_D.g.vcf -ERC GVCF