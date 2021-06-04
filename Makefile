
YAML2JSON := yaml2json -p

TIMESTAMP = $(shell date +%s)

%.json: %.yaml
	cat $< | sed -E 's|@TIMESTAMP@|$(TIMESTAMP)|g' | $(YAML2JSON) | jq > $@

all: onepiece.json onepiece.yaml

clean:
	$(RM) onepiece.json
