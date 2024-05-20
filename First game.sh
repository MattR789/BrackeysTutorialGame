#!/bin/sh
echo -ne '\033c\033]0;First game\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/First game.x86_64" "$@"
