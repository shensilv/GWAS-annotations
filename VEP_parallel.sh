#!/bin/bash

#$ -cwd
#$ -S /bin/bash
#$ -l h_vmem=10G
#$ -l h_rt=03:00:00
#$ -M s2225464@ed.ac.uk
#$ -m beas
#$ -t 1-22
      # ...tell SGE that this is an array job, with "tasks" numbered from 1
      #    to 10000...

source /etc/profile.d/modules.sh

module load igmm/apps/vep/102

vep -i ${SGE_TASK_ID}VEPinput.tsv -o VEPoutput.$SGE_TASK_ID --force --database --assembly GRCh37 --tab --fields "Uploaded_variation,Location,Allele,Feature_type,Consequence,CDS_position,Protein_position,Amino_acids,Codons,IMPACT,DISTANCE,FLAGS"
