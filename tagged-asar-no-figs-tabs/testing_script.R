# Script for situation of a tagged asar report with no figures or tables

#############
# INfo
#############

# Date: December 2, 2025
# asar version: v1.5.2
# stockplotr version: 0.6.0-beta

# install current version of asar
remotes::install_github("nmfs-ost/asar")
library(asar)

# Perform test
# Step 1: Create base asar template
create_template()

# Step 2: Render skeleton to make latex file

# Step 3: Modify and render latex file through add_tagging()
withr::with_dir(
  file.path(getwd(), "report"),
  add_tagging(
    rename = "tagged_report_no_figs_tabs"
  )
)

# create folder README to document outcome
# Set wd to folder -- NOT report folder
readme_content <- c("# Project Title", "", "A brief description of the project goes here.")
writeLines(readme_content, file.path(getwd(),"README.md"))

# Step 4: debugging efforts
  tinytex::tlmgr_install("scrartcl")
  tinytex::lualatex("tagged_report_no_figs_tabs.tex")
  # the above FAILED
  
  tinytex::tlmgr_update()
  tinytex::lualatex("tagged_report_no_figs_tabs.tex")
  # the above SUCCEEDED -- see notes in README
