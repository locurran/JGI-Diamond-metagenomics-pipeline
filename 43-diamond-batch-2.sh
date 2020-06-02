#!/bin/bash

# diamond blastp protein translations agains ref-seq
# hoping for taxonomic annotations

cd ../07-VIBRANT-results/phage_faa_files_VIBRANT/
type=faa$

for lib in *
do
if [[ $lib =~ $type ]]; then
  name=${lib%_scaffolds.phages_combined.faa}
  virus="$name"-vibrant-matches.m8

  /ACTF/Course/mb599_bds_s20/home/curranl/group6/bin/diamond blastp \
    -d ../../info/ref-seq.dmnd  \
    -q $lib  \
    -o ../../08-another-diamond-try/"$virus"  \
    -p 20  \
    -f 6 sscinames qlen sskingdoms qlen skingdoms qlen sphylums qlen salltitles qlen sseqid evalue qlen staxids bitscore qlen pident  \
    -k 1 \
    -t /dev/shm
fi
done
