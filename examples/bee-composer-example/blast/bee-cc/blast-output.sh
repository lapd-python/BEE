#!/bin/bash

# BEE Charliecloud example utilizing blast
# Argument #1   Blast output/share directory
#               Must remain constant across flow

BLAST_CH=/var/tmp/blast
BLAST_LOC=/blast

if [ -z "$1" ]; then
    BLAST_OUT=~/blast_output
else
    BLAST_OUT=$1
fi

# Temp solution until Dockerfile can be edited
cp -R /var/tmp/blast/home/beeuser/makeflow-examples/blast /var/tmp/blast/

ch-run -b $BLAST_OUT $BLAST_CH -- $BLAST_LOC/cat_blast \
    output.fasta input.fasta.0.out input.fasta.1.out

# Combine error files created earlier into a single output.fasta.err
# Currently, this functionality
cat $BLAST_OUT/input.fasta.0.err $BLAST_OUT/input.fasta.1.err > $BLAST_OUT/output.fasta.err