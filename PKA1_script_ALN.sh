#!/bin/bash
for i in A0A0A7DLH7 A0A2N1JH51 A0A4C2EBU2 A0A5C6GBF6 A0A6C1LR26 A0A7C8P3G8 A0A7D9CWG0 A0A367K0S3 A0A507QJY4 A3FM70 B6K6I0 C0H5W3 P06244 P40376 Q6QE15 Q8NIL1 S9RHB1 V5ZE33; do   
wget https://www.uniprot.org/uniprot/$i.fasta;
done

cat *.fasta >pka1query.fasta

mafft --maxiterate 1000 --localpair pka1query.fasta > pka1_ALN.fasta


