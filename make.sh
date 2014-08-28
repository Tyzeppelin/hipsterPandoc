pandoc --latex-engine=xelatex -H preamble.tex -V fontsize=12pt -V documentclass:book -V papersize:a4paper -V classoption:openright --chapters couv.md remerciement.md toc.md fortuneo.md stateofart.md newreal.md conclusion.md resume.md appendix.md -o "pdffortuneo.pdf"

echo "done"
