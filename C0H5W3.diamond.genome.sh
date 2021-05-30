#!/bin/bash

for i in GCA_001636745.1_NOR_1.0_protein GCA_002818225.1_ASM281822v1_protein GCA_012184315.1_ASM1218431v1_protein GCF_000002945.1_ASM294v2_protein GCF_000091045.1_ASM9104v1_protein GCF_000143535.2_ASM14353v4_protein GCF_000146045.2_R64_protein GCF_000146945.2_ASM14694v2_protein GCF_000149335.2_ASM14933v2_protein GCF_000149555.1_ASM14955v1_protein GCF_000149845.2_SJ5_protein GCF_000150505.1_SO6_protein GCF_011074885.1_ASM1107488v2_protein GCF_900079805.1_Fusarium_fujikuroi_IMI58289_V2_protein; do

diamond makedb --in $i.faa --db ${i}.dmnd;

diamond blastp --query C0H5W3.fasta --db $i.dmnd --more-sensitive --evalue 0.01 --outfmt 6 qseqid sseqid bitscore evalue qcovhsp pident >output_diamond{$i}.bls;

echo $i;
echo "qseqid                 sseqid           bitscore evalue qcovhsp pident";
echo | head output_diamond{$i}.bls;

done >tabla.genomas.hongos.txt
