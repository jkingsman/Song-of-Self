del /S /Q build_temp
rmdir build_temp
del /S /Q dist

mkdir build_temp

pdflatex -aux-directory=build_temp -output-directory=dist Simple.tex
pdf2svg dist/Simple.pdf dist/Simple.svg
call svgexport dist/Simple.svg build_temp/Simple-uncrushed.png 4096:
pngcrush -reduce -rem allb build_temp/Simple-uncrushed.png dist/Simple.png

del /S /Q build_temp
rmdir build_temp
