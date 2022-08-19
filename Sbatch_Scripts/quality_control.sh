#!/bin/sh
#SBATCH --job-name=quality_control
#SBATCH --account=DA494
#SBATCH --partition=compute
#
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=8000
#SBATCH --time=08:00:00



cd /storage/hikhan/raw_data

module purge
module load bioconda
module load jdk
conda activate pipeline_env
#fastqc *.gz
#mv *fastqc* /storage/hikhan/fastqc_output

INPUT=/storage/hikhan/raw_data
OUTPUT=/storage/hikhan/fastp_output
REPORT=/storage/hikhan/fastp_output

for r1 in ${INPUT}/*_1.fastq.gz
do
   name=$(basename ${r1} _1.fastq.gz)
   echo $name

fastp -i ${INPUT}/${name}_1.fastq.gz -I ${INPUT}/${name}_2.fastq.gz -o ${OUTPUT}/${name}_fastp_trimmed_1.fastq.gz -O ${OUTPUT}/${name}_fastp_trimmed_2.fastq.gz --adapter_sequence=auto --adapter_sequence_r2=auto --cut_right --cut_front -h ${REPORT}/${name}.html
done

cd /storage/hikhan/fastp_output

fastqc *trimmed*
mv *fastqc* /storage/hikhan/fastqc_output_2
