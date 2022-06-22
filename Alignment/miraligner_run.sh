for infile in ~/glenz/salmon_count/*_dedup.fastq;
do
base=$(basename $infile _dedup.fastq)
java -jar miraligner.jar -sub 1 -trim 3 -add 3 -s Hsa -i ~/glenz/miraligner/${base}_collapse/${base}_dedup_trimmed.fastq -db DB -o ~/glenz/miraligner/${base}_collapse
done
