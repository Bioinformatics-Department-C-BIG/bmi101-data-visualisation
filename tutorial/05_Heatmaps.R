library(tidyverse)
library(pheatmap)

# 05_Heatmaps.R
# Example heatmap of normalised expression values

mat <- matrix(
  rnorm(100),
  nrow = 10,
  dimnames = list(paste0("gene_", 1:10), paste0("sample_", 1:10))
)

pheatmap(
  mat,
  scale = "row",
  clustering_distance_rows = "euclidean",
  clustering_distance_cols = "euclidean",
  main = "Heatmap of gene expression"
)
