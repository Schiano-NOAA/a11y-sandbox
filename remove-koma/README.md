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



## Results


## Efforts to remedy the issue




** Final note:**

