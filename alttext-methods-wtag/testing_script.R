# Testing script for development of add_alttext for asar v1.6.0

devtools::load_all()

remotes::install_github("nmfs-ost/asar@alttext-improve")

# convert output
test_output_file <- "~/Stock Assessment Workflow/SS_output_examples/Report_petrale_production.sso"
output <- convert_output(test_output_file)

save(output, file = "test_output.rda")

# save plots easily
stockplotr::save_all_plots(output)

# create baseline report
create_template()

# add this into tables doc r chunk
#| tbl-cap: This  is my cool caption
#| label: tbl-landgt
#| echo: false
landings <- conout |> 
  dplyr::filter(grepl("landings", label)) |>
  dplyr::select(label, year, estimate, fleet) |>
  head()

gt::gt(landings)

#| tbl-cap: This  is my cool caption for a kable table.
#| label: tbl-landkable
#| echo: false
kableExtra::kable(landings)


#| tbl-cap: This  is my cool caption for a kbl table.
#| label: tbl-landkbl
#| echo: false
kableExtra::kbl(landings)

# alt text args
x = "SAR_species_skeleton.tex"
dir = "~/GitHub/asar/report"
alttext_csv = "~/GitHub/asar/captions_alt_text.csv"
compile = FALSE
rename = "new_alttext"

# alt text fxn
add_alttext(
  x = "tagged_report.tex",
  dir = "~/GitHub/asar/report",
  # figures_dir = "~/GitHub/asar/Figures",
  alttext_csv = "~/GitHub/asar/captions_alt_text.csv",
  compile = TRUE,
  rename = "alttext_prev"
)

add_alttext(
  x = "SAR_species_skeleton.tex",
  dir = "~/GitHub/asar/report",
  # figures_dir = "~/GitHub/asar/Figures",
  alttext_csv = "~/GitHub/asar/captions_alt_text.csv",
  compile = FALSE,
  rename = "alttext_new",
  tagged = TRUE
)
add_tagging(
  x = "alttext_new.tex",
  dir = getwd(),
  compile = TRUE,
  rename = "tagged_alttext_new"
)


add_alttext(
  x = "alttext_method2.tex",
  dir = "~/GitHub/asar/report",
  # figures_dir = "~/GitHub/asar/Figures",
  alttext_csv = "~/GitHub/asar/captions_alt_text.csv",
  compile = FALSE,
  rename = "method1_to_2",
  tagged = TRUE
)

add_accessibility(
  x = "SAR_species_skeleton.tex",
  dir = getwd(), #"~/GitHub/asar/report",
  alttext_csv = "~/GitHub/asar/captions_alt_text.csv",
  compile = TRUE,
  rename = "accessible_report"
)


## Testing after the files were moved into the a11y-sandbox repo
asar::add_alttext(
  x = "SAR_species_skeleton.tex",
  dir = "~/GitHub/a11y-sandbox/report",
  alttext_csv = "~/GitHub/a11y-sandbox/alttext-methods-wtag",
  compile = FALSE,
  rename = "alttext_wo_tags",
  tagged = FALSE
)
