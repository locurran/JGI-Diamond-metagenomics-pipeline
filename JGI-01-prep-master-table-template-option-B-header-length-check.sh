#!/bin/bash

cd ../03-spades-assembled/

for sample in *
do
  cat "$sample" | grep \> | awk '{if(length($1)>=60) print}' >> ../06-JGI/01-header-length-check.txt
done
