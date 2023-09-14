#!/bin/bash
trap -- 'rm -rf "${temps[@]}"' 0
manga="$(mktemp)"
temps+=("$manga")
curl -sSL 'https://onepiecechapters.com/mangas/5/one-piece' >"$manga"
sum="$(mktemp)"
temps+=("$sum")
for n in $(seq "$@"); do
	chapter="$(mktemp)"
	temps+=("$chapter")
	curl -sSL "$(htmlq "main div div div div a:nth-last-child($n)" -a href -b https://onepiecechapters.com <"$manga")" >"$chapter"
	title="$(htmlq "main div div div div a:nth-last-child($n) div:nth-child(2)" -t <"$manga")"
	if [ -z "$title" ]; then
		title="$n"
	fi
	htmlq 'picture img' -a src <"$chapter" | jq -n -R --arg n "$n" --arg title "$title" '{ ($n): { $title, groups: { tcbscans: [inputs] } } }'
done >"$sum"
jq -s 'add' "$sum"
