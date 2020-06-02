#!/bin/bash
# using prodigal to annotate assembled scaffolds

cd ../03-spades-assembled/

type=fasta$

for sample in *
do
if [[ $sample =~ $type ]]; then
  name=${sample%scaffolds.fasta}
  gene_coords="$name"gene.coords.gbk
  proteins="$name"protein.translations.faa

  /local/cluster/Prodigal-2.6.3/prodigal -i "$sample" \
                                         -p meta    \
                                         -o ../04-prodigal-annot-05-18-2/"$gene_coords" \
                                         -a ../04-prodigal-annot-05-18-2/"$proteins"    \
                                         -c
fi
done

