library(tidyverse)
library(ggplot2)
library(ggrepel)

# ============================================================
# 07_Exercises.R
# Practice exercises for the BMI101 data visualisation course
# ============================================================

# ------------------------------------------------------------
# Exercise 1: Clinical Cohort Visualisation
# ------------------------------------------------------------
# Objective: Load `data/patient_clinical_data.csv` and create a violin or boxplot
# showing `tumor_size_mm` across different `cancer_stage`s.
# Bonus: Overlay points with `geom_jitter()` and color by `vital_status`.

clinical <- read_csv("data/patient_clinical_data.csv", show_col_types = FALSE)

# Your code here:
# ggplot(clinical, aes(...)) + ...


# ------------------------------------------------------------
# Exercise 2: Scatter Plot with Regression & Faceting
# ------------------------------------------------------------
# Objective: In the clinical dataset, plot `biomarker_expression` (x-axis) vs
# `tumor_size_mm` (y-axis). Add a linear trendline using `geom_smooth(method = "lm")`,
# and facet the plot by `cancer_type`.

# Your code here:


# ------------------------------------------------------------
# Exercise 3: Sequencing Depth & Library Size Check
# ------------------------------------------------------------
# Objective: Load `data/rnaseq_raw_counts.csv`. Calculate the total read count
# (sum of counts) for each of the 6 samples. Create a bar chart (`geom_col`)
# comparing library sizes across samples.

raw_counts <- read_csv("data/rnaseq_raw_counts.csv", show_col_types = FALSE)

# Your code here:


# ------------------------------------------------------------
# Exercise 4: Expression Profiling of Custom Genes
# ------------------------------------------------------------
# Objective: Load `data/rnaseq_normalized_counts.csv` and `data/sample_metadata.csv`.
# Choose 4 genes of interest (e.g. "TP53", "EGFR", "PTEN", "MYC").
# Reshape the data with `pivot_longer()` and create a line or grouped bar plot
# comparing their expression across Control and Treated samples.

norm_counts <- read_csv("data/rnaseq_normalized_counts.csv", show_col_types = FALSE)
meta <- read_csv("data/sample_metadata.csv", show_col_types = FALSE)

# Your code here:


# ------------------------------------------------------------
# Exercise 5: MA Plot (Mean Expression vs Log2 Fold Change)
# ------------------------------------------------------------
# Objective: Load `data/differential_expression_results.csv`. Create an MA plot:
# - x-axis: log10(baseMean)
# - y-axis: log2FoldChange
# - colour points by `regulation` ("Upregulated", "Downregulated", "Not Significant")
# - Add dashed horizontal lines at log2FoldChange = 1 and -1.

deg <- read_csv("data/differential_expression_results.csv", show_col_types = FALSE)

# Your code here:
