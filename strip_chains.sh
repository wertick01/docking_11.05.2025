#!/bin/bash
input_dir="$1"
output_dir="$2"

mkdir -p "$output_dir"

for file in "$input_dir"/*.pdb; do
    fname=$(basename "$file")
    pdb_delchain -B,C "$file" > "$output_dir/$fname"
done
