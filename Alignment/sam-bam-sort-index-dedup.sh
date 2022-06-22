
for fq1 in ~/glenz/bowtie_align/*_umi-seq-trim-align.sam
    do
    echo "working with file $fq1"

    base=$(basename $fq1 _umi-seq-trim-align.sam)
    echo "base name is $base"
	mkdir ${base}_files 
    fq1=~/glenz/bowtie_align/${base}_umi-seq-trim-align.sam
    bam=~/glenz/bowtie_align/${base}_files/Aligned.out.bam
    sorted_bam=~/glenz/bowtie_align/${base}_files/${base}.aligned.sorted.bam
		dedup_bam=~/glenz/bowtie_align/${base}_files/${base}_files/${base}.dedup.bam
		salmon_quant=${base}_quant
    samtools view -S -b $sam > $bam
    samtools sort -o $sorted_bam $bam 
    samtools index $sorted_bam
    umi_tools dedup -I $sorted_bam --output-stats=deduplicated -S dedup_bam
    mv $fq1 ~/glenz/bowtie_align/${base}_files
    salmon quant -t hsa_mature.fa -l A -a $dedup_bam -o $salmon_quant
    mv $salmon_quant ~/glenz/bowtie_align/${base}_files
   
    done
