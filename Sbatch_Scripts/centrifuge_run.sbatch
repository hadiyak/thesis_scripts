#!/bin/sh
#SBATCH --job-name=centrifuge
#SBATCH --account=DA494
#SBATCH --partition=compute
#
#SBATCH --cpus-per-task=20
#SBATCH --time=96:00:00 

module purge 
module load centrifuge

INPUT=/storage/hikhan/fastp_output
OUTPUT=/storage/hikhan/centrifuge_out

cd ${INPUT}

for r1 in *_fastp_trimmed_1.fastq.gz 
   do
   name=$(basename ${r1} _1.fastq.gz)
   echo $name   

   centrifuge -p $SLURM_CPUS_PER_TASK -x /storage02/data/centrifuge-dbs/park-et-al-2020/hpvc -1 ${name}_1.fastq.gz -2 ${name}_2.fastq.gz -S ${OUTPUT}/${name}_centrifugeOutputs.txt --report-file ${OUTPUT}/${name}_centrifugeReport.txt
   humanReads=$(grep -i 'homo sapiens'$'\t''9606'$'\t' ${OUTPUT}/${name}_centrifugeReport.txt|sed 's/.*\t//g'); echo $humanReads > ${OUTPUT}/${name}_humanReadsProp.txt

done

for i in *_fastp_trimmed_1.fastq.gz
   do
   name=$(basename ${i} _1.fastq.gz)
   echo $name 
   humanReads=$(grep -i 'homo sapiens'$'\t''9606'$'\t' ${OUTPUT}/${name}_centrifugeReport.txt|sed 's/.*\t//g'); echo $humanReads > ${OUTPUT}/${name}_humanReadsProp.txt


