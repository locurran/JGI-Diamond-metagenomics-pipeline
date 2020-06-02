#!/bin/bash

# detect viral contigs!
table=master-table-sample_run.txt

# A: first awk in each filter selects for 5+ scaffolds with hits to vir protein families
# A, then <= 20% of genes with KOs, <= 40% Pfam genes, > 10% vir protein family genes
filter_1=$( cat table | awk '$2 >= 5' | awk '$8 <= 20' | awk '$6 <= 40' | awk '$4 >= 10' | cut -f 1 )

echo $( cat filter_1 | wc -l ) viral contigs with a minority of Pfam genes and 10% or more of virus protein family genes

# A, then vir protein family hits >= hits to Pfams
filter_2=$( cat table | awk '$2 >= 5' | awk '2 >= 5' | cut -f 1 )

echo filter 2 found $( cat filter_2 | wc -l ) viral contigs

# A, then 60+ genes with hits to viral protein families
filter_3=$( cat table | awk '$2 >= 5' | awk '$4 >= 60' | cut -f 1)

echo $( cat filter_3 | wc -l ) viral contigs with 60+ hits to viral protein families

# venn diagram the three filter outputs for a list of nonredundant viral contigs
unique=$( )cat filter_1 filter_2, filter_3 | sort | uniq )
cat unique  > ../output/viral-contigs-sample_run.txt
echo $( cat unique | wc -l) unique viral contigs
