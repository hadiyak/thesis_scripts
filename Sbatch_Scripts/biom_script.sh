#!/bin/sh
#SBATCH --job-name=biom
#SBATCH --account=DA494
#SBATCH --partition=compute
#
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=8000
#SBATCH --time=08:00:00


cd /storage/hikhan/kreport-out

module purge
module load bioconda
conda activate centrifuge_env

#INPUT=/storage/hikhan/kreport_out

#for r1 in ${INPUT}/*_kreport.txt
#do
#   name=$(basename ${r1} _kreport.txt)
#  echo $name

#kraken-biom  ${INPUT}/${name}_kreport.txt --fmt json --gzip

#kraken-biom ERR1329853.txt ERR1329870.txt ERR1407498.txt ERR1407512.txt ERR1422704.txt ERR1422706.txt ERR1329857.txt ERR1407491.txt ERR1407510.txt ERR1422700.txt ERR1422705.txt ERR1422713.txt --fmt json

#kraken-biom ERR1329857.txt ERR1407512.txt ERR1407510.txt ERR1407489.txt ERR1407498.txt ERR1407491.txt ERR1407492.txt ERR1422706.txt ERR1422705.txt ERR1422704.txt ERR1422713.txt ERR1422700.txt --fmt json
#roman

#kraken-biom ERR1422720.txt ERR1422697.txt ERR1422698.txt ERR1422699.txt ERR1407488.txt ERR1407504.txt ERR1422715.txt ERR1407511.txt ERR1422702.txt ERR1422716.txt ERR1422718.txt --fmt json
#medieval

kraken-biom ERR1329857.txt  ERR1407491.txt  ERR1407504.txt  ERR1407512.txt  ERR1422699.txt  ERR1422704.txt  ERR1422713.txt  ERR1422718.txt ERR1407488.txt  ERR1407492.txt  ERR1407510.txt  ERR1422697.txt  ERR1422700.txt  ERR1422705.txt  ERR1422715.txt  ERR1422720.txt ERR1407489.txt  ERR1407498.txt  ERR1407511.txt  ERR1422698.txt  ERR1422702.txt  ERR1422706.txt  ERR1422716.txt --fmt json
#all
