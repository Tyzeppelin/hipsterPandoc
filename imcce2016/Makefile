files = steps.md references.md

pdf = report.pdf

report:
	pandoc -s --filter pandoc-citeproc $(files) -o report.pdf

.PHONY: clean
clean:
	rm $(pdf)

all:
	report
