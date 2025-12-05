# Script to test table R packages compatibility with latex and tagpdf

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

# Step 1: make blank quarto doc ----
# Don't want to rely on asar for the time being
# See quarto doc for testing -- don't need to have it's own script or README

# Adding tagginf from script
asar::add_tagging(
  x = "table_r_pkg_testing.tex",
  rename = "tag_attmp_1"
)

# test tagging on gt doc
asar::add_tagging(
  x = "gt.tex",
  rename = "gt_tagged"
)

# test tagging on kable doc
asar::add_tagging(
  x = "kableextra.tex",
  rename = "kableextra_tagged"
)

# test tagging on flextable
asar::add_tagging(
  x = "flextable.tex",
  rename = "flextable_tagged"
)
