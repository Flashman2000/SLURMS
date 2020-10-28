#!/bin/bash
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=185G
#SBATCH -c 20
#SBATCH -C icosa192gb
#SBATCH --time=100:00:00
#SBATCH --job-name=7068_D

module load gatk
module load samtools

cd /mnt/rds/txl80/LaframboiseLab/sxl919/tape/EGA_download/St-Judes/AMKL/AMKL-1-bam/
cp *7068_D*.bam $PFSDIR

cp /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.fa $PFSDIR
cp /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.fa.fai $PFSDIR
cp /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.dict $PFSDIR

cd $PFSDIR

samtools merge 7068_D.bam *.bam

samtools sort -o 7068_D_Sorted.bam 7068_D.bam

gatk --java-options "-Xmx180G" MarkDuplicates --INPUT 7068_D_Sorted.bam --METRICS_FILE 7068_D_metrics.txt --OUTPUT 7068_D_DMarked.bam

gatk --java-options "-Xmx180G" BaseRecalibrator -I 7068_D_DMarked.bam -R GRCh37-lite.fa --known-sites /mnt/rds/txl80/LaframboiseLab/sxl919/sxl919/tools/sxl919/b37/dbsnp_138.b37.vcf -O 7068_D_RecalData.table

gatk --java-options "-Xmx180G" ApplyBQSR -R GRCh37-lite.fa -I 7068_D_DMarked.bam --bqsr-recal-file 7068_D_RecalData.table -O 7068_D_BQSR.bam

cp 7068_D_BQSR.bam /mnt/rds/txl80/LaframboiseLab/vst14/AR_BAM/

rm -rf "$PFSDIR"/* 