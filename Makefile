
YAML2JSON := yaml2json -p

%.json: %.yaml
	cat $< | $(YAML2JSON) | jq > $@

all: onepiece.json

clean:
	$(RM) onepiece.json
