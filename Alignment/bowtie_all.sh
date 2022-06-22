for infile in ~/glenz/bowtie_align/*_umi-seq-trim.fastq.gz;
do
base=$(basename $infile _umi-seq-trim.fastq.gz)
echo "Processing $base $base $base $base"
bowtie --threads 7 -v 3 -S ncRNA_index ${base}_umi-seq-trim.fastq.gz > ${base}_umi-seq-trim-align.sam
done
