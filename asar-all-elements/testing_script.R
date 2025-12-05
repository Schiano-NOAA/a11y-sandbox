# Script to test tagging and alt text (from multiple object types)

#############
# Info
#############

# Author: Samantha Schiano
# Date: December 4, 2025
# asar version: v1.5.2
# stockplotr version: 0.6.0-beta

# Download most recent version of asar and stockplotr
remotes::install_github("nmfs-ost/asar")
library(asar)
remotes::install_github("nmfs-ost/stockplotr")
library(stockplotr)

# Step 1: set up report
exdat <- convert_output(file.path(getwd(), "Report.sso"))

# Step 2: create a figure from {stockplotr}
plot_biomass(
  exdat,
  module = "TIME_SERIES",
  make_rda = TRUE
)

# Step 3: create a gt table of landings
# dir.create(file.path(getwd(), "tables"))
library(gt)
# filter data for landings
landings <- exdat |>
  dplyr::filter(
    grepl("landings_observed", label),
    year > 2010,
    # year < 2026,
    !is.na(estimate)
  ) |>
  dplyr::select(year, fleet, estimate) |>
  tidyr::pivot_wider(
    names_from = fleet,
    values_from = estimate
  )
gt(landings)
# place this code into tables doc once asar template is made

# save exdat for access when rendering quarto doc
saveRDS(exdat, file = "exdat.rds")

# Step 4: create an asar template
create_template()

# Had to move the figures into the "report" folder and change the path to the 
# figures in the figures.qmd

# Manually added alt text for the external figure in the csv

# add alt text
add_alttext(
  compile = FALSE,
  rename = "alttext_only"
)
# successful other than the external alt text

# add tagging now
add_tagging(
  x = "alttext_only.tex",
  rename = "tagged_alttext_report"
)



