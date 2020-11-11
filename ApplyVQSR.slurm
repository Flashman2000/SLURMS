#!/bin/bash
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=60G
#SBATCH -c 16
#SBATCH --time=100:00:00

module load gatk

gatk --java-options "-Xmx60G" ApplyVQSR -R /mnt/rds/txl80/LaframboiseLab/vst14/ref/GRCh37-lite.fa \
-V /mnt/rds/txl80/LaframboiseLab/vst14/Consolidated_D_VCF/AMKL_D.vcf \
-O /mnt/rds/txl80/LaframboiseLab/vst14/Consolidated_D_VCF/AMKL_D_VQSR.vcf \
--tranches-file /mnt/rds/txl80/LaframboiseLab/vst14/Consolidated_D_VCF/AMKL_D_Tranches.tranches \
--recal-file /mnt/rds/txl80/LaframboiseLab/vst14/Consolidated_D_VCF/AMKL_D_Recal.recal