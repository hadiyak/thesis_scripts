#!/bin/sh
#SBATCH --job-name=wget_samples
#SBATCH --account=DA494
#SBATCH --partition=compute
#
#SBATCH --cpus-per-task=4
#SBATCH --time=03:00:00


cd /storage/hikhan/raw_data

wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR140/001/ERR1407491/ERR1407491_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR140/001/ERR1407491/ERR1407491_2.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR140/001/ERR1407510/ERR1407510_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR140/001/ERR1407510/ERR1407510_2.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR140/001/ERR1407491/ERR1407491_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR140/001/ERR1407491/ERR1407491_2.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR140/001/ERR1422706/ERR1422706_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR140/001/ERR1422706/ERR1422706_2.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR140/001/ERR1422705/ERR1422705_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR140/001/ERR1422705/ERR1422705_2.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR140/001/ERR1422704/ERR1422704_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR140/001/ERR1422704/ERR1422704_2.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR140/001/ERR1422713/ERR1422713_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR140/001/ERR1422713/ERR1422713_2.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR140/001/ERR1422700/ERR1422700_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR140/001/ERR1422700/ERR1422700_2.fastq.gz
