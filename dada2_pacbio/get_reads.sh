# Park_2021_PRJEB45207
# https://www.ebi.ac.uk/ena/browser/view/PRJEB45207?show=reads

# Download read data from SRA (EBI)
# download file list from EBI to SRA_metadata.txt

## get Sequel II runs
mkdir -p pacbio_reads

for link in $(grep "Pac" SRA_metadata.txt | cut -f 8); do 
echo $link
wget -P pacbio_reads ${link}
done

# collect stats
for r1 in pacbio_reads/*.fastq.gz; do 
  echo $r1; (echo -en "${r1}\t"; fastxstats ${r1}) >> Sequel_read_stats.txt
done
