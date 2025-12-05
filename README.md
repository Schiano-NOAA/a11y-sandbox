# Accessibility Sandbox

This repository housing testing situation for accessibility features and tools 
specifically focused for development into quarto accessibility and in templates 
generated from [{asar}](https://github.com/nmfs-ost/asar). 
It is designed to help developers and testers experiment with various accessibility 
scenarios to ensure their applications are usable by everyone, including people 
with disabilities.

Each folder contains a different situation for testing. To navigate, click on the
folder and read the README filter within the folder to understand the test, date, 
and findings.

## Current Findings [Dec. 5, 2025]

- Documents CAN be successfully tagged with both tables and figures excluding tables made from {flextable}
- Of the tested packages (gt, flextable, kableExtra), {flextable} is currently NOT compatible with tagging in LaTeX documents
- Both {gt} and {kableExtra} produce taggable tables in LaTeX; however, they have issues with headers
- In order to ensure that headers are tagged and recognized in taggable tables, the following line must be added before the table in the LaTeX document:
  
  ```
  \tagpdfsetup{table/header-rows={1}} 
  ```

- a custom table function being developed in {stockplotr} will provide the best solution for producing taggable tables along with additional notation that will be placed into `add_tagging()`
- There is a current issue with the {scrartcl} latex package which will appear as a series of warnings in your document
- The current version of `asar::add_alttext()` will add alternative text to your document *only* when tagging is also added (This should not pose an issue since tagging now is working with most tables.)
- Current quarto --> latex once tagged produce an author/unknown table which ends up being indicated as an issue in tagging and will not pass the adobe acrobat accessibility check - we are not sure if this is a valid issue and will be exploring it further


