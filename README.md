# decoupling_rigi_ifn
This repository provides the scripts to reproduce the bioinformatics analysis, plots and results in the manuscript "Decoupling RIG-I and IFNR Signaling Reveals Heterogeneous Antiviral Sensing States with Clinical Relevance". We describe an approach to disentangle RIG-I vs IFN downstream signaling. 

## Structure

- `scripts/R/` – one R Markdown per figure section (`figure_01.Rmd` … `figure_04.Rmd`, `supplementary_figure_01.Rmd` … `supplementary_figure_03.Rmd`) plus the rendered `.html`. `settings.R` holds shared paths and colour palettes.
- `figures/<section>/` – the PDF panels of each section.
- `analysis/<section>/` – intermediate tables and objects (signatures, PCA, DEG/GSEA tables, per-cell scores).

Each Rmd has an "Input data" section with the absolute path of every input (count matrices, processed Seurat objects, annotations, gene sets).

## Running

```bash
module load R/4.5.2
cd scripts/R
Rscript -e 'rmarkdown::render("figure_01.Rmd")'   # run first: defines the RIG-I-only / STAT-only signatures
```

Order dependencies:

- `figure_01.Rmd` writes `analysis/figure_01/rigi_vs_stat_only_signatures.rds` (used by all sections) and `analysis/figure_01/pca_concatenated.rds` (used by `supplementary_figure_01.Rmd`).
- `figure_03.Rmd` writes the neutrophil subset used by `supplementary_figure_03.Rmd`.
