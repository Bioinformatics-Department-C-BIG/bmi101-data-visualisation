library(tidyverse)

# ============================================================
# 03_Gene_Expression.R
# Example workflow for visualising gene expression values
# ============================================================

# ------------------------------------------------------------
# Part 1: Toy expression matrix example
# ------------------------------------------------------------
expression <- data.frame(
  gene = c("GeneA", "GeneB", "GeneC", "GeneD"),
  control_1 = c(10.2, 8.5, 13.1, 7.8),
  control_2 = c(11.0, 8.9, 12.7, 7.5),
  treatment_1 = c(18.4, 15.2, 11.0, 9.1),
  treatment_2 = c(19.2, 14.8, 10.5, 8.9)
)

expression_long <- expression %>%
  pivot_longer(
    cols = -gene,
    names_to = "sample",
    values_to = "expression"
  )

ggplot(
  expression_long,
  aes(x = sample, y = expression, group = gene, colour = gene)
) +
  geom_line() +
  geom_point() +
  theme_minimal() +
  labs(title = "Gene expression across samples")

# ------------------------------------------------------------
# Part 2: Visualising RNA-seq normalized counts from data/
# ------------------------------------------------------------
norm_counts <- read_csv("data/rnaseq_normalized_counts.csv", show_col_types = FALSE)
meta <- read_csv("data/sample_metadata.csv", show_col_types = FALSE)

# Select key marker genes
target_genes <- c("GAPDH", "ACTB", "TNF", "IL6", "MYC", "CDKN1A", "VEGFA", "TP53")

plot_data <- norm_counts %>%
  filter(gene_symbol %in% target_genes) %>%
  select(gene_symbol, Control_1:Treated_3) %>%
  pivot_longer(
    cols = -gene_symbol,
    names_to = "sample_id",
    values_to = "log2_expression"
  ) %>%
  left_join(meta, by = "sample_id")

# Plot gene expression profiles faceted by gene
ggplot(plot_data, aes(x = sample_id, y = log2_expression, fill = condition)) +
  geom_col(width = 0.6) +
  facet_wrap(~gene_symbol, scales = "free_y") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(
    title = "RNA-seq Expression Profiles for Key Genes",
    x = "Sample",
    y = "Log2(Normalized Counts + 1)",
    fill = "Condition"
  )
