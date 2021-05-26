#!/bin/bash
for i in C0H5W3 P40376 P06244 A0A0A7DLH7 B6K6I0 S9RHB1 V5ZE33 A0A2N1JH51 Q6QE15 A0A367K0S3 A0A507QJY4 A3FM70 A0A5C6GBF6 Q8NIL1 A0A7D9CWG0 A0A4C2EBU2 A0A7C8P3G8 A0A6C1LR26; do   
wget https://www.uniprot.org/uniprot/$i.fasta;
done

for i in C0H5W3.fasta; do 

for a in *.fasta; do

needle -asequence $i -bsequence $a -gapopen 10 -gapextend 0.5 -outfile ${i}_vs_${a}.txt;
done;
done

for var in C0H5W3.fasta_vs_*.fasta; do
echo $var;

echo "%ID";
grep "# Identity" $var.txt;

echo "%Similarity";
grep "# Similarity" $var.txt;

echo "%Gaps";
grep "# Gaps" $var.txt;

done >TablaPKA1.txt
