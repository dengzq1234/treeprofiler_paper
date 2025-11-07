# Figure 3 Visualization of motus reference tree with habitat relative abundance matrix
In `fig3_motus_full_habitat/`， we prepared the data and execution command line to recreate the visualization session in Figure 3 of the mOTUs reference taxonomy tree with 124,295 leaves annotated with 51 habitat-specific abundance profiles.

## Interactive session
[Figure 3: mOTUs Abundance Profiles](https://treeprofiler_ex4.cgmlab.org/)

## Execution in local environment

```
cd fig3_motus_full_habitat/
color_config.csv             motus_abundance_by_environment_log10_full.tsv  motusid_full_annotated.nw.tar.gz
fig3_motus_full_habitat.png  motus_env_ids.tsv                              run_fig3.sh
```

In order to save time and computational resources, we have already prepared the annotated tree in `motusid_full_annotated.nw.tar.gz`. By default, the `run_fig3.sh` contains
```
tar -xvf motusid_full_annotated.nw.tar.gz

treeprofiler plot \
-t motusid_full_annotated.nw \
--internal name \
--prop2type motusid_full_prop2type.txt \
--taxonrectangle-layout \
--taxonclade-layout \
--heatmap-layout $(cat motus_env_ids.tsv) \
--color-config color_config.csv \
-s ,
```