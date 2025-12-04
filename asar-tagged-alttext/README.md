# Tagged {asar} report with figures made with and without {stockplotr}

Note that we will be using the same format csv as found in {stockplotr} and
called in by `add_alttext()`

## Test

- An empty report with two plots from code chunks along with one external image added using markdown. 
- Add alt text using the `function add_alttext()`
- Add tagging using asar `function add_tagging()`


## Results

- alt text could not be added as is to the figures; manual adjustments needed to
be made -- indicating a need to change the function as a hybrid of the old and 
new versions of this function

- Note: [dec 4 2025] I asked Sophie B. if she was able to add alt text using the
recent version of asar and she confirmed. Potentially something wrong with my 
setup or download of the package.

- I manually added in the notation for alternative text in the tex file to proceed with this test. 
- Manually adding the alt text using alt="alt text" after "\\pandocbounded{\\includegraphics[keepaspectratio" in latex code line with image

- Tagging worked with the following warnings:

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
Warning: Package tagpdf Warning: Destination 'figure.caption.3' has no related
Warning: (tagpdf)                structure.
Warning: (tagpdf)                /Ref not updated.
Warning: Package tagpdf Warning: Destination 'figure.caption.4' has no related
Warning: (tagpdf)                structure.
Warning: (tagpdf)                /Ref not updated.
Warning: Package tagpdf Warning: Destination 'figure.caption.5' has no related
Warning: (tagpdf)                structure.
Warning: (tagpdf)                /Ref not updated.

```
  - also in this tagging run, alt text did not show up for the figures made from code chunks
  - I removed the space "keepaspectratio, alt=" --> keepaspectratio,alt=" (which is how I had it for the non-code figure; I did not think it made a difference)

## Efforts to remedy the issue


** Final note:**

