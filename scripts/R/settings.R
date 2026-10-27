## =============================================================================
## Shared settings for the "Decoupling RIG-I and IFNR signaling" manuscript
##
## Sourced at the top of every figure Rmd in scripts/R/. It defines:
##   1. Repository paths (figures/ and analysis/ output folders).
##   2. The path to the RIG-I-only / STAT-only (IFN-only) signatures, which
##      are defined in figure_01.Rmd and re-used by every other section.
##   3. Colour palettes shared across figures (copied from
##      /media/ag-cherrmann/cramirez/rnaSeq_dsRNA/scripts/R/settings.r, the
##      file sourced by the original analysis scripts).
## =============================================================================

library(RColorBrewer)

## -----------------------------------------------------------------------------
## Repository paths
## -----------------------------------------------------------------------------
path2repo <- "/media/bq-storage/ag-cherrmann/cramirez/decoupling_rigi_ifn"

## Original project folder holding the processed data used as input
path2project <- "/media/ag-cherrmann/cramirez/interferon_model"

## Creates (if needed) and returns the figures/ and analysis/ folder of a section
section_dirs <- function(section) {
        dirs <- list(
                figures  = file.path(path2repo, "figures", section),
                analysis = file.path(path2repo, "analysis", section)
        )
        for (d in dirs) {
                if (!dir.exists(d)) dir.create(d, recursive = TRUE)
        }
        dirs
}

## RIG-I-only / STAT-only signatures (gene symbols), written by figure_01.Rmd.
## List with two character vectors: `rigi_only` (94 genes) and
## `stat_only` (99 genes).
path2signs <- file.path(path2repo,
                        "analysis/figure_01/rigi_vs_stat_only_signatures.rds")

## -----------------------------------------------------------------------------
## Colours
## -----------------------------------------------------------------------------
cell_line <- c('WT', 'KO')
condition <- c('dsRNA', 'polyC', 'control')
time <- c(2, 4, 6, 8, 12, 16, 24, 48, 72)

cell_line_colors <- brewer.pal(n = length(cell_line), name = "Set1")
names(cell_line_colors) <- cell_line
cell_line_colors <- cell_line_colors[1:2]

condition_colors <- brewer.pal(n = length(condition), name = "Set2")
names(condition_colors) <- condition

time_colors <- c(
        "2"  = "#FDE725",  # bright yellow (earliest)
        "4"  = "#FCD659",
        "6"  = "#FCB83C",
        "8"  = "#FCA636",
        "12" = "#F98E3D",
        "16" = "#F8766D",
        "24" = "#D84C3E",
        "48" = "#A51C30",
        "72" = "#6B0F1A"   # deep red (latest)
)

time_colors_sumida <- c(
        "0"  = "#FDE725",
        "1"  = "#FCD956",
        "2"  = "#FBC144",
        "4"  = "#FCA636",
        "8"  = "#F98E3D",
        "16" = "#F8766D",
        "48" = "#D84C3E",
        "72" = "#A51C30",
        "96" = "#6B0F1A"
)

colors <- list(cell_line_colors = cell_line_colors,
               condition_colors = condition_colors,
               time_colors = time_colors)

condition_shapes <- c(15, 16, 17)
names(condition_shapes) <- condition

dataset_shapes <- c(16, 17)
names(dataset_shapes) <- c("microarray", "rnaseq")

cluster_colors <- c(
        "cluster_1" = "#E41A1C",
        "cluster_2" = "#377EB8",
        "cluster_3" = "#4DAF4A",
        "cluster_4" = "#FF7F00"
)

colors_time_categories <- c('gray80', 'gray50', 'gray10')
names(colors_time_categories) <- c('Early', 'Intermediate', 'Late')

ifn_condition_colors <- c("control" = "#8DA0CB",
                          "IFN"     = "#F98E3D")
