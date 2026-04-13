# Testing formatting and caption changes in quarto impacting tagpdf tagging

## Test

- create basic r code chunk that includes formatting through gt within a quarto document along with a basic caption
- create table with no formatting. Same everything else


## Results

- table caption is still marked as a header
  Compiling messages:
```
asar::add_tagging("tagged_gt_extended_formatting.tex", rename = "a11y_tagged")
✔ ______Tagging structure added to tex file.______
ℹ ______Compiling in progress - This can take a while...______
Warning: LaTeX Warning: Command \@footnotemark  has changed.
Warning:                Check if current package is valid.
Warning: LaTeX Warning: Label `tbl-format-gt' multiply defined.
Warning: Package scrartcl Warning: Activated tagging detected but not supported!
Warning: (scrartcl)                Note: This class currently does not actively support
Warning: (scrartcl)                tagging. This means: Several elements will not be
Warning: (scrartcl)                tagged correctly. We therefore currently suggest to
Warning: (scrartcl)                not use tagging and i.e. use
Warning: (scrartcl)                  \RequirePackage{pdfmetadata}
Warning: (scrartcl)                  \SetKeys[document/metadata]{...}
Warning: (scrartcl)                instead of
Warning: (scrartcl)                  \DocumentMetadata{...}
Warning: (scrartcl)                to avoid automatic activation of tagging.
Warning: Package footnotehyper Warning: 
Warning: (footnotehyper)    Failed to analyse \@makefntext into something usable.
Warning: (footnotehyper)    Using as fall-back the article class code.
Warning: (footnotehyper)    You may try to email the author this problematic meaning:
Warning: (footnotehyper)    \long macro:#1->\ExecuteDoHook {footnote/text/begin}\raggedfootnote \leftskip 1.5em \l@addto@macro \@trivlist {\ifnum \@listdepth =\@ne \advance \leftmargin 1.5em\relax \fi }\parindent 1em\noindent \IfArgIsEmpty {1em}{}{\hskip \dimexpr 1em-1.5em\relax }\ftn@font \@makefntext@processX {\hbox to \z@ }{\hss \@@makefnmark }\UseTaggingSocket {fntext/text}{}{#1}\ExecuteDoHook {footnote/text/end}
Warning: (footnotehyper)    together with the document preamble (in particular if
Warning: (footnotehyper)    footnote numbers do not show at bottom of page).
Warning: LaTeX Warning: There were multiply-defined labels.
✔ ______Compiling finished______
```

- table is now nested and not in the highest tagged structure (which is fine) and caption and table headers/rows are PROPERLY tagged
```
asar::add_tagging("tagged_gt_extended_formatting.tex", rename = "no_format_tagged")
Warning: LaTeX Warning: Command \@footnotemark  has changed.
Warning:                Check if current package is valid.
Warning: LaTeX Warning: Label `tbl-format-gt' multiply defined.
Warning: Package scrartcl Warning: Activated tagging detected but not supported!
Warning: (scrartcl)                Note: This class currently does not actively support
Warning: (scrartcl)                tagging. This means: Several elements will not be
Warning: (scrartcl)                tagged correctly. We therefore currently suggest to
Warning: (scrartcl)                not use tagging and i.e. use
Warning: (scrartcl)                  \RequirePackage{pdfmetadata}
Warning: (scrartcl)                  \SetKeys[document/metadata]{...}
Warning: (scrartcl)                instead of
Warning: (scrartcl)                  \DocumentMetadata{...}
Warning: (scrartcl)                to avoid automatic activation of tagging.
Warning: Package footnotehyper Warning: 
Warning: (footnotehyper)    Failed to analyse \@makefntext into something usable.
Warning: (footnotehyper)    Using as fall-back the article class code.
Warning: (footnotehyper)    You may try to email the author this problematic meaning:
Warning: (footnotehyper)    \long macro:#1->\ExecuteDoHook {footnote/text/begin}\raggedfootnote \leftskip 1.5em \l@addto@macro \@trivlist {\ifnum \@listdepth =\@ne \advance \leftmargin 1.5em\relax \fi }\parindent 1em\noindent \IfArgIsEmpty {1em}{}{\hskip \dimexpr 1em-1.5em\relax }\ftn@font \@makefntext@processX {\hbox to \z@ }{\hss \@@makefnmark }\UseTaggingSocket {fntext/text}{}{#1}\ExecuteDoHook {footnote/text/end}
Warning: (footnotehyper)    together with the document preamble (in particular if
Warning: (footnotehyper)    footnote numbers do not show at bottom of page).
Warning: LaTeX Warning: Float too large for page by 164.41783pt on input line 326.
Warning: LaTeX Warning: There were multiply-defined labels.
✔ ______Compiling finished______
```




