#!/bin/bash

# hints of low-abundance viruses

blastn -task megablast \
       -query ../cleaned/sample_run_.fna \
       -db ../info/mVCs_PaezEspino_Nature.fna \
       -outfmt '6 std qlen slen' \
       -out ../output/sample_run-u-vs-mVCs.blout

# parse
java JGI-12-12-java/Coverage_VIRUSES_10Percent ../output/sample_run-u-vs-mVCs.blout > sample_run-u-vs-mVCs-blout-10-percent.txt

grosbeak0feces
