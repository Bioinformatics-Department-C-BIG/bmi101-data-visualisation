library(tidyverse)

# 03_Gene_Expression.R
# Example workflow for visualising gene expression values

# Example data: gene expression matrix
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
