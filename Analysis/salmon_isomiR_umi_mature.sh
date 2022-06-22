for fn in ~/glenz/051022_trimmed/test/*_umi-seq-trim.fastq.gz;
do
samp=$(basename $fn _umi-seq-trim.fastq.gz)
echo "Processing sample $samp"
salmon quant -i mature_hsa_index -l A \
	-r ${samp}_umi-seq-trim.fastq.gz \
	-o quants/${samp}_quant \
	--numBootstraps 4
done


salmon index \
-t mature_hsa.fa \
-i mature_index \
-k 15