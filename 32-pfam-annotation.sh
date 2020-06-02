#!/bin/bash

# collect pfam annotations using hmmsearch
# prodigal output needs header cleanup first

cd ../04-prodigal-faa-cleanup/

type="faa-cleanup.faa$"

for prots in *
do
  if [[ $prots =~ $type ]]; then
      name=${prots%-faa-cleanup.faa}
      output_file="$name"-hits-to-pfam.hmmout

    ../bin/hmmer-3.3/bin/hmmsearch --cpu 10 \
                                    -E 1.0e-05 \
                                   --tblout ../05-hmmsearch-pfam/"$output_file" \
                                    ../info/Pfam-A.hmm \
                                     $prots
 fi
done
