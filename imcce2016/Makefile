files = title.md intro.md basics.md modular.md hensel.md implem.md futur.md references.md
pdf = report.pdf
tex = report.tex
other = *.aux *.log *.out *.toc

engine = --latex-engine=pdflatex
params = -s --template=template.tex --variable documentclass=report --listing --bibliography=biblio.bib --toc -N --filter pandoc-citeproc

.PHONY: report
report:
	pandoc $(engine) $(params) $(files) -o $(pdf)

tex:
	pandoc $(engine) $(params) $(files) -o $(tex)

debug: tex report

.PHONY: clean
clean:
	rm $(pdf) $(tex)

clean_temp:
	rm $(other)

open: report
	evince $(pdf)

template:
	pandoc -D latex > template.tex

all: report
