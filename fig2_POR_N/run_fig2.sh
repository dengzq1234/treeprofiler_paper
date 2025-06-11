treeprofiler annotate -t mafft_POR_N_trim.tree --emapper-annotation out.emapper.annotations --taxon-column name --taxadb ncbi --taxon-delimiter . --taxa-field 0 --alignment mafft_POR_N.fa.aln --emapper-pfam out.emapper.pfam --consensus-cutoff 0 -o ./

treeprofiler plot -t mafft_POR_N_trim_annotated.ete --taxonrectangle-layout --profiling-layout KEGG_ko --domain-layout
