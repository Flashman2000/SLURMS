#!/bin/bash
#SBATCH --job-name="45D"
#SBATCH --mail-type=ALL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=50G
#SBATCH -n 6
#SBATCH -N 1
#SBATCH --time=16:00:00

module load gatk
module load samtools

cd /mnt/rds/txl80/LaframboiseLab/vst14/merged_bams/
mkdir 7045_D

cd /mnt/rds/txl80/LaframboiseLab/sxl919/tape/EGA_download/St-Judes/AMKL/AMKL-1-bam/
cp *7045_D*.bam $PFSDIR

cp /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.fa $PFSDIR
cp /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.fa.fai $PFSDIR
cp /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.dict $PFSDIR

cd $PFSDIR

samtools merge 7045_D.bam *.bam

samtools sort -o 7045_D_Sorted.bam 7045_D.bam

gatk --java-options "-Xmx50G" MarkDuplicates --INPUT 7045_D_Sorted.bam --METRICS_FILE 7045_D_metrics.txt --OUTPUT 7045_D_DMarked.bam

gatk --java-options "-Xmx50G" BaseRecalibrator -I 7045_D_DMarked.bam -R GRCh37-lite.fa --known-sites /mnt/rds/txl80/LaframboiseLab/sxl919/sxl919/tools/sxl919/b37/dbsnp_138.b37.vcf -O 7045_D_RecalData.table

cp 7045_D_RecalData.table /mnt/rds/txl80/LaframboiseLab/vst14/merged_bams/7045_D/

gatk --java-options "-Xmx50G" ApplyBQSR -R GRCh37-lite.fa -I 7045_D_DMarked.bam --bqsr-recal-file 7045_D_RecalData.table -O 7045_D_BQSR.bam

cp 7045_D_BQSR.bam /mnt/rds/txl80/LaframboiseLab/vst14/merged_bams/7045_D/

rm -rf "PFSDIR"/* 