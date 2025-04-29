
# annotate motus reference tree (Archaea+Bacteria) with motus taxonomic information + habitat relative abundance matrix (log transformed)
#treeprofiler annotate \
#-t motusid_full.nw \
#--metadata motus_abundance_by_environment_log10_full.tsv \
#--taxadb motus \
#--taxon-column name \
#-o ./

# visualize annotated motus reference tree with taxonomic band colored by ranks, clades colored by ranks, and heatmap of habitat relative abundance matrix
treeprofiler plot \
-t motusid_full_annotated.nw \
--internal name \
--prop2type motusid_full_prop2type.txt \
--taxonrectangle-layout \
--taxonclade-layout \
--heatmap-layout $(cat motus_env_ids.tsv) \
--color-config color_config.csv \
-s ,
