pandoc --latex-engine=xelatex -H preamble.tex -V fontsize=12pt -V documentclass:book -V papersize:a4paper -V classoption:openright couv.md fortuneo.md stateofart.md newreal.md conclusion.md resume.md -o "pdffortuneo.pdf"

echo "done"
