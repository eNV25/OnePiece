
# pipx install remarshal
YAML2JSON := yaml2json --preserve-key-order --indent-json 2

TIMESTAMP = $(shell date +%s)

%.json: %.yaml
	sed --in-place '/#.*@TIMESTAMP@/!s/@TIMESTAMP@/$(TIMESTAMP)/g' $<
	$(YAML2JSON) < $< > $@

all: onepiece.json onepiece_cover.json

clean:
	$(RM) onepiece.json
