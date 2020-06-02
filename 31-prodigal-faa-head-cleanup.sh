#!/bin/bash

# prodigal output needs head cleanup for hmmsearch
# 05-22 version adds caret

cd ../04-prodigal-annot-closed-ends/


type="protein.translations.faa$"

for prots in *
do
  if [[ $prots =~ $type ]]; then
     name=${prots%_protein.translations.faa}
     output_file="$name"-faa-cleanup.faa

     awk 'NR==1 { printf $0 " "; next } { printf /^>/ ? "\n" $0 " ": $0 }' $prots |
     awk '{ gsub(/;/, " ") } { gsub("ID=", ""); print }' | 
     awk '{ print ">scaffold" $9 "gene" "\n" $15 }' > ../04-prodigal-faa-cleanup/"$output_file"
  fi
done
