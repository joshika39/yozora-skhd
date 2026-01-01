#!/usr/bin/env sh

idx="$(yabai -m query --displays | jq -r '
  sort_by(.frame.x) as $d
  | ($d | map(."has-focus") | index(true)) as $i
  | ($d | length) as $n
  | $d[((($i - 1) + $n) % $n)].index
')"

[ -n "$idx" ] && yabai -m display --focus "$idx"
