#!/bin/bash
# using prodigal to annotate assembled scaffolds
# hadn't output nucleotide sequences, just doing that this time

cd ../03-spades-assembled/

type=fasta$

for sample in *
do
if [[ $sample =~ $type ]]; then
  name=${sample%_scaffolds.fasta}
  gene_seqs="$name"-gene.fna

  /local/cluster/Prodigal-2.6.3/prodigal -i "$sample" \
                                         -p meta    \
                                         -d ../04-prodigal-annot-fna/"$gene_seqs" \
                                         -c
fi
done

