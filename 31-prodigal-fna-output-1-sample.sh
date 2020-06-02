#!/bin/bash
# using prodigal to annotate assembled scaffolds
# hadn't output nucleotide sequences, just doing that this time
# buggered up first output, redo here

cd ../03-spades-assembled/

sample=coral_Nextera_full_scaffolds.fasta 
name=${sample%_scaffolds.fasta}
gene_seqs="$name"-gene.fna

  /local/cluster/Prodigal-2.6.3/prodigal -i "$sample" \
                                         -p meta    \
                                         -o ../04-prodigal-annot-fna/"$gene_seqs" \
                                         -c
