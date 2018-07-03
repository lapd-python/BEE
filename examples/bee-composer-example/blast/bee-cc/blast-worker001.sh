#!/bin/bash

# BEE Charliecloud example utilizing blast
# Argument #1   Blast output/share directory
#               Must remain constant across flow

BLAST_CH=/var/tmp/blast

if [ -z "$1" ]; then
    BLAST_OUT=~/blast_output
else
    BLAST_OUT=$1
fi

# Temp solution until Dockerfile can be edited
cp -R /var/tmp/blast/home/beeuser/makeflow-examples/blast /var/tmp/blast/

ch-run -b $BLAST_OUT $BLAST_CH -- /blast/blastall -p blastn \
    -d nt/nt -i /mnt/0/small.fasta.0 -o /mnt/0/input.fasta.0.out \
    -l /mnt/0/input.fasta.0.err
