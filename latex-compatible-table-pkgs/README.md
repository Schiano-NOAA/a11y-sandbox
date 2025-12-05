# Compatability of tables produced from R packages and quarto-->pandoc-->latex conversions

Comparisons of the translated tables created from the following R packages in a quarto doc:
- `gt`
- `kableExtra`
- `flextable`

We know that `kableExtra` has functions to format a table to latex, but I am not
sure the table that is visualized in an R chunk gets translated the same. We also
know that `flextable` tables rendered in a quarto doc can not be tagged and contain
misc. extra formatting (according to Gemini). The formatting from `flextable` is 
also very difficult to manually read and debug.

I know nothing of `gt` tables.

## Test(s)

- Separated each table into their own quarto docs named based on the package they are looking at
- each tex document produced from the quarto render was then run in `asar::add_tagging()` and checked


## Results

- :check `gt` table package was able to be tagged and produced a readable 
  translated table in the latex document
    - a gt table does not pass adobe accessibility checks as the headers are not properly tagged
    - the table does have formatting for a float which caused formatting issues
- :check `kableExtra::kable` produced a tagged table that was visible in the 
  broad tagging structure
  - has similar header tagging issues in adobe accessibility checker
- :check `kableExtra::kbl` produced a tagged table that was hidden in the tagging
  outline within a couple additional drop downs -- I do not know if this makes a difference
- `flextable` does *NOT* produce a tagged document. The translated table to the 
  latex file is not legible without AI. The following error is produced when 
  attempting to run with \\tagpdf added:
  
  ```
  ! Undefined control sequence.
<argument> \ERRORtbl 
          /row
l.207 

Error: LaTeX failed to compile C:/Users/samantha.schiano/Documents/GitHub/a11y-sandbox/latex-compatible-table-pkgs/flextable_tagged.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See flextable_tagged.log for more info.
  ```

## Efforts for a solution

- Change main package for tables in `stockplotr` to either `gt` or `kableExtra` 


**Final Note:**

I made a mistake and happened to use the only package of those I tested that
don't translate to LaTeX well.

