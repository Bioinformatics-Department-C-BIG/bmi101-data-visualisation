library(tidyverse)

# 04_PCA.R
# Principal component analysis visualisation

# Example dataset
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
  labs(title = "PCA plot")
