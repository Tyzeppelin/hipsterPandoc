files = steps.md references.md
pdf = report.pdf

params = -s --listing --filter pandoc-citeproc


report:
	pandoc $(params) $(files) -o $(pdf)

tex:
	pandoc $(params) $(files) -o report.tex

.PHONY: clean
clean:
	rm $(pdf)

open: report
	evince $(pdf)

all: report
