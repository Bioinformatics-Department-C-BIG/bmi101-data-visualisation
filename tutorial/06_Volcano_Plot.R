library(tidyverse)
library(ggrepel)

# ============================================================
# 06_Volcano_Plot.R
# Differential expression volcano plot example
# ============================================================

# ------------------------------------------------------------
# Part 1: Toy simulated volcano plot
# ------------------------------------------------------------
volcano <- data.frame(
  gene = paste0("gene_", 1:200),
  log2FC = rnorm(200, mean = 0, sd = 1.5),
  pvalue = runif(200, 1e-20, 1)
) %>%
  mutate(significant = pvalue < 0.05 & abs(log2FC) > 1)

volcano_plot <- ggplot(
  volcano,
  aes(x = log2FC, y = -log10(pvalue), colour = significant)
) +
  geom_point(alpha = 0.8, size = 2) +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed") +
  labs(
    title = "Toy Volcano Plot",
    x = "log2 fold change",
    y = "-log10(p-value)"
  ) +
  theme_minimal()

print(volcano_plot)

# ------------------------------------------------------------
# Part 2: Real differential expression volcano plot from data/
# ------------------------------------------------------------
deg <- read_csv("data/differential_expression_results.csv", show_col_types = FALSE)

# Select top significant genes to label
top_hits <- deg %>%
  filter(padj < 1e-15 & abs(log2FoldChange) > 2)

deg_volcano <- ggplot(
  deg,
  aes(x = log2FoldChange, y = -log10(padj), colour = regulation)
) +
  geom_point(alpha = 0.75, size = 2) +
  scale_colour_manual(
    values = c(
      "Upregulated" = "firebrick3",
      "Downregulated" = "dodgerblue3",
      "Not Significant" = "grey70"
    )
  ) +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed", colour = "black", linewidth = 0.4) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", colour = "black", linewidth = 0.4) +
  geom_text_repel(
    data = top_hits,
    aes(label = gene_symbol),
    size = 3.2,
    max.overlaps = 15,
    box.padding = 0.4,
    show.legend = FALSE
  ) +
  labs(
    title = "Differential Expression Volcano Plot",
    subtitle = "Treated vs Control (FDR < 0.05, |log2FC| > 1)",
    x = "log2 Fold Change",
    y = "-log10(adjusted p-value)",
    colour = "Status"
  ) +
  theme_minimal()

print(deg_volcano)
