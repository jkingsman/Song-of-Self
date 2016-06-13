del /S /Q build_temp
rmdir build_temp
del /S /Q dist

mkdir build_temp

pdflatex -aux-directory=build_temp -output-directory=dist src/Simple.tex
pdflatex -aux-directory=build_temp -output-directory=dist src/Symbology.tex

pdf2svg dist/Simple.pdf dist/Simple.svg
pdf2svg dist/Symbology.pdf dist/Symbology.svg

call svgexport dist/Simple.svg build_temp/Simple-uncrushed.png 4096:
call svgexport dist/Symbology.svg build_temp/Symbology-uncrushed.png 4096:

pngcrush -reduce build_temp/Simple-uncrushed.png dist/Simple.png
pngcrush -reduce build_temp/Symbology-uncrushed.png dist/Symbology.png

del /S /Q build_temp
rmdir build_temp
