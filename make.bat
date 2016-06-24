del /S /Q build_temp
rmdir build_temp
del /S /Q dist

mkdir build_temp

pdflatex -aux-directory=build_temp -output-directory=dist Default.tex
rem pdflatex -aux-directory=build_temp -output-directory=dist Sans.tex

pdf2svg dist/Default.pdf dist/Default.svg
rem pdf2svg dist/Sans.pdf dist/Sans.svg

call svgexport dist/Default.svg build_temp/Default-uncrushed.png 4096:
rem call svgexport dist/Sans.svg build_temp/Sans-uncrushed.png 4096:

pngcrush -reduce -rem allb build_temp/Default-uncrushed.png dist/Default.png
rem pngcrush -reduce -rem allb build_temp/Sans-uncrushed.png dist/Sans.png

del /S /Q build_temp
rmdir build_temp
