#!/bin/bash

for d in /mnt/rds/txl80/LaframboiseLab/vst14/merged_bams/*/
do
  cd $d
	mv * /mnt/rds/txl80/LaframboiseLab/vst14/AL_BAM/
done