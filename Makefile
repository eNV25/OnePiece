
YAML2JSON := yaml2json -p

TIMESTAMP = $(shell date +%s)

%.json: %.yaml
	cat $< | $(YAML2JSON) | jq > $@

%.yaml: %.yaml.in
	cat $< | sed -E 's|@TIMESTAMP@|$(TIMESTAMP)|g' > $@

all: onepiece.json onepiece.yaml

clean:
	$(RM) onepiece.json
