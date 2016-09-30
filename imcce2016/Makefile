files = title.md intro.md basics.md modular.md hensel.md implem.md futur.md appendix.md references.md
pdf = report.pdf
tex = report.tex
other = *.aux *.log *.out *.toc

engine = --latex-engine=pdflatex
params = -s --template=template.tex --variable documentclass=report --listing --bibliography=biblio.bib --csl=ieee.csl --toc -N --filter pandoc-citeproc

dots = tree51.dot tree52.dot tree53.dot tree56.dot
dot_tex = res/tree*.tex

.PHONY: report
report:
	pandoc $(engine) $(params) $(files) -o $(pdf)

.PHONY: tex
tex:
	pandoc $(engine) $(params) $(files) -o $(tex)

debug: tex report

.PHONY: dot
dot: 
	$(foreach tree, $(dots), dot -Txdot res/$(tree) | dot2tex -ftikz -t math --figonly > res/$(basename $(tree)).tex;) 

.PHONY: clean
clean:
	rm $(pdf) $(tex)

clean_temp:
	rm $(other)

clean_dot:
	rm $(dot_tex)

.PHONY: open
open: report
	evince $(pdf)

.PHONY: template
template:
	pandoc -D latex > template.tex

.PHONY: all
all: dot open
