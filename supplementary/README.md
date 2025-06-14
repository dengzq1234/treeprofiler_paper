# Supplementary Figure Reproduction: Comparison of Tree Visualization Tools

This repository contains all scripts, data, and output figures used to reproduce the **supplementary figure** in our paper comparing different phylogenetic tree visualization tools.

Each figure was generated using the same tree (`tree_root.nw`) and metadata (`dataset_table.tsv`), allowing a direct comparison of how different tools handle circular trees and barplot-style annotations.

---

## Software Versions Used

| Tool           | Version        |Installation/Access        |
|----------------|----------------|----------------|
| TreeProfiler   | v2.0.4         |pypi
| GraPhlAn       | v1.1.4         |pypi
| ETE Toolkit    | v3.1.2         |pypi
| ggtree         | v3.14          |R
| QIIME 2 / Empress | 2022.2.0 / 1.2.0 |pypi
| iTOL           | v7             |https://itol.embl.de/
| tvBOT          | v2.6.1         |https://www.chiplot.online/tvbot.html

## How to Reproduce Each Figure
Each figure was generated using one of the tools below and saved to `all_figures/`. While the **supplementary figure in the paper** combines them into one composite image, this repository allows users to inspect each one individually.

### TreeProfiler

```bash
bash treeprofiler_demo.sh
```
Note: TreeProfiler generates an interactive session that opens in your local browser, rather than producing a static image by default. This allows for on-the-fly exploration of annotations and metadata directly on the tree.

### GraPhlAn

```bash
bash graphlan_demo.sh
```

### ggtree

```bash
Rscript ggtree_demo.R
```

### ETE3

```bash
python ete3_demo.py
```

### iTOL

Please upload `tree_root.nw` to https://itol.embl.de/ and create dataset with `dataset_table.tsv` and select "Simple bar chart" in the popup window.

### EMPRESS

```bash
empress tree-plot --tree tree_root.nw --feature-metadata dataset_table.tsv --output-dir empress_barplot/
```

Once it finished, open `empress_barplot/empress.html` select drawing barplot with `col1` column.

### tvBOT

Please clicked on https://www.chiplot.online/circleTree.html. upload the following files to restore the visualization.

1) upload `tree_root.nw` to "treefile" of "data" tab
2) upload `dataset_table.tsv` to "Layer data" navigator
3) upload `tvBOT_config.json` to "Restore drawing state" of "data" tab

