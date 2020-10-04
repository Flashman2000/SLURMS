#!/bin/bash
#SBATCH --job-name="69D"
#SBATCH --mail-type=ALL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=50G
#SBATCH -n 6
#SBATCH -N 1
#SBATCH --time=6-00:00:00

module load gatk
module load samtools

cp /mnt/rds/txl80/LaframboiseLab/sxl919/tape/EGA_download/St-Judes/AMKL/AMKL-1-bam/_EGAR00001510086_SJAMLM7069_D-C18LKACXX.5.bam.sorted.bam.mapped.bam.dedupped.bam.recaled.bam $PFSDIR
cp /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.fa $PFSDIR
cp /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.fa.fai $PFSDIR
cp /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.dict $PFSDIR

cd $PFSDIR

mv _EGAR00001510086_SJAMLM7069_D-C18LKACXX.5.bam.sorted.bam.mapped.bam.dedupped.bam.recaled.bam 7069_D.bam

samtools sort -o 7069_D_Sorted.bam 7069_D.bam

gatk --java-options "-Xmx50g" MarkDuplicates --INPUT 7069_D_Sorted.bam --METRICS_FILE 7069_D_metrics.txt --OUTPUT 7069_D_DMarked.bam

cp 7069_D_DMarked.bam 7069_D_metrics.txt /mnt/rds/txl80/LaframboiseLab/vst14/merged_bams/

gatk --java-options "-Xmx50G" BaseRecalibrator -I 7069_D_DMarked.bam -R GRCh37-lite.fa --known-sites /mnt/rds/txl80/LaframboiseLab/sxl919/sxl919/tools/sxl919/b37/dbsnp_138.b37.vcf -O 7069_D_RecalData.table

gatk --java-options "-Xmx50G" ApplyBQSR -R GRCh37-lite.fa -I 7069_D_DMarked.bam --bqsr-recal-file 7069_D_RecalData.table -O 7069_D_BQSR.bam

cp 7069_D_BQSR.bam /mnt/rds/txl80/LaframboiseLab/vst14/merged_bams/

rm -rf "$PFSDIR"/*





