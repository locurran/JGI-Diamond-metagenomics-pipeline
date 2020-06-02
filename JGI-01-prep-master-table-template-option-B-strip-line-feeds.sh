#!/bin/bash

# we've clipped JGI filtering script to just gsub and rename to fna
# header length checked separately; no size selection done
# only thing left is to strip line breaks

cd ../03-spades-assembled/

type="fasta$"

for sample in *
do
if [[ $sample =~ $type ]]; then
  name=${sample%_scaffolds.fasta}
  output_file="$name"-assembled-no-size-selection.fna

  awk '/^>/ { print (NR==1 ? "" : RS) $0; next } { printf "%s", $0 } END { printf RS }' "$sample" \
   > ../06-JGI/01-fasta-to-fna-no-size-selection/"$output_file"
fi
done
