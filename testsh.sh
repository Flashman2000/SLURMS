#!/bin/bash

for d in /mnt/rds/txl80/LaframboiseLab/vst14/merged_bams/*/
do
	FN="$(basename -- $d)"
	echo $FN
done