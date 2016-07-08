files = title.md fonctionnement.md squarefree.md theory.md  references.md
pdf = report.pdf
tex = report.tex

engine = --latex-engine=xelatex
params = -s --listing --bibliography=biblio.bib --filter pandoc-citeproc

.PHONY: report
report:
	pandoc $(engine) $(params) $(files) -o $(pdf)

tex:
	pandoc $(engine) $(params) $(files) -o $(tex)

.PHONY: clean
clean:
	rm $(pdf) $(tex)

open: report
	evince $(pdf)

all: report
