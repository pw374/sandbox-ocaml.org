

all:html-pages/static
	bash gen.bash md-pages

html-pages/%.html:md-pages/%.md Makefile
	omd < "$<" > "$@.tmp"
	mpp -so '((!' -sc '!))' -son '{{!' -scn '!}}' -soc '' -scc '' -sec '' -its -set "page=$@.tmp" < main_tpl.mpp > "$@"
	rm "$@.tmp"

html-pages/img:skin/img
	rm -fr "$@"
	mkdir -p html-pages
	cp -a "$<" "$@"

html-pages/static:skin/static
	rm -fr "$@"
	mkdir -p html-pages
	cp -a "$<" "$@"

html-pages/static/css:skin/static/css
	rm -fr html-pages/static
	make html-pages/static
html-pages/static/img:skin/static/img
	rm -fr html-pages/static
	make html-pages/static

clean:
	rm -fr html-pages *~
