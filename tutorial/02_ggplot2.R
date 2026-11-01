library(tidyverse)
library(ggplot2)

# ============================================================
# 02_ggplot2.R
# Building on the basic ggplot grammar
# ============================================================

# ------------------------------------------------------------
# Part 1: Warmup using mtcars
# ------------------------------------------------------------
# Plot mpg vs wt and colour by number of cylinders

ggplot(
  mtcars,
  aes(
    x = wt,
    y = mpg,
    colour = factor(cyl)
  )
) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Miles per gallon vs weight",
    x = "Weight",
    y = "MPG",
    colour = "Cylinders"
  ) +
  theme_minimal()

# ------------------------------------------------------------
# Part 2: Working with clinical patient cohort data
# ------------------------------------------------------------
# Load dataset from data/
clinical <- read_csv("data/patient_clinical_data.csv", show_col_types = FALSE)

# Inspect columns
glimpse(clinical)

# Plot A: Boxplot of tumor size across cancer stages
ggplot(clinical, aes(x = cancer_stage, y = tumor_size_mm, fill = cancer_stage)) +
  geom_boxplot(alpha = 0.7, outlier.colour = "firebrick") +
  geom_jitter(width = 0.2, alpha = 0.5, size = 1.5) +
  labs(
    title = "Tumor Size across Cancer Stages",
    x = "Clinical Stage",
    y = "Tumor Size (mm)",
    fill = "Stage"
  ) +
  theme_minimal()

# Plot B: Overall survival vs age faceted by cancer type
ggplot(clinical, aes(x = age, y = overall_survival_months, colour = vital_status)) +
  geom_point(size = 2.5, alpha = 0.8) +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~cancer_type) +
  labs(
    title = "Overall Survival vs Age by Cancer Type",
    x = "Patient Age (years)",
    y = "Overall Survival (months)",
    colour = "Vital Status"
  ) +
  theme_minimal()
