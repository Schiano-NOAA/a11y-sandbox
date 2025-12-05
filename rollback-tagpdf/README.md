# Tagged {asar} report with figures made with and without {stockplotr}

Note that we will be using the same format csv as found in {stockplotr} and
called in by `add_alttext()`

## Test

- An empty report with two plots from code chunks along with one external image added using markdown. 
- Add alt text using the function add_alttext()


## Results

- alt text could not be added as is to the figures; manual adjustments needed to
be made -- indicating a need to change the function as a hybrid of the old and 
new versions of this function

- I manually added in the notation for alternative text in the tex file to proceed with this test. 
- Manually adding the alt text using 

## Efforts to remedy the issue

- Rollback version using one of the option from: `tinytex::tlmgr("restore tagpdf")`
- No previous versions found (I am guessing since an oficial release hasn't been 
put out and they are all just "tags" in the repo)

```
tlmgr restore tagpdf
Available backups for tagpdf: 
```

*The above is not a copying error. This was the result of running the code.


** Final note:**

