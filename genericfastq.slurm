#!/bin/bash
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=60G
#SBATCH -c 16
#SBATCH --time=100:00:00

module load gatk 
cd /mnt/rds/txl80/LaframboiseLab/sxl919/tape/EGA_download/St-Judes/AMKL/AMKL-1-bam/

gatk --java-options "-Xmx60G" SamToFastq -I $file -F /scratch/users/vst14/PB_Test/$patient/$patient\_$ID\_R1.fastq.gz -F2 /scratch/users/vst14/PB_Test/$patient/$patient\_$ID\_R2.fastq.gz