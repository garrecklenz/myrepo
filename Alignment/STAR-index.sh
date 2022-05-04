STAR \
--runThreadN 4 \
--readFilesCommand gunzip -c \
--genomeDir ~/RNAseq/seq_align/dobin_genome \
--readFilesIn 1_S1_L006_R1_001.trim.fastq.gz \
--outFileNamePrefix test/
