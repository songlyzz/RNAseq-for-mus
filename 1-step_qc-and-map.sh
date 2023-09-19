#!/bin/bash
#PBS -N 1-RNAseq
#PBS -l nodes=1:ppn=10
#PBS -l walltime=1000:00:00
#PBS -j oe
#PBS -q silver
data_dic="/histor/sun/tenghj/huangjs/mus_PM2.5_huangbinhui/raw_data"
work_dic="/histor/sun/tenghj/huangjs/mus_PM2.5_huangbinhui/map_data"
ref_dic="/histor/sun/tenghj/huangjs/reference"
THREADS=8

source activate /histor/sun/tenghj/anaconda3/envs/RNAseq
cd ${work_dic}
#for SAMPLE in `cat ${data_dic}/file.txt`
#do
#TIME
date
date
date

#quality control
#fastp -w ${THREADS} \
#-i ${data_dic}/${SAMPLE}_Mus_musculus_RNA-Seq.fastq.gz \
#-o ${work_dic}/qc_data/QC_${SAMPLE}_Mus_musculus_RNA-Seq.fastq.gz \
#--html ${work_dic}/qc_data/reports/${SAMPLE}.html --json ${work_dic}/qc_data/reports/${SAMPLE}.json
#echo "==========Quality controling============"

#mapping
#STAR \
#--runThreadN ${THREADS} \
#--runMode alignReads \
#--readFilesCommand zcat \
#--outSAMtype BAM SortedByCoordinate \
#--outSAMunmapped Within \
#--outSAMattributes Standard \
#--genomeDir ${ref_dic}/STAR_mus_index/ \
#--readFilesIn ${work_dic}/qc_data/QC_${SAMPLE}_Mus_musculus_RNA-Seq.fastq.gz \
#--outFileNamePrefix ${work_dic}/${SAMPLE} 
#echo "=========Mapping ======================"

#index
#samtools index ${SAMPLE}*sortedByCoord.out.bam
#done

#quantative featurecounts
featureCounts \
${work_dic}/*sortedByCoord.out.bam \
-T ${THREADS} -t exon -g gene_id \
-a ${ref_dic}/ensembl.Mus.GRCm39.gtf \
-o ${work_dic}/featurecounts.txt
echo "=========counting ====================="
