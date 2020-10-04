#!/bin/bash
#SBATCH --job-name="59D"
#SBATCH --mail-type=ALL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=50G
#SBATCH -n 6
#SBATCH -N 1
#SBATCH --time=16:00:00

module load gatk
module load samtools

cp /mnt/rds/txl80/LaframboiseLab/sxl919/tape/EGA_download/St-Judes/AMKL/AMKL-1-bam/_EGAR00001510059_SJAMLM7059_D-C0P96ACXX.7.bam.sorted.bam.mapped.bam.dedupped.bam.recaled.bam $PFSDIR
cp /mnt/rds/txl80/LaframboiseLab/sxl919/tape/EGA_download/St-Judes/AMKL/AMKL-1-bam/_EGAR00001510060_SJAMLM7059_D-D12NWACXX.3.bam.sorted.bam.mapped.bam.dedupped.bam.recaled.bam $PFSDIR
cp /mnt/rds/txl80/LaframboiseLab/sxl919/tape/EGA_download/St-Judes/AMKL/AMKL-1-bam/_EGAR00001510061_SJAMLM7059_D-D12NWACXX.4.bam.sorted.bam.mapped.bam.dedupped.bam.recaled.bam $PFSDIR
cp /mnt/rds/txl80/LaframboiseLab/sxl919/tape/EGA_download/St-Judes/AMKL/AMKL-1-bam/_EGAR00001510062_SJAMLM7059_D-D1DKDACXX.3.bam.sorted.bam.mapped.bam.dedupped.bam.recaled.bam $PFSDIR
cp /mnt/rds/txl80/LaframboiseLab/sxl919/tape/EGA_download/St-Judes/AMKL/AMKL-1-bam/_EGAR00001510063_SJAMLM7059_D-D1DKDACXX.4.bam.sorted.bam.mapped.bam.dedupped.bam.recaled.bam $PFSDIR


cp /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.fa $PFSDIR
cp /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.fa.fai $PFSDIR
cp /mnt/rds/txl80/LaframboiseLab/vst14/GRCh37-lite.dict $PFSDIR

cd $PFSDIR

samtools merge 7059_D.bam _EGAR00001510059_SJAMLM7059_D-C0P96ACXX.7.bam.sorted.bam.mapped.bam.dedupped.bam.recaled.bam _EGAR00001510060_SJAMLM7059_D-D12NWACXX.3.bam.sorted.bam.mapped.bam.dedupped.bam.recaled.bam _EGAR00001510061_SJAMLM7059_D-D12NWACXX.4.bam.sorted.bam.mapped.bam.dedupped.bam.recaled.bam _EGAR00001510062_SJAMLM7059_D-D1DKDACXX.3.bam.sorted.bam.mapped.bam.dedupped.bam.recaled.bam _EGAR00001510063_SJAMLM7059_D-D1DKDACXX.4.bam.sorted.bam.mapped.bam.dedupped.bam.recaled.bam

samtools sort -o 7059_D_Sorted.bam 7059_D.bam

gatk --java-options "-Xmx50g" MarkDuplicates --INPUT 7059_D_Sorted.bam --METRICS_FILE 7059_D_metrics.txt --OUTPUT 7059_D_DMarked.bam

gatk --java-options "-Xmx50G" BaseRecalibrator -I 7059_D_DMarked.bam -R GRCh37-lite.fa --known-sites /mnt/rds/txl80/LaframboiseLab/sxl919/sxl919/tools/sxl919/b37/dbsnp_138.b37.vcf -O 7059_D_RecalData.table

cp 7059_D_RecalData.table /mnt/rds/txl80/LaframboiseLab/vst14/merged_bams/

gatk --java-options "-Xmx50G" ApplyBQSR -R GRCh37-lite.fa -I 7059_D_DMarked.bam --bqsr-recal-file 7059_D_RecalData.table -O 7059_D_BQSR.bam

cp 7059_D_BQSR.bam /mnt/rds/txl80/LaframboiseLab/vst14/merged_bams/

rm -rf "$PFSDIR"/*





