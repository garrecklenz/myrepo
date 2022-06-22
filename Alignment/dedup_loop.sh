for infile in ~/glenz/bowtie_align/*_aligned_sorted.bam;
do
base=$(basename $infile _aligned_sorted.bam)
umi_tools dedup --method unique -I ${base}_aligned_sorted.bam -S ${base}_dedup.bam
done
