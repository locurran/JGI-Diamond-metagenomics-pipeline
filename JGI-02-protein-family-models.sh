#!/bin/bash

# calculate viral protein family models against protein translations using hmmsearch
# uses prodigal header cleanup intermediary files

cd ../04-prodigal-faa-cleanup/

type="faa-cleanup.faa$"

for prots in *
do
  if [[ $prots =~ $type ]]; then
      name=${prots%-faa-cleanup.faa}
      output_file="$name"-hits-to-vHMMs.hmmout

    ../bin/hmmer-3.3/bin/hmmsearch --cpu 10 \
                                    -E 1.0e-05 \
                                   --tblout ../06-JGI/02-viral-protein-family-hmmsearch/"$output_file" \
                                    ../info/final_list.hmms \
                                     $prots
 fi
done
