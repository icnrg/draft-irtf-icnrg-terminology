NAME = draft-irtf-icnrg-terminology
REVISION = 01

PANDOC = pandoc

SOURCES = $(wildcard *.md)

SHOW_FORMAT = html

all: build $(NAME)-$(REVISION).txt $(NAME)-$(REVISION).html

build:
	mkdir build

build/template.xml: template.xml
	sed -e "s/@@REVISION@@/$(REVISION)/g" template.xml > build/template.xml

build/%.xml: %.md build/template.xml
	pandoc -t docbook -s $< | xsltproc --nonet transform.xsl - > $@

$(NAME)-$(REVISION).txt: $(addprefix build/,$(SOURCES:.md=.xml))
	xml2rfc -o $@ --text build/template.xml

$(NAME)-$(REVISION).html: $(addprefix build/,$(SOURCES:.md=.xml))
	xml2rfc -o $@ --html build/template.xml

clean:
	rm -Rf build $(NAME)-$(REVISION).*

view: show

show: $(NAME)-$(REVISION).$(SHOW_FORMAT)
	open $(NAME)-$(REVISION).$(SHOW_FORMAT)
