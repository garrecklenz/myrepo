
for fq1 in ~/glenz/bowtie_align/*_umi-seq-trim-align.sam;
    do
    echo "working with file $fq1"

    base=$(basename $fq1 _umi-seq-trim-align.sam)
    echo "base name is $base"
    samtools view -S -b $fq1 > ${base}_aligned.bam 
    samtools sort -o ${base}_aligned_sorted.bam ${base}_aligned.bam 
    samtools index ${base}_aligned_sorted.bam
   
    done
