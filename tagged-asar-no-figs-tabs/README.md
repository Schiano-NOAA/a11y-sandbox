# Tagged {asar} report without figures or tables

## Test

- A blank template generated from {asar} was generated and rendered
- Subsequent tagging was added using `add_tagging()` (tagged_report_no_figs_tabs.tex)

## Results

As of **December 2, 2025**, the report failed tagging on my machine resulting in
the following error:

```
! Missing \endcsname inserted.
<to be read again> 
\numexpr 
l.341 \tableofcontents
```

*Note:* Sophie Breitbart was able to compile the report with no changes to the 
current version of asar and tagpdf additions. The associated package causing the
error seems to have updated in the last day or two which must be updated on an 
individual's computer for compilation.

## Efforts to remedy the issue

- Update relevant specific package `tinytex::tlmgr_install("scrartcl")`

- Update latex packages using `tinytex::tlmgr_update()`


**Successful**
After running `tinytex::tlmgr_update()`, the report compiled successfully on
my machine on **December 2, 2025**. The tagged document can be found in the 
"report" folder called "tagged_report_no_figs_tabs_updated.pdf".

The following warnings still appeared:
```
Warning: LaTeX Warning: Command \@footnotemark  has changed.
Warning:                Check if current package is valid.
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
Warning: Package glossaries Warning: Empty glossary for \printnoidxglossary[type={main}]. Rerun may be required (or you may have forgotten to use commands like \gls) on input line 346.
Warning: Package glossaries Warning: Empty glossary for \printnoidxglossary[type={acronym}]. Rerun may be required (or you may have forgotten to use commands like \gls) on input line 346.
[1] "tagged_report_no_figs_tabs.pdf"
```
** Final note:**

Attempting the update the suspected package (identified by Sophie Breitbert)
resulting in the error:

```
tlmgr install scrartcl
tlmgr.pl install: package scrartcl not present in repository.
tlmgr.pl: action install returned an error; continuing.
tlmgr.pl: package repository https://ctan.math.illinois.edu/systems/texlive/tlnet (not verified: pubkey missing)
tlmgr.pl: An error has occurred. See above messages. Exiting.
tlmgr update --self
tlmgr install scrartcl
tlmgr.pl install: package scrartcl not present in repository.
tlmgr.pl: action install returned an error; continuing.
tlmgr.pl: package repository https://ctan.math.illinois.edu/systems/texlive/tlnet (not verified: pubkey missing)
tlmgr.pl: An error has occurred. See above messages. Exiting.
```
