#!/bin/bash

for i in GCF_000001215.4_Release_6_plus_ISO1_MT_protein GCF_000001405.39_GRCh38.p13_protein GCF_000001635.27_GRCm39_protein GCF_000001735.4_TAIR10.1_protein GCF_000002035.6_GRCz11_protein GCF_000002315.6_GRCg6a_protein GCF_000002985.6_WBcel235_protein GCF_000090745.1_AnoCar2.0_protein GCF_000146045.2_R64_protein GCF_000327385.1_Helro1_protein GCF_001663975.1_Xenopus_laevis_v2_protein GCF_003254395.2_Amel_HAv3.1_protein GCF_004143615.1_amil_sf_1.1_protein GCF_005508785.1_pea_aphid_22Mar2018_4r6ur_protein; do

diamond makedb --in $i.faa --db ${i}.dmnd;

diamond blastp --query C0H5W3.fasta --db $i.dmnd --more-sensitive --evalue 0.01 --outfmt 6 qseqid sseqid bitscore evalue qcovhsp pident >output_diamond6{$i}.bls;

echo $i;
echo "qseqid                 sseqid           bitscore evalue qcovhsp pident";
echo | head output_diamond6{$i}.bls;

done >tabla.txt
