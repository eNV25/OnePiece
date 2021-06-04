
YAML2JSON := yaml2json -p

TIMESTAMP = $(shell date +%s)

%.json: %.yaml
	sed -i 's|@TIMESTAMP@|$(TIMESTAMP)|g' $<
	cat $< | $(YAML2JSON) | jq > $@

all: onepiece.json onepiece.yaml

clean:
	$(RM) onepiece.json
