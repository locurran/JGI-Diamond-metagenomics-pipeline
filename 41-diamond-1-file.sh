#!/bin/bash

# diamond blastp protein translations agains ref-seq
# hoping for taxonomic annotations
# one-library version

/ACTF/Course/mb599_bds_s20/home/curranl/group6/bin/diamond blastp \
  -d ../info/ref-seq.dmnd  \
  -q ../04-prodigal-annot-closed-ends/coral_Nextera_full_protein.translations.faa  \
  -o ../dmnd-trial.tsv  \
  -p 20  \
  -f 6 qtitle sscinames qlen sskingdoms qlen skingdoms qlen sphylums qlen salltitles qlen sseqid evalue qlen staxids bitscore qlen pident  \
  -k 1
