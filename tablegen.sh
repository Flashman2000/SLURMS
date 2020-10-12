#!/bin/bash

for d in /mnt/rds/txl80/LaframboiseLab/vst14/AR_BAM/*.g.vcf.gz
do
	File="$(basename -- $d)"
  	FN=${File%.*}
  	echo $FN$'\t'$FN.g.vcf.gz
done