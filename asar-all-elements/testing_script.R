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