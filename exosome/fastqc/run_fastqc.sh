
#!/bin/bash

fastqc_cmd=~/tools/FastQC/fastqc
merged_fastq_dir=~/projects/metabolomics/exosome/fastq/totalRNA
fastqc_output_dir=~/projects/metabolomics/exosome/fastqc/output


for i in $(ls -1 ${merged_fastq_dir}/*.fastq.gz)
do
echo $i
if [[ $i =~ ([^\/]+)\.fastq\.gz ]]; then
	file_prefix=${BASH_REMATCH[1]};
	echo ${file_prefix};
	${fastqc_cmd} --outdir=${fastqc_output_dir} ${merged_fastq_dir}/${file_prefix}.fastq.gz & > ${fastqc_output_dir}/${file_prefix}.fastqc.log ;
fi
done


