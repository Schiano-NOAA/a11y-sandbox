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

## Current Findings [Dec. 8, 2025]

- Documents CAN be successfully tagged with both tables and figures excluding tables made from {flextable}
- Of the tested packages (gt, flextable, kableExtra), {flextable} is currently NOT compatible with tagging in LaTeX documents
- Both {gt} and {kableExtra} produce taggable tables in LaTeX; however, they have issues with headers
- In order to ensure that headers are tagged and recognized in taggable tables, the following line must be added before the table in the LaTeX document:
  
  ```
  \tagpdfsetup{table/header-rows={1}} 
  ```

- a custom table function being developed in {stockplotr} will provide the best solution for producing taggable tables along with additional notation that will be placed into `add_tagging()`
- The current version of `asar::add_alttext()` will add alternative text to your document *only* when tagging is also added (This should not pose an issue since tagging now is working with most tables.)
- There is a current issue with the {scrartcl} latex package which will appear as a series of warnings in your document (see bullet below)
- Current quarto --> latex once tagged produce an author/unknown table which ends up being indicated as an issue in tagging and will not pass the adobe acrobat accessibility check. As described in [this issue](https://github.com/latex3/tagging-project/issues/1113), the problem seems to stem from the tagpdf package's incompatibility with the {scrartcl} package. To avoid this issue, indicate the documentclass as "report" or something that's not a KOMA class, [as shown in this reprex](https://github.com/latex3/tagging-project/issues/1113#issuecomment-3627297846).
- The following LaTeX code, when added to a table, appears to produce "private" tags: `\endfirsthead`. PDFs with "private" tags tend to fail the adobe accessibility check's tables-related 'TH and TR' test. Removing these tags (by manually deleting them, or commenting out the following line) and rechecking the document shows that the 'TH and TR' test is passed. This code is used to ensure that, if a table is split across pages, its header will be repeated on each page. Repeating the header is a good practice for increasing report accessibility. We'll have to research potential alternatives to this line that enable header repetition without creating private tags.
- Though this approach is not reproducible, it's possible to manually remove or edit tags in Adobe's tag tree as a short-term fix to ensure tests pass. As some existing hurdles relate to properly tagging table captions, for example, one can manually assign a caption tag to a table's caption and pass the accessibility checker.