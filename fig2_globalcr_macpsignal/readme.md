# Figure 2 Visualization of MCPsignal domain family examples 
In `fig2_globalcr_macpsignal/`， we prepared the data and execution command line to recreate the visualization session in Figure 2 of MCPsignal family phylogenetic tree > 400,000 sequences with taxonomic annotation, KEGG KO profiling and Pfam domain architectures.


## Interactive session
[Figure 2: Global MCPsignal domain family](https://treeprofiler_ex3.cgmlab.org/)

## Execution in local environment
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