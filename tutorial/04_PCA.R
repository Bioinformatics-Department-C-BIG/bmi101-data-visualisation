library(tidyverse)

# ============================================================
# 04_PCA.R
# Principal Component Analysis (PCA) visualisation
# ============================================================

# ------------------------------------------------------------
# Part 1: Quick synthetic matrix example
# ------------------------------------------------------------
set.seed(123)
mat <- matrix(rnorm(200), nrow = 20)
colnames(mat) <- paste0("sample_", 1:10)
rownames(mat) <- paste0("gene_", 1:20)

pca_res <- prcomp(t(mat), scale. = TRUE)

pca_df <- as.data.frame(pca_res$x[, 1:2])
pca_df$sample <- rownames(pca_df)

ggplot(
  pca_df,
  aes(x = PC1, y = PC2, label = sample)
) +
  geom_point(size = 3, colour = "darkgreen") +
  geom_text(vjust = -0.8, size = 3) +
  theme_minimal() +
  labs(title = "Synthetic PCA Plot")

# ------------------------------------------------------------
# Part 2: PCA on RNA-seq dataset from data/
# ------------------------------------------------------------
norm_counts <- read_csv("data/rnaseq_normalized_counts.csv", show_col_types = FALSE)
meta <- read_csv("data/sample_metadata.csv", show_col_types = FALSE)

# Extract expression matrix (genes x samples)
expr_mat <- as.matrix(norm_counts[, meta$sample_id])
rownames(expr_mat) <- norm_counts$gene_symbol

# Run PCA across samples (samples must be in rows for prcomp)
pca_rnaseq <- prcomp(t(expr_mat), scale. = TRUE)

# Calculate percentage variance explained by each PC
pca_var <- round(100 * (pca_rnaseq$sdev^2 / sum(pca_rnaseq$sdev^2)), 1)

# Combine PCA scores with sample metadata
pca_scores <- as.data.frame(pca_rnaseq$x) %>%
  rownames_to_column("sample_id") %>%
  left_join(meta, by = "sample_id")

# Plot PC1 vs PC2
ggplot(pca_scores, aes(x = PC1, y = PC2, colour = condition, shape = batch)) +
  geom_point(size = 4, alpha = 0.9) +
  geom_text(aes(label = sample_id), vjust = -1, size = 3.5, show.legend = FALSE) +
  labs(
    title = "PCA of RNA-seq Transcriptomes",
    subtitle = "Separation by experimental condition and batch",
    x = paste0("PC1 (", pca_var[1], "% variance)"),
    y = paste0("PC2 (", pca_var[2], "% variance)"),
    colour = "Condition",
    shape = "Batch"
  ) +
  theme_minimal()
