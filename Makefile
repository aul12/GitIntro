RUBBER=rubber
DOT=dot
VIEWER=xdg-open
SCREEN=screen
PRESENTER=pdfpc

all: main.pdf

main.pdf: *.tex graph.pdf branch.pdf flow.pdf
	$(RUBBER) --unsafe -d main.tex

%.pdf: %.dot
	$(DOT) -T pdf -o $@ $<

show: main.pdf
	$(SCREEN) -dm $(VIEWER) main.pdf 2> /dev/null
	
present: main.pdf
	$(PRESENTER) main.pdf

clean:
	rm -f *.toc
	rm -f *.aux
	rm -f *.log
	rm -f *.out
	rm -f *.bbl  
	rm -f *.blg  
	rm -f *-blx.bib  
	rm -f *.fdb_latexmk
	rm -f *.xml
	rm -f *.bcf
	rm -f build.png
	rm -rf _minted-main
	rm -f *.snm
	rm -f *.nav
	rm -f *.vrb

clean_all: clean
	rm -f *.pdf
	rm -f *.pdfpc
