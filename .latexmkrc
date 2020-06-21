#!/usr/bin/perl
$latex          = 'lualatex -shell-escape';
#$pdflatex       = 'lualatex %O -synctex=1 -interaction=nonstopmode %S';
$biber          = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex         = 'upbibtex %O %B';
$makeindex      = 'upmendex %O -o %D %S';
$dvipdf         = 'dvipdfmx %O -f ptex-ipaex.map -o %D %S';
$dvips          = 'dvips %O -z -f %S | convbkmk -u > %D';
$ps2pdf         = 'ps2pdf %O %S %D';
$pdf_mode       = 3;

$pdf_previewer  = 'evince';
$pvc_view_file_via_temporary = 0;

# https://texwiki.texjp.org/?Latexmk#qeabdd2c
