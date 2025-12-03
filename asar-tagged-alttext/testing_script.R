# Script to test tagging and alt text (from multiple object types)

#############
# Info
#############

# Author: Samantha Schiano
# Date: December 2, 2025
# asar version: v1.5.2
# stockplotr version: 0.6.0-beta

# create folder README to document outcome
# Set wd to folder -- NOT report folder
readme_content <- c("# Project Title", "", "A brief description of the project goes here.")
writeLines(readme_content, file.path(getwd(),"README.md"))

# Download most recent version of asar and stockplotr
remotes::install_github("nmfs-ost/asar")
library(asar)
remotes::install_github("nmfs-ost/stockplotr")
library(stockplotr)

# Step 1: Prepare materials
# Report.sso file and external image already added to the folder
# the report file is for skate 2019 assessment
exdat <- convert_output(file.path(getwd(), "Report.sso"))

# make figures from stockplotr
plot_spawning_biomass(
  dat = exdat,
  module = "TIME_SERIES",
  make_rda = TRUE
)
plot_abundance_at_age(
  dat = exdat,
  make_rda = TRUE
)

# make template
create_template(
  # model_results = exdat
)
# for some reason create_template was hanging when model_results were added

# I saved a plot from plot(cars$speed, cars$dist) into the figures folder
# now need to rerun create_figures_doc()
create_figures_doc(
  subdir = file.path(getwd(), "report")
)

# Render the skeleton file to get your basic pdf and tex files


withr::with_dir(
  file.path(getwd(), "report"),
  add_tagging(
    rename = "tagged_report_no_figs_tabs"
  )
)