pandoc --latex-engine=xelatex -H preamble.tex -V fontsize=12pt -V documentclass:book -V classoption:oneside -V papersize:a4paper -V classoption:openright\
    --chapters couv.md remerciements.md toc.md presentation.md sota.md meh.md conclusion.md resume.md -o "inria2015.pdf"

echo "done"
