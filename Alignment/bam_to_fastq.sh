for infile in ~/glenz/salmon_count/*_dedup.bam;
do
base=$(basename $infile _dedup.bam)
samtools fastq -F 4 ${base}_dedup.bam > ${base}_dedup.fastq
done
