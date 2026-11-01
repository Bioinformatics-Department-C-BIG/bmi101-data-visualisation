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

## 📚 Included Tutorials

- `tutorial/01_Introduction.R` – First ggplot example using `mtcars`
- `tutorial/02_ggplot2.R` – ggplot customisation, regression lines, and groupings
- `tutorial/03_Gene_Expression.R` – Gene expression data reshaping and line plotting
- `tutorial/04_PCA.R` – Dimensionality reduction and PCA scatter plotting
- `tutorial/05_Heatmaps.R` – Expression clustering and heatmaps with `pheatmap`
- `tutorial/06_Volcano_Plot.R` – Differential expression volcano plots with threshold cutoffs
- `tutorial/07_Exercises.R` – Practice exercises

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

Place any raw datasets in the `data/` folder before running the later tutorials.
