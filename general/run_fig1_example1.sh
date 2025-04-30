#!/bin/bash

# *Annotate multiple metadatas into tree, seperated by ,
echo "Annotate example tree with two metadata tables"
treeprofiler annotate \
--tree example1.nw \
--input-type newick \
--metadata example1_metadata1.tsv example1_metadata2.tsv \
-o ./

echo "Visualize properties categorical data random_type in rectangle_layout, numerical data sample1, sample2 in heatmap_layout and barplot_layout."
treeprofiler plot \
--tree example1_annotated.ete \
--input-type ete \
--rectangle-layout random_type \
--binary-layout bool_type \
--heatmap-layout sample1 sample2 sample3 \
--barplot-layout sample4 sample5 \
--profiling-layout random_type \
--column-width 40 \
--padding-x 3


