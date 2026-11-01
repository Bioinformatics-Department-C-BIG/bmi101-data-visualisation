packages <- c(
  "tidyverse",
  "ggplot2",
  "ggrepel",
  "patchwork",
  "viridis",
  "pheatmap",
  "RColorBrewer"
)

installed <- rownames(installed.packages())

for (pkg in packages) {
  if (!pkg %in% installed) {
    install.packages(
      pkg,
      repos = "https://cloud.r-project.org"
    )
  }
}
