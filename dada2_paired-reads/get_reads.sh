# Park_2021_PRJEB45207
# https://www.ebi.ac.uk/ena/browser/view/PRJEB45207?show=reads

# Download read data from SRA (EBI)
# download file list from EBI to SRA_metadata.txt

## get MiSeq V3 run files
mkdir -p paired_reads

for link in $(grep "M[iI]S_.3" SRA_metadata.txt | cut -f 8); do 
echo $link
  for f in $(echo $link | tr ";" "\n"); do 
    wget -P paired_reads ${f}
  done
done

# collect stats
for r1 in paired_reads/*.fastq.gz; do 
  echo $r1; (echo -en "${r1}\t"; fastxstats ${r1}) >> MiSeq_read_stats.txt
done
