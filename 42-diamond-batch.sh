#!/bin/bash

# diamond blastp protein translations agains ref-seq
# hoping for taxonomic annotations

cd ../04-prodigal-annot-closed-ends/
type=faa$

for lib in *
do
if [[ $lib =~ $type ]]; then
  name=${lib%_protein.translations.faa}
  virus="$name"-jgi-matches.m8

  /ACTF/Course/mb599_bds_s20/home/curranl/group6/bin/diamond blastp \
    -d ../info/ref-seq.dmnd  \
    -q $lib  \
    -o ../08-another-diamond-try/"$virus"  \
    -p 20  \
    -f 6 sscinames qlen sskingdoms qlen skingdoms qlen sphylums qlen salltitles qlen sseqid evalue qlen staxids bitscore qlen pident  \
    -k 1
fi
done
