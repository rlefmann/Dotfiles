#!/bin/bash
# Split a PDF in 1-page files, redact the files and combine the redacted files
# back together
# requires: pdfinfo (from poppler-utils), pdftk, and a pdf editor (e.g. gimp)

# editor can be gimp or inkscape
pdfeditor=gimp

file="$1"

if [ "${file##*.}" != "pdf" ]; then
	echo "$file is not a pdf file"
	exit 1
fi

# filepath without extension:
filename="${file%.*}"

numpages=$(pdfinfo $file | grep "Pages" | awk '{print $2}')
unset Outfile

for i in $(seq 1 $numpages); do
	tmpfilename="$filename-$i.pdf"
	pdftk "$file" cat "$i" output "$tmpfilename"
	Outfile[$i]="$tmpfilename"
	#$pdfeditor "$tmpfilename"  # if pdfeditor is inkscape you can put the edit command here to avoid accidentally closing all inkscape windows
done

$pdfeditor "${Outfile[@]}"
pdftk "${Outfile[@]}" cat output "$filename-redacted.pdf"
rm "${Outfile[@]}"
