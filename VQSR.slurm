#!/bin/bash
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=vst14@case.edu
#SBATCH --mem=185G
#SBATCH -c 20
#SBATCH -C icosa192gb
#SBATCH --time=10-00:00:00

module load gatk

cd /mnt/rds/txl80/LaframboiseLab/vst14/Consolidated_D_VCF/

gatk --java-options "-Xmx180G" VariantRecalibrator -R /mnt/rds/txl80/LaframboiseLab/vst14/ref/GRCh37-lite.fa -V AMKL_D.vcf -O AMKL_D_Recal.recal --tranches-file AMKL_D_Tranches.tranches \
--resource:hapmap,known=false,training=true,truth=true,prior=15.0 hapmap_3.3.b37.vcf \
--resource:omni,known=false,training=true,truth=false,prior=12.0 1000G_omni2.5.b37.vcf \
--resource:1000G,known=false,training=true,truth=false,prior=10.0 1000G_phase1.snps.high_confidence.b37.vcf \
--resource:dbsnp,known=true,training=false,truth=false,prior=2.0 dbsnp_138.b37.vcf \
-an QD -an MQ -an MQRankSum -an ReadPosRankSum -an FS -an SOR