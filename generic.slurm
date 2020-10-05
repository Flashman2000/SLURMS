#!/bin/bash
#SBATCH --job-name="$PNUM"
#SBATCH --mail-type=ALL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=50G
#SBATCH -n 6
#SBATCH -N 1
#SBATCH --time=16:00:00

module load gatk
module load samtools

cd /mnt/rds/txl80/LaframboiseLab/vst14/merged_bams/
mkdir $PNUM\_D

cd /mnt/rds/txl80/LaframboiseLab/sxl919/tape/EGA_download/St-Judes/AMKL/AMKL-1-bam/
cp *$PNUM\_D*.bam $PFSDIR

cp /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.fa $PFSDIR
cp /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.fa.fai $PFSDIR
cp /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.dict $PFSDIR

cd $PFSDIR

samtools merge $PNUM\_D.bam *.bam

samtools sort -o $PNUM\_D_Sorted.bam $PNUM\_D.bam

gatk --java-options "-Xmx50G" MarkDuplicates --INPUT $PNUM\_D_Sorted.bam --METRICS_FILE $PNUM\_D_metrics.txt --OUTPUT $PNUM\_D_DMarked.bam

gatk --java-options "-Xmx50G" BaseRecalibrator -I $PNUM\_D_DMarked.bam -R GRCh37-lite.fa --known-sites /mnt/rds/txl80/LaframboiseLab/sxl919/sxl919/tools/sxl919/b37/dbsnp_138.b37.vcf -O $PNUM\_D_RecalData.table

cp $PNUM\_D_RecalData.table /mnt/rds/txl80/LaframboiseLab/vst14/merged_bams/$PNUM\_D/

gatk --java-options "-Xmx50G" ApplyBQSR -R GRCh37-lite.fa -I $PNUM\_D_DMarked.bam --bqsr-recal-file $PNUM\_D_RecalData.table -O $PNUM\_D_BQSR.bam

cp $PNUM\_D_BQSR.bam /mnt/rds/txl80/LaframboiseLab/vst14/merged_bams/$PNUM\_D/

rm -rf "PFSDIR"/* 