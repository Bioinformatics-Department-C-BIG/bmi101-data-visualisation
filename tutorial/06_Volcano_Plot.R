library(tidyverse)

# 06_Volcano_Plot.R
# Differential expression volcano plot example

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
    title = "Volcano plot",
    x = "log2 fold change",
    y = "-log10(p-value)"
  ) +
  theme_minimal()

print(volcano_plot)
