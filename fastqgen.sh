#!/bin/bash

cd /mnt/rds/txl80/LaframboiseLab/sxl919/tape/EGA_download/St-Judes/AMKL/AMKL-1-bam/

mkdir /scratch/users/vst14/PB_Test/7069_D/
i=1
for d in *7069_D*.bam
do
	sbatch --export=file=$d,patient="7069_D",ID=$i /mnt/rds/txl80/LaframboiseLab/vst14/SLURMS/genericfastq.slurm
	((i++))
done

mkdir /scratch/users/vst14/PB_Test/7068_D/
i=1
for d in *7068_D*.bam
do
	sbatch --export=file=$d,patient="7068_D",ID=$i /mnt/rds/txl80/LaframboiseLab/vst14/SLURMS/genericfastq.slurm
	((i++))
done

mkdir /scratch/users/vst14/PB_Test/7066_D/
i=1
for d in *7066_D*.bam
do
	sbatch --export=file=$d,patient="7066_D",ID=$i /mnt/rds/txl80/LaframboiseLab/vst14/SLURMS/genericfastq.slurm
	((i++))
done

mkdir /scratch/users/vst14/PB_Test/7055_D/
i=1
for d in *7055_D*.bam
do
	sbatch --export=file=$d,patient="7055_D",ID=$i /mnt/rds/txl80/LaframboiseLab/vst14/SLURMS/genericfastq.slurm
	((i++))
done

mkdir /scratch/users/vst14/PB_Test/7054_D/
i=1
for d in *7054_D*.bam
do
	sbatch --export=file=$d,patient="7054_D",ID=$i /mnt/rds/txl80/LaframboiseLab/vst14/SLURMS/genericfastq.slurm
	((i++))
done

mkdir /scratch/users/vst14/PB_Test/7053_D/
i=1
for d in *7053_D*.bam
do
	sbatch --export=file=$d,patient="7053_D",ID=$i /mnt/rds/txl80/LaframboiseLab/vst14/SLURMS/genericfastq.slurm
	((i++))
done

mkdir /scratch/users/vst14/PB_Test/7052_D/
i=1
for d in *7052_D*.bam
do
	sbatch --export=file=$d,patient="7052_D",ID=$i /mnt/rds/txl80/LaframboiseLab/vst14/SLURMS/genericfastq.slurm
	((i++))
done

mkdir /scratch/users/vst14/PB_Test/7050_D/
i=1
for d in *7050_D*.bam
do
	sbatch --export=file=$d,patient="7050_D",ID=$i /mnt/rds/txl80/LaframboiseLab/vst14/SLURMS/genericfastq.slurm
	((i++))
done

mkdir /scratch/users/vst14/PB_Test/7049_D/
i=1
for d in *7049_D*.bam
do
	sbatch --export=file=$d,patient="7049_D",ID=$i /mnt/rds/txl80/LaframboiseLab/vst14/SLURMS/genericfastq.slurm
	((i++))
done

mkdir /scratch/users/vst14/PB_Test/7044_D/
i=1
for d in *7044_D*.bam
do
	sbatch --export=file=$d,patient="7044_D",ID=$i /mnt/rds/txl80/LaframboiseLab/vst14/SLURMS/genericfastq.slurm
	((i++))
done

mkdir /scratch/users/vst14/PB_Test/7043_D/
i=1
for d in *7043_D*.bam
do
	sbatch --export=file=$d,patient="7043_D",ID=$i /mnt/rds/txl80/LaframboiseLab/vst14/SLURMS/genericfastq.slurm
	((i++))
done