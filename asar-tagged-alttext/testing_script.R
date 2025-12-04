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

# Step 1: Prepare materials ----
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

# Step 2: add alternative text ----
# Add alt text into tex file
# first added alt text into captions_alt_text.csv along with fig label
# label is the same as in the qmd file *not including* 'fig-'
withr::with_dir(
  file.path(getwd(), "report"),
  add_alttext(
    rename = "alttext_only"
  )
)
# above did not recognize any fgures or images in the file

setwd("~/GitHub/a11y-sandbox/asar-tagged-alttext/report")
add_alttext(
  x = "SAR_species_skeleton.tex",
  dir = getwd(),
  figures_dir = getwd(),
  alttext_csv_dir = getwd(),
  compile = TRUE,
  rename = "alttext_only"
)
# function does not recognize the names with a period inside of the function name
# example is {SAR_species_skeleton_files/figure-pdf/fig-pop.naa-1.pdf}

# Manually added the alt text to each figure
# Also needed to change the extensions of the code chunk figures to png
img_path <- "~/GitHub/a11y-sandbox/asar-tagged-alttext/report/SAR_species_skeleton_files/figure-pdf"
pdftools::pdf_convert(
  file.path(img_path, "fig-pop.naa-1.pdf"), 
  format = "png", 
  dpi = 300, 
  filenames = file.path(img_path, "fig-pop.naa-1.png")
)
pdftools::pdf_convert(
  file.path(img_path, "fig-spawning.biomass-1.pdf"), 
  format = "png", 
  dpi = 300, 
  filenames = file.path(img_path, "fig-spawning.biomass-1.pdf")
)

imgs <- list.files(img_path)
for (i in seq_along(imgs)) {
  img_file <- imgs[i]
  # if (grepl(".png", img_file)) 
  #   next
  img_file_con <- gsub(".pdf", ".png", img_file)
  if (!file.exists(file.path(img_path, img_file_con))) {
    pdftools::pdf_convert(
      file.path(img_path, img_file), 
      format = "png", dpi = 300, 
      filenames = file.path(img_path, img_file_con)
    )
  }
}

# Step 3: add tagging ----
# add tagging to document and test compilation
withr::with_dir(
  file.path(getwd(), "report"),
  add_tagging(
    rename = "tagged_report_no_figs_tabs",
    compile = TRUE
  )
)