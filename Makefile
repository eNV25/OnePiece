
TOML2JSON := toml2json -p

TIMESTAMP = $(shell date +%s)

%.json: %.toml
	sed -i -E '/^[[:space:]]*[^#]/s/@TIMESTAMP@/$(TIMESTAMP)/g' $<
	cat $< | $(TOML2JSON) | jq > $@

all: onepiece.json

clean:
	$(RM) onepiece.json
