#!/bin/bash

for d in /mnt/rds/txl80/LaframboiseLab/vst14/AR_BAM/*.g.vcf.gz
do
	File="$(basename -- $d)"
	FN=${File%.g.*}
  echo $FN$'\t'$FN.g.vcf.gz >> /mnt/rds/txl80/LaframboiseLab/vst14/AR_BAM/cohort.sample_map
done