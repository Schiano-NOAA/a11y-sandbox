# Test differences in report and article document class types and impact on a11y

#############
# Info
#############

# Author: Samantha Schiano
# Date: December 9, 2025
# asar version: v1.5.2
# stockplotr version: 0.6.0-beta

# set wd to the folder
setwd("~/GitHub/a11y-sandbox/remove-koma")

# Download most recent version of asar and stockplotr
remotes::install_github("nmfs-ost/asar")
library(asar)
remotes::install_github("nmfs-ost/stockplotr")
library(stockplotr)


# test 1: blank asar report with tagging
create_template()
# modify template yaml so document class is article
# render
# font looks different here
# next add tagging to the tex file and see result
add_tagging(rename = "article_tagged")


# test 2: same as above but document class is report
# manually changed document class to report in the yaml then rendered
# next add tagging and rename
add_tagging(rename = "report_tagged")


