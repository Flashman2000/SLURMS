#!/bin/bash
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=60G
#SBATCH -n 16
#SBATCH -N 1
#SBATCH --time=100:00:00

module load gatk
module load samtools

cd /mnt/rds/txl80/LaframboiseLab/sxl919/tape/EGA_download/St-Judes/AMKL/AMKL-1-bam/
cp *$PNUM\_D*.bam $PFSDIR

cp /mnt/rds/txl80/LaframboiseLab/vst14/ref/GRCh37-lite.fa $PFSDIR
cp /mnt/rds/txl80/LaframboiseLab/vst14/ref/GRCh37-lite.fa.fai $PFSDIR
cp /mnt/rds/txl80/LaframboiseLab/vst14/ref/GRCh37-lite.dict $PFSDIR

cd $PFSDIR

echo "done copying"

date

samtools merge $PNUM\_D.bam *.bam

samtools sort -o $PNUM\_D_Sorted.bam $PNUM\_D.bam

gatk --java-options "-Xmx60G" MarkDuplicates --INPUT $PNUM\_D_Sorted.bam --METRICS_FILE $PNUM\_D_metrics.txt --OUTPUT $PNUM\_D_DMarked.bam

gatk --java-options "-Xmx60G" BaseRecalibrator -I $PNUM\_D_DMarked.bam -R GRCh37-lite.fa --known-sites /mnt/rds/txl80/LaframboiseLab/sxl919/sxl919/tools/sxl919/b37/dbsnp_138.b37.vcf -O $PNUM\_D_RecalData.table

gatk --java-options "-Xmx60G" ApplyBQSR -R GRCh37-lite.fa -I $PNUM\_D_DMarked.bam --bqsr-recal-file $PNUM\_D_RecalData.table -O $PNUM\_D_BQSR.bam

date

cp $PNUM\_D_BQSR.bam /mnt/rds/txl80/LaframboiseLab/vst14/PB_Test/

rm -rf "$PFSDIR"/* 