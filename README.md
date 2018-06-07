# Result
See the presentations here:
https://cpina.github.io/ace-it-presentation/

# Presentations
Different presentations of Python, Django or IT during the ACE (Antarctic Circumnavigation Expedition) 2016 expedition.

To save it into a PDF follow the steps:
1. cd to the git directory
2. python3 -m http.server
3. Using Chrome or Chromium: http://localhost:8080
4. Press Control+P to print it into a file
5. Execute (on a GNU/Linux system): `pdfcrop --bbox "79 211 535 554" non-cropped-presentation.pdf presentation.pdf`

How to find the right parameters for bbox? Execute before:
`pdfcrop --verbose file.pdf`

And copy the BoundingBox of the first slide (or a black background slide, to adjust the new PDF to the size).
