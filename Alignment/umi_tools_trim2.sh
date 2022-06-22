for infile in ~/glenz/051022_trimmed/*fastq.gz
do
base=$(basename ${infile}  _trim_R1.fastq.gz)
umi_tools extract --extract-method=regex --bc-pattern=".+(?P<discard_1>AACTGTAGGCACCATCAAT){s<=2}(?P<umi_1>.{12})$" -I ${base}_trim_R1.fastq.gz -S ${base}_umi-seq-trim.fastq.gz
done
