MAIN = "main.pdf"

PHONY: all clean

all: $(MAIN)

$(MAIN): main.typ
	typst compile $< $@

clean:
	rm -f $(MAIN)