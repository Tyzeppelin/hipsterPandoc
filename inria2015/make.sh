pandoc --latex-engine=xelatex -H preamble.tex -V fontsize=12pt -V documentclass:book -V papersize:a4paper -V classoption:openright --chapters *.md -o "inria2015.pdf"

echo "done"
