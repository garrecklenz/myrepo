
for fq1 in ~/RNAseq/seq_align/042722-training-set/trimmed/*L006_R1_001.trim.fastq.gz
    do
    echo "working with file $fq1"

    base=$(basename $fq1 _L006_R1_001.trim.fastq.gz)
    echo "base name is $base"
	mkdir ${base}_sam ${base}_bam
    fq1=~/RNAseq/seq_align/042722-training-set/${base}_L006_R1_001.trim.fastq.gz
    sam=~/RNAseq/seq_align/042722-training-set/${base}_sam/Aligned.out.sam
    bam=~/RNAseq/seq_align/042722-training-set/${base}_bam/Aligned.out.bam
    sorted_bam=~/RNAseq/seq_align/042722-training-set/bam/${base}.aligned.sorted.bam
		
    STAR --runThreadN 4\
	--readFilesCommand gunzip -c \
	--genomeDir ~/RNAseq/seq_align/dobin_genome \
	--readFilesIn ${base}_L006_R1_001.trim.fastq.gz \
	--outFileNamePrefix ${base}_sam/
    samtools view -S -b $sam > $bam
    samtools sort -o $sorted_bam $bam 
    samtools index $sorted_bam
   
    done
