# This file builds the documentation using GAPDoc
# The files needed to produce the documentation are
# main.xml
# smallcancellation.bib
# manual.css
# makedoc.g

path := Directory("./doc");;
main := "main.xml";;
files := [
		"./lib/smallcancellation.gd", "./lib/smallcancellation.gi",
		"./lib/smallcancellation_external.gd", "./lib/smallcancellation_external.gi",
];;
bookname := "SmallCancellation";;
doc := ComposedDocument("GAPDoc", path, main, files, true);;

MakeGAPDocDoc( path, main, files, bookname);
