for fn in ~/salmon/*L006_R1_001.fastq.gz;
do
samp=$(basename $fn _L006_R1_001.fastq.gz)
echo "Processing sample $samp"
salmon quant -i human_index -l A \
	-r ${samp}_L006_R1_001.fastq.gz \
	--validateMappings -o quants/${samp}_quant
done
