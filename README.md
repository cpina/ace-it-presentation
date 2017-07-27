# ace-it-presentation
Presentation in Spanish (at the moment, I might translate it) of some of the IT systems of the ACE 2016-2017 expedition.

ACE stands for Antarctic Circumpolar Expedition.

To save it into a PDF follow the steps:
1.- Open it using Chrome or Chromium
2.- Press Control+P to print it into a file
3.- Execute (on a GNU/Linux system): `pdfcrop --bbox "79 211 535 554" non-cropped-presentation.pdf presentation.pdf`

How to find the right parameters for bbox? Execute before:
`pdfcrop --verbose file.pdf`

And copy the BoundingBox of the first slide (or a black background slide, to adjust the new PDF to the size).
