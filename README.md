# BMI101 Data Visualisation Tutorial

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Bioinformatics-Department-C-BIG/bmi101-data-visualisation/HEAD?urlpath=rstudio)

This repository contains an R-based data visualisation tutorial for the CING MSc Bioinformatics module.

## 🚀 Launch Interactive Cloud RStudio Session

You can launch a full, interactive **RStudio Server** session directly in your web browser with no local setup required:

👉 [![Launch RStudio on Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Bioinformatics-Department-C-BIG/bmi101-data-visualisation/HEAD?urlpath=rstudio) **[Click here to open RStudio on MyBinder](https://mybinder.org/v2/gh/Bioinformatics-Department-C-BIG/bmi101-data-visualisation/HEAD?urlpath=rstudio)**

> **Note:** The `?urlpath=rstudio` parameter routes directly to RStudio Server with all tutorial scripts, datasets, and packages pre-loaded (`tidyverse`, `ggplot2`, `ggrepel`, `patchwork`, `viridis`, `pheatmap`, `RColorBrewer`).

---

## 💻 Local Setup

If you prefer to run the tutorials locally in your own R / RStudio environment:

1. Clone this repository:
   ```bash
   git clone https://github.com/Bioinformatics-Department-C-BIG/bmi101-data-visualisation.git
   cd bmi101-data-visualisation
   ```

2. Install dependencies:
   ```bash
   Rscript install.R
   ```

---

## 📂 Datasets in `data/`

The `data/` directory provides realistic bioinformatics and clinical datasets designed for the tutorials and exercises:

| File | Description | Samples / Rows | Typical Visualisation |
|---|---|---|---|
| `sample_metadata.csv` | Experimental design metadata (`sample_id`, `condition`, `batch`, `sequencing_depth_millions`) | 6 samples | Annotations for PCA & Heatmaps |
| `rnaseq_raw_counts.csv` | RNA-seq raw count matrix across 500 genes (including classic biomarkers and housekeepers) | 500 genes × 6 samples | Library size bar plots, filtering |
| `rnaseq_normalized_counts.csv` | Log2 normalized expression values ($log_2(\text{CPM} + 1)$) | 500 genes × 6 samples | Expression line plots, PCA, Heatmaps |
| `differential_expression_results.csv` | DESeq2-style differential expression results (baseMean, log2FoldChange, stat, pvalue, padj, regulation) | 500 genes | Volcano plots, MA plots, gene ranking |
| `patient_clinical_data.csv` | Clinical patient cohort (age, sex, cancer type, stage, tumor size, biomarker level, survival months, vital status) | 150 patients | Boxplots, violin plots, regression, faceting |

---

## 📚 Included Tutorials

- `tutorial/01_Introduction.R` – First ggplot example using `mtcars`
- `tutorial/02_ggplot2.R` – ggplot customisation, regression lines, and patient clinical data boxplots
- `tutorial/03_Gene_Expression.R` – Reshaping RNA-seq expression data and multi-gene bar/line plotting
- `tutorial/04_PCA.R` – Dimensionality reduction, PCA scatter plotting with variance explained and metadata aesthetics
- `tutorial/05_Heatmaps.R` – Clustered heatmaps of top variable genes with sample annotations (`pheatmap`)
- `tutorial/06_Volcano_Plot.R` – Differential expression volcano plots with threshold cutoffs and `ggrepel` labeling
- `tutorial/07_Exercises.R` – 5 hands-on practice exercises based on the datasets in `data/`

---

## 🧪 Introduction Example

```R
library(tidyverse)
library(ggplot2)

R.version.string
head(mtcars)

ggplot(
  mtcars,
  aes(
    x = wt,
    y = mpg
  )
) +
  geom_point(
    size = 3,
    colour = "steelblue"
  ) +
  theme_minimal()
```
