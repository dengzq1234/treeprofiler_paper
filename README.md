# Fast treeprofiler 2025 demonstration

# Installation of conda enviroment

```
# create environment
conda create -n treeprofiler python=3.10
conda activate treeprofiler

# Install ETE Toolkit v4 for treeprofiler
pip install "git+https://github.com/etetoolkit/ete.git@ete4_treeprofiler"

# Install custom pastml package for ete4
pip install "git+https://github.com/dengzq1234/pastml.git@pastml2ete4"

# install treeprofiler 
pip install treeprofiler
```

# Figure 1 General view of TreeProfiler visualization 
In `fig1_general/`， we prepared the data and execution command line to recreate the visualization session in Figure 1

```
cd fig1_general/

ls
example1_metadata1.tsv  example1.nw             fig1_general.png      run_fig1_example2.sh
example1_metadata2.tsv  example2_aln_domain.nw  run_fig1_example1.sh
```

Simply run the `.sh` script which contains the execution of treeprofiler to start the visualization session

```
bash run_fig1_example1.sh
bash run_fig1_example2.sh
```
![TreeProfiler general overview](https://github.com/dengzq1234/treeprofiler_paper/blob/main/fig1_general/fig1_general.png?raw=true)

# Figure 2 Visualization of POR_N domain family examples 
In `fig2_POR_N/`， we prepared the data and execution command line to recreate the visualization session in Figure 2

```
cd fig2_POR_N/
ls
fig2_POR_N.png             mafft_POR_N_trim.tree    out.emapper.pfam
mafft_POR_N.fa.aln.tar.gz  out.emapper.annotations  run_fig2.sh
```

To recreate the annotation and visualization, please run the folloing demo:
```
tar -xvf mafft_POR_N.fa.aln.tar.gz

treeprofiler annotate \
-t mafft_POR_N_trim.tree \
--emapper-annotation out.emapper.annotations \
--alignment mafft_POR_N.fa.aln \
--emapper-pfam out.emapper.pfam \
--consensus-cutoff 0 \
--taxon-column name \
--taxadb ncbi \
--taxon-delimiter . \
--taxa-field 0 \
-o .

treeprofiler plot \
-t mafft_POR_N_trim_annotated.ete \
--taxonrectangle-layout \
--profiling-layout KEGG_ko \
--domain-layout
```
You can choose to executate the visualization via command-line using the bash script `run_fig2.sh`
```
bash run_fig2.sh
```

![TreeProfiler emapper  overview](https://github.com/dengzq1234/treeprofiler_paper/blob/main/fig2_POR_N/fig2_POR_N.png?raw=true)

# Figure 3 Visualization of motus reference tree with habitat relative abundance matrix
In `fig3_motus_full_habitat/`， we prepared the data and execution command line to recreate the visualization session in Figure 3

```
cd fig3_motus_full_habitat/
color_config.csv             motus_abundance_by_environment_log10_full.tsv  motusid_full_annotated.nw.tar.gz
fig3_motus_full_habitat.png  motus_env_ids.tsv                              run_fig3.sh
```

In order to save time and computational resources, we have already repared the annotated tree in `motusid_full_annotated.nw.tar.gz`. By default, the `run_fig3.sh` contains
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


If you want to recreate the annotation too, uncomment the first lines of `treeprofiler annotate ...` in `run_fig3.sh`.
```
# annotate motus reference tree (Archaea+Bacteria) with motus taxonomic information + habitat relative abundan
ce matrix (log transformed)
treeprofiler annotate \
-t motusid_full.nw \
--metadata motus_abundance_by_environment_log10_full.tsv \
--taxadb motus \
--taxon-column name \
-o ./

```

![TreeProfiler motus overview](https://github.com/dengzq1234/treeprofiler_paper/blob/main/fig3_motus_full_habitat/fig3_motus_full_habitat.png?raw=true)







