html_files=$(patsubst %.md, %.html, $(wildcard *.md))
css=templates/pandoc.css

default: $(html_files)

%.html: %.md $(css)
	pandoc --standalone --css=$(css) \
		--from markdown --to html \
		--include-in-header=templates/header.html \
		-o $@ $<

