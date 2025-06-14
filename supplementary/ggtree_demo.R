# if (!require("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")

# BiocManager::install("ggtreeExtra")
# BiocManager::install("ggtree")
# install.packages("ggstar")


library(ggtreeExtra)
library(ggstar)
library(ggplot2)
library(ggtree)
library(treeio)
library(ggnewscale)

library(ape)

# start
tree <- read.tree("tree_root.nw")
df <- read.csv("dataset_table.csv", stringsAsFactors = FALSE)
names(df)[names(df) == "feature_id"] <- "leaf"
head(df)

p <- ggtree(tree, layout = "circular") +
  geom_fruit(
    data = df,
    geom = geom_bar,
    mapping = aes(x = col1, y = leaf),
    stat = "identity",
    orientation = "y",
    width = 0.6,
    fill = "blue",     # Bar fill color
    #color = "black"    # Bar border color (optional)
  )

ggsave("ggtree_barplot.pdf", plot = p, width = 8, height = 8)
