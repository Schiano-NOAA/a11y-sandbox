# Determining where alt text is registered when the image is in pdf vs png
# This is assuming the document is tagged bc the method the alt text is added does not render without it

## Test

- add alternative text by appending the alt text to the end of the image path 
(renders without tagging, but not when tagging it applied); also change package from `pandocbounded` to `pdftooltip`

```
\pandocbounded{\includegraphics[keepaspectratio]{plot.png}}{'Alt text for an external image exampe'}
```

- alt text is added after keepaspectratio in the image line as such:

```
\pandocbounded{\includegraphics[keepaspectratio,alt={'Alt text for an external image exampe'}]{plot.pdf}}
```

- Next, the same formatting was kept but the image was converted to a png and the image path was replaced to load in the correct file

```
\pandocbounded{\includegraphics[keepaspectratio,alt={'Alt text for an external image exampe'}]{plot.png}}

```

## Results

- In the method of adding alt text to the end of the line AND replacing the packages
  - the method in the files is referred to as  "prev" as in previous method
  - When hovering over the image in the pdf, the alt text does not appear
  - the alt text HOWEVER is in the tagging structure which you can se

- Alt text added in after "keepaspectratio" as referred to in the files as the 
"new" method correctly adds in the alternative text when **the document is tagged**
- When the image is a pdf, you will NOT be able to see the alt text by hovering 
over the image
  - to see this alt text, navigate to the image's tag in the tag structure, then 
  right click, select 'Properties' and the alt text should be in the "alternative 
  text box" in the pop-up
  - here the alt text can also be edited
- when the image is a png, the alt text appears as a pop-up when you hover over the image
  - in this method, you will also see alt text entered in the properties of the 
  tag as in the test before this

- 

## Efforts to remedy the issue




** Final note:**

