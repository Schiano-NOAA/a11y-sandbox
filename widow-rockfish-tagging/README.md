# Application of add_accessibility to Widow Rockfish assessment (2026)

## Test

- Investigate why tagging is incorrect for tables in widow assessment (caption 
is getting tagged as table header)

- Testing is occurring in the forked
[widow rockfish repository](https://github.com/Schiano-NOAA/widow_rockfish_2025/tree/flextable_to_gt) 
specifically on the flextable_to_gt branch

- Anyone can render this report, however lines 186-204 in the skeleton must be commented out

- Updated the in-header tex

## Results

- I was able to run `asar::add_accessibility()` on the tex document with no modifications but the following warnings occur:
```
Warning: Package Babel Warning: The package option `english' should not be used
Warning: (Babel)                with a more specific one (like `american') on input line 134.
Warning: LaTeX Warning: Label `tbl-all_removals' multiply defined.
Warning: LaTeX Warning: Label `tbl-all_removals' multiply defined.
Warning: LaTeX Warning: Label `tbl-num-land-length' multiply defined.
Warning: LaTeX Warning: Label `tbl-len-gear-state' multiply defined.
Warning: LaTeX Warning: Label `tbl-landings-hake' multiply defined.
Warning: LaTeX Warning: Label `tbl-sample-age-gear-state' multiply defined.
Warning: LaTeX Warning: Label `tbl-age-gear-state' multiply defined.
Warning: LaTeX Warning: Label `tbl-params' multiply defined.
Warning: LaTeX Warning: Label `tbl-params' multiply defined.
Warning: LaTeX Warning: Label `tbl-params' multiply defined.
Warning: LaTeX Warning: Label `tbl-params' multiply defined.
Warning: LaTeX Warning: Label `tbl-params' multiply defined.
Warning: LaTeX Warning: Label `tbl-params' multiply defined.
Warning: LaTeX Warning: Label `tbl-ts-popests-basecase' multiply defined.
Warning: LaTeX Warning: Label `tbl-ts-popests-basecase' multiply defined.
Warning: Package footnotehyper Warning: 
Warning: (footnotehyper)    Failed to analyse \@makefntext into something usable.
Warning: (footnotehyper)    Using as fall-back the article class code.
Warning: (footnotehyper)    You may try to email the author this problematic meaning:
Warning: (footnotehyper)    \protected\long macro:#1->\noindent \socket_use:n {fntext/mark/link}\tag_socket_use:nnn {fntext/mark}{}{\socket_use:n {fntext/mark}}\tag_socket_use:nnn {fntext/text}{}{\socket_use:nn {fntext/text}{#1}}
Warning: (footnotehyper)    together with the document preamble (in particular if
Warning: (footnotehyper)    footnote numbers do not show at bottom of page).
Warning: Package soulutf8 Warning: This package is obsolete,
Warning: (soulutf8)                use the soul package directly. 
Warning: (soulutf8)                 on input line 29.
Warning: Package tagpdf Warning: Alternative text for graphic is missing.
Warning: (tagpdf)                Using 'support_files/Widow_rockfish.png' instead.
Warning: Package tagpdf Warning: Alternative text for graphic is missing.
Warning: (tagpdf)                Using 'support_files/us_doc_logo.png' instead.
Warning: Package glossaries Warning: \makenoidxglossaries is required to make \printnoidxglossary[type={main}] work on input line 520.
Warning: Package glossaries Warning: \makenoidxglossaries is required to make \printnoidxglossary[type={acronym}] work on input line 520.
Warning: LaTeX Warning: Hook 'shipout/lastpage' executed on wrong page (137 not 138).
Warning:                Rerun to correct this.
Warning: LaTeX Warning: There were multiply-defined labels.
```
- `LaTeX Warning: Label 'tbl-params' multiply defined.` this type of warning 
indicate that the code chunk label is repeated but this is not the case for any
of them

- 


## Efforts to remedy the issue

- Remove all gt formatting other than the gt() initial function off of the data then render + add_accessibility
  This resulted in proper function and the caption labelled correctly. (Working on looking at why is this the case since we use other gt arguments plenty and don't get the same error)
- Looks like so far the following formatting functions are interacting with the tagging negatively:
  * gt::fmt_number
  * gt::tab_options


## Notes:

- widow rockfish assessment is using the sa4ss_glossaries.tex (not report_glossary.tex)
- their formatting files are out-of-date and could be used as an example of how to update and modify the template from legacy templates
- The glossary for asar documents is titled as "Acronyms" in the beginning of the rendered document
- To update the current doc, 
  (1) the in-header.tex files needs adjustment along with pfmc.tex 
      (this content could be moved into in-header.tex), 
  (2) `\printnoidxglossaries` should be moved out of the yaml and into the first
      line after the yaml in the skeleton,
  (3) remove the "include-after-body:" portion of the yaml as it is no longer needed
  
- 

## Documentation

- tabs_edit1 is with the gt customizations commented out for the first table in the executive summary and only tab_options commented out for the first table in the tables section
  this fixed the issue for the exec summ table, but the issue perstisted for the tables doc test table
- tabs_edit2 is with gt customizations for gt_options only for the first tables in exec summary and all additional customization for first table in tables doc commented out
  this resulted in still having issues for both tables
- a11y-rep-tabs-off is turning eval = F for the table chunks that throw the repeated label issue

