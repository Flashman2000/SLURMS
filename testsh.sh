#!/bin/bash

for d in /mnt/rds/txl80/LaframboiseLab/vst14/AR_BAM/*.g.vcf.gz
do
  cd /mnt/rds/txl80/LaframboiseLab/vst14/AR_BAM/
  File="$(basename -- $d)"
  FN=${File%.*}
  echo "--in-gvcf $File" >> /mnt/rds/txl80/LaframboiseLab/vst14/pbtest_DB.sh
  #if [ -f "$FN.g.vcf.gz" ]; then
   # echo "$FN processed/processing"
  #else
   # echo "$FN not processed"
  #fi
done