@echo off
del /S /Q build_temp
rmdir build_temp
del /S /Q dist

mkdir build_temp

for %%f in (src/*.tex) do (
	echo Processing %%~nf
	pdflatex -aux-directory=build_temp -output-directory=dist src/%%~nf.tex
	mv dist/%%~nf.pdf dist/pdf-%%~nf.pdf
	pdf2svg dist/pdf-%%~nf.pdf dist/svg-%%~nf.svg
	call svgexport dist/svg-%%~nf.svg build_temp/%%~nf-uncrushed.png 4096:
	pngcrush -reduce -rem allb build_temp/%%~nf-uncrushed.png dist/png-%%~nf.png
)

del /S /Q build_temp
rmdir build_temp
