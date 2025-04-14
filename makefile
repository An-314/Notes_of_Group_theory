MAIN = "main.pdf"

PHONY: all 

all: $(MAIN)

$(MAIN): main.typ
	typst compile $< $@

clean:
	rm -f $(MAIN)