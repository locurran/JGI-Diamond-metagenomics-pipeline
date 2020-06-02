#!/bin/bash
# using prodigal to annotate assembled scaffolds

cd ../03-spades-assembled/

sample=coral_all_scaffolds.fasta 
name=${sample%scaffolds.fasta}
gene_coords="$name"gene.coords.gbk
proteins="$name"protein.translations.faa

  /local/cluster/Prodigal-2.6.3/prodigal -i "$sample" \
                                         -p meta    \
                                         -o ../04-prodigal-annot-closed-ends/"$gene_coords" \
                                         -a ../04-prodigal-annot-closed-ends/"$proteins"    \
                                         -c

