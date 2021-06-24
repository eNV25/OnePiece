
# pipx install remarshal
YAML2JSON := yaml2json -p

TIMESTAMP = $(shell date +%s)

%.json: %.yaml
	sed -i -E '/^[[:space:]]*[^#]/s/@TIMESTAMP@/$(TIMESTAMP)/g' $<
	cat $< | $(YAML2JSON) | jq > $@

all: onepiece.json

clean:
	$(RM) onepiece.json
