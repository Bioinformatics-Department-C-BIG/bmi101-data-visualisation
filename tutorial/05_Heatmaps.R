library(tidyverse)
library(pheatmap)
library(RColorBrewer)

# ============================================================
# 05_Heatmaps.R
# Example heatmap of normalised expression values
# ============================================================

# ------------------------------------------------------------
# Part 1: Quick synthetic matrix example
# ------------------------------------------------------------
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
  main = "Heatmap of synthetic expression"
)

# ------------------------------------------------------------
# Part 2: RNA-seq heatmap of top variable genes from data/
# ------------------------------------------------------------
norm_counts <- read_csv("data/rnaseq_normalized_counts.csv", show_col_types = FALSE)
meta <- read_csv("data/sample_metadata.csv", show_col_types = FALSE)

# Build expression matrix
expr_mat <- as.matrix(norm_counts[, meta$sample_id])
rownames(expr_mat) <- norm_counts$gene_symbol

# Identify the top 35 most variable genes
gene_vars <- apply(expr_mat, 1, var)
top_genes <- names(sort(gene_vars, decreasing = TRUE))[1:35]
mat_top <- expr_mat[top_genes, ]

# Create column annotation data frame
col_ann <- data.frame(
  Condition = meta$condition,
  Batch = meta$batch,
  row.names = meta$sample_id
)

# Render clustered heatmap with row z-score scaling
pheatmap(
  mat_top,
  scale = "row",
  annotation_col = col_ann,
  color = colorRampPalette(rev(brewer.pal(n = 7, name = "RdYlBu")))(100),
  clustering_distance_rows = "correlation",
  clustering_distance_cols = "euclidean",
  clustering_method = "complete",
  show_rownames = TRUE,
  fontsize_row = 8,
  fontsize_col = 10,
  main = "Top 35 Variable Genes Across Samples (Z-score)"
)
