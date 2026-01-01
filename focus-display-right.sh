#!/usr/bin/env sh

id="$(yabai -m query --displays | jq -r '
  sort_by(.frame.x) as $d
  | ($d | map(."has-focus") | index(true)) as $i
  | ($d | length) as $n
  | $d[(($i + 1) % $n)].id
')"

[ -n "$id" ] && yabai -m display --focus "$id"
