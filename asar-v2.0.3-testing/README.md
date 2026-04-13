# Determine the current compatability of asar with gt tables

## Test

- create blank asar script and run with basic --> complex gt table examples
- add formatted gt as made in other test folder "gt-table-tag-wformat"
- test if this is happening for kable tables as well

## Example code

```
asar::create_template()
```

- added basic gt table to tables doc
- rendered
- added tagging `asar::add_tagging()` (add_accessibility not run bc not testing 
figures and would not do anything other than produce unncessary warnings)


# Result

- formatting on the page is very off, table extends past page margins and off 
the page along with it being unnecessarily wide
- simple table is tagged as expected with caption and table separate
- I did not include float options in this test so there is a separation in tags,
"tables" header, and the table

- a more complex example with formatting still resulted in the same issue where 
caption is bundled in the table tag and tagged as a table header and not a caption

- the same issue happens with kable tables, they are properly tagged but with 
basic or more complex, the caption is tagged as a header

## Notes

- I notice that there is a difference in the way tables are made from just `gt` to `gt` with formatting like `gt_options()`
- Tables with just `gt` use `\\begin{table}` ~ caption ~ `\\begin{tabular}`
- Tables with formatting use `\\begin{longtable}` ~ caption ~ `\\tabularnewline`



