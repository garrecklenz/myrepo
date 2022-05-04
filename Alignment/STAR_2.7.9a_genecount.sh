
for fq1 in ~/RNAseq/seq_align/050322/9_S9_sam/*L006_R1_001.trim.fastq.gz
    do
    echo "working with file $fq1"

    base=$(basename $fq1 _L006_R1_001.trim.fastq.gz)
    echo "base name is $base"
	mkdir ${base}_sam ${base}_bam
    fq1=~/RNAseq/seq_align/050322/${base}_L006_R1_001.trim.fastq.gz
    sam=~/RNAseq/seq_align/050322/${base}_sam/Aligned.out.sam
    bam=~/RNAseq/seq_align/050322/${base}_bam/Aligned.out.bam
		
    STAR --runThreadN 8\
	--readFilesCommand gunzip -c \
	--genomeDir ~/RNAseq/seq_align/ander_genome \
	--readFilesIn ${base}_L006_R1_001.trim.fastq.gz \
	--outFileNamePrefix ${base}_sam/ \
	--quantMode GeneCounts
   
    done
