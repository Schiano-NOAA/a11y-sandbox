# Removing koma class from asar report and changing to report
# Try and remove issue with incompatibility


All tagged reports from quarto/asar result in:

```
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
```

which is an incompatibility with koma classes and tagpdf. There are suggested 
alternatives to this of changing document class to report in the yaml:

```
format:
  pdf:
    documentclass: report
```

or

```
format:
  pdf:
    documentclass: article
```

*article is the equivalent of scartcl without koma*

Relevant link: https://quarto.org/docs/output-formats/pdf-basics.html#document-class

## Test

### asar document class = article

- created blank asar template and edited the yaml so that the document class is article
- there were some odd things going on in the console, but it worked fine
- the font looks different though (just a note)
- after add_tagging (document output = "article_tagged.pdf") it worked fine with only warnings for the glossary


```
Warning: Package glossaries Warning: Empty glossary for \printnoidxglossary[type={main}]. Rerun may be required (or you may have forgotten to use commands like \gls) on input line 346.
Warning: Package glossaries Warning: Empty glossary for \printnoidxglossary[type={acronym}]. Rerun may be required (or you may have forgotten to use commands like \gls) on input line 346.
✔ ______Compiling finished______
```

### asar document class = report

- used same blank asar template and edited the yaml so that the document class is report
- there were some odd things going on in the console, but it worked fine
- the font looks different though (just a note)
- after add_tagging (document output = "report_tagged.pdf"), 
- report labels each child doc as a chapter instead od numbered

```
Warning: Package glossaries Warning: Empty glossary for \printnoidxglossary[type={main}]. Rerun may be required (or you may have forgotten to use commands like \gls) on input line 346.
Warning: Package glossaries Warning: Empty glossary for \printnoidxglossary[type={acronym}]. Rerun may be required (or you may have forgotten to use commands like \gls) on input line 346.
✔ ______Compiling finished______
```

## Results


## Efforts to remedy the issue




** Final note:**

