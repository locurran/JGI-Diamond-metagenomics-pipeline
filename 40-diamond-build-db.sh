#!/bin/bash
# make diamond database from refseq

/ACTF/Course/mb599_bds_s20/data/share/Group6_Emily_Lorne_Kaimyn/bin/diamond makedb \
  --in ../info/viral-1-2.protein.faa \
   -d ../info/ref-seq.dmnd  \
  --taxonmap ../info/prot.accession2taxid  \
  --taxonnodes ../info/taxdmp/nodes.dmp  \
  --taxonnames ../info/taxdmp/names.dmp  \
   -p 12
