pandoc --latex-engine=pdflatex -V fontsize=12pt -V documentclass:paper -V papersize:a4paper -V classoption:openright fortuneo.md realisation.md planning.md -o "pdffortuneo.pdf"

echo "done"
