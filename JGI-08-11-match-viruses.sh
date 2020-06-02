#!/bin/bash

# associate contigs with known viruses
## blast

blastn -query viral-contigs-sample_run.fna \
       -db ../info/mVCsPaezEspino_Nature.fna \
       -outfmt '6 std qlen slne' \
       -out ../output/sample_run-vs-mVCs.blout \
       -eval 1.0e-50 \
       -perc_identity 80
       -num_threads 12

## remove self-hits
no_hits=$( )cat ../output/sample_run-sv-mVCs.blout | awk '$1 != $2' )
echo no_self_hits > ../output/sample_run-vs-mVCs-no-self-hits.blout

## parse
parse=$( JGI-parse_blast/java Parse_BLAST ../output/sample_run-vs-mVCs-no-self-hits.blout ) 
echo $parse > ../output/sample_run-vs-mVCs-no-self-hits-parsed.blout

## linkage clustering
perl JGI-08-11-SLC.pl $parse viral_groups.slc
