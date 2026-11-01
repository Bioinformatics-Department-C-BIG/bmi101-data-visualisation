packages <- c(
  "tidyverse",
  "ggplot2",
  "ggrepel",
  "patchwork",
  "viridis",
  "pheatmap",
  "RColorBrewer"
)

missing_pkgs <- packages[!packages %in% rownames(installed.packages())]

if (length(missing_pkgs) > 0) {
  if (is.null(getOption("repos")) || getOption("repos")["CRAN"] == "@CRAN@") {
    options(repos = c(CRAN = "https://cloud.r-project.org"))
  }
  install.packages(missing_pkgs)
}
