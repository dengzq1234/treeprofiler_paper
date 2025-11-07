# TreeProfiler Figure Demonstration and Reproduction

This repository contains the scripts, data, and instructions required to reproduce all figures from the manuscript:

```
Ziqi Deng, Ana Hernández-Plaza, Adrián A. Davín, and Jaime Huerta-Cepas.
"Large-scale phylogenetic profiling of gene and species trees by TreeProfiler"  
bioRxiv (2023) doi: 10.1101/2023.09.21.558621
```

This is a companion repository to support figure reproduction. For the TreeProfiler software and documentation, visit the official repo:

🔗 https://github.com/compgenomicslab/TreeProfiler

And tutorial:

🔗 https://dengzq1234.github.io/TreeProfiler/

# Interactive Demos
This repository allows you to **reproduce** all TreeProfiler figures from the manuscript **via command-line execution** using the `treeprofiler` tool.

Alternatively, if you prefer **not to install or configure any environment**, you can directly **browse the interactive figures online** using the links below:

- [Figure 1A–E Layout Demos](https://treeprofiler_ex1.cgmlab.org/)
- [Figure 1F–H Trait Types & Features](https://treeprofiler_ex2.cgmlab.org/)
- [Figure 2: Global MCPsignal domain family](https://treeprofiler_ex3.cgmlab.org/)
- [Figure 3: mOTUs Abundance Profiles](https://treeprofiler_ex4.cgmlab.org/)

Both options provide full access to all visualizations and annotations described in the manuscript. Choose the one that best suits your needs.

# Using treeprofiler to reproduce visualization
## Installation of conda environment for treeprofiler

```
# create environment
conda create -n treeprofiler python=3.10
conda activate treeprofiler

# dependencies for ete4
conda install conda-forge::gcc

# Install ETE Toolkit v4 for treeprofiler
pip install "git+https://github.com/etetoolkit/ete.git@ete4_treeprofiler"

# Install custom pastml package for ete4
pip install "git+https://github.com/dengzq1234/pastml.git@pastml2ete4"

# install treeprofiler 
pip install treeprofiler
```

## Figure 1 General view of TreeProfiler visualization 
In `fig1_general/`, we provide data and scripts to recreate the visualization session shown in Figure 1.

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

## Figure 2 Visualization of MCPsignal domain family examples 
In `fig2_globalcr_macpsignal/`， we prepared the data and execution command line to recreate the visualization session in Figure 2 of MCPsignal family phylogenetic tree > 400,000 sequences with taxonomic annotation, KEGG KO profiling and Pfam domain architectures.

```
cd fig2_globalcr_macpsignal/
ls
color.v2.config         mcpsignal_globalcr_lca.nw         run_fig2.sh
globalCR_38H48H40H.png  mcpsignal_globalcr_lca.nw.tar.gz
```

To recreate the annotation and visualization, please run the following demo:

```
tar -xvf mcpsignal_globalcr_lca.nw.tar.gz

treeprofiler plot -t mcpsignal_globalcr_lca.nw \
--rectangle-layout heptad_1 d chea-ACF chea-Tfp  chea-F1 chea-F2 chea-F3 chea-F4 chea-F5 chea-F6 chea-F7 chea-F8 chea-F9 chea-F10 chea-F11 chea-F12 chea-F13 chea-F14 chea-F15 chea-F16 chea-F17 chea-Uncat \
--taxonclade-layout \
--color-config color.v2.config  \
--background-layout collapse_name \
--textbranch-layout lca
```

Alternatively, you can run the visualization directly via the included bash script:
```
bash run_fig2.sh
```

**Note**: To run the full annotation workflow (including treeprofiler annotate), ensure at least 4 CPUs and 15 GB RAM are available.

![TreeProfiler emapper  overview](https://github.com/dengzq1234/treeprofiler_paper/blob/main/fig2_globalcr_macpsignal/globalCR_38H48H40H.png?raw=true)

## Figure 3 Visualization of motus reference tree with habitat relative abundance matrix
In `fig3_motus_full_habitat/`， we prepared the data and execution command line to recreate the visualization session in Figure 3 of the mOTUs reference taxonomy tree with 124,295 leaves annotated with 51 habitat-specific abundance profiles.

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


If you want to recreate the annotation too, uncomment the first lines of `treeprofiler annotate ...` in `run_fig3.sh`.
```
# annotate motus reference tree (Archaea+Bacteria) with motus taxonomic information + habitat relative abundance matrix (log transformed)

treeprofiler annotate \
-t motusid_full.nw \
--metadata motus_abundance_by_environment_log10_full.tsv \
--taxadb motus \
--taxon-column name \
-o ./

```
**Note**: Running the full annotation workflow for the large mOTUs tree requires at least 4 CPUs and 30 GB RAM due to the size and complexity of the dataset.

Once the visualization activated, click the `TaxaRect_superkingdom`, `TaxaLCA_phylum` and `Taxa_Evolutionary_events` layouts in control panel to have the same visualization as Figure 3. 

![TreeProfiler motus overview](https://github.com/dengzq1234/treeprofiler_paper/blob/main/fig3_motus_full_habitat/fig3_motus_full_habitat.png?raw=true)



## Supplementary Benchmarking

For reproducing the supplementary figure comparing tree visualization tools (ggtree, iTOL, tvBOT, etc.), see  
➡️ [`supplementary/README.md`](./supplementary/README.md)



