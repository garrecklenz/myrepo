for infile in ~/glenz/salmon_count/*_dedup.fastq;
do
base=$(basename $infile _dedup.fastq)
seqcluster collapse -f ${base}_dedup.fastq -o ~/glenz/miraligner/${base}_collapse
done
