files = theory.md squarefree.md  references.md
pdf = report.pdf
tex = report.tex

params = -s --listing --filter pandoc-citeproc


report:
	pandoc $(params) $(files) -o $(pdf)

tex:
	pandoc $(params) $(files) -o $(tex)

.PHONY: clean
clean:
	rm $(pdf) $(tex)

open: report
	evince $(pdf)

all: report
