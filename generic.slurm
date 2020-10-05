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
mkdir $PNUM_D

cd /mnt/rds/txl80/LaframboiseLab/sxl919/tape/EGA_download/St-Judes/AMKL/AMKL-1-bam/
cp *$PNUM_D*.bam $PFSDIR

cp /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.fa $PFSDIR
cp /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.fa.fai $PFSDIR
cp /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.dict $PFSDIR

cd $PFSDIR

samtools merge $PNUM_D.bam *.bam

samtools sort -o $PNUM_D_Sorted.bam $PNUM_D.bam

gatk --java-options "-Xmx50G" MarkDuplicates --INPUT $PNUM_D_Sorted.bam --METRICS_FILE $PNUM_D_metrics.txt --OUTPUT $PNUM_D_DMarked.bam

gatk --java-options "-Xmx50G" BaseRecalibrator -I $PNUM_D_DMarked.bam -R GRCh37-lite.fa --known-sites /mnt/rds/txl80/LaframboiseLab/sxl919/sxl919/tools/sxl919/b37/dbsnp_138.b37.vcf -O $PNUM_D_RecalData.table

cp $PNUM_D_RecalData.table /mnt/rds/txl80/LaframboiseLab/vst14/merged_bams/$PNUM_D/

gatk --java-options "-Xmx50G" ApplyBQSR -R GRCh37-lite.fa -I $PNUM_D_DMarked.bam --bqsr-recal-file $PNUM_D_RecalData.table -O $PNUM_D_BQSR.bam

cp $PNUM_D_BQSR.bam /mnt/rds/txl80/LaframboiseLab/vst14/merged_bams/$PNUM_D/

rm -rf "PFSDIR"/* 