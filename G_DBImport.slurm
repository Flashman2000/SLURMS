#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=185G
#SBATCH -c 30
#SBATCH -p batch -C icosa192gb
#SBATCH --time=11-00:00:00
cd /mnt/rds/txl80/LaframboiseLab/sxl919/tape/EGA_download/St-Judes/AMKL/AMKL-1-bam/
module load gatk

gatk --java-options "-Xmx175g" GenomicsDBImport --genmoicsdb-workspace-path /mnt/rds/txl80/LaframboiseLab/vst14/genomicsdb_G/ \
--tmp-dir /scratch/users/vst14/tmp/ \
--sample-name-map /mnt/rds/txl80/LaframboiseLab/vst14/SLURMS/G.sample_map \
-L /mnt/rds/txl80/LaframboiseLab/vst14/SLURMS/intervals.list