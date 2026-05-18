#!/usr/bin/env fish

set plugin_dir (dirname (dirname (status --current-filename)))

mkdir -p "$plugin_dir/dist"

cat "$plugin_dir"/src/css/*.css >"$plugin_dir/dist/custom.css"

echo "CSS wurde gebaut: dist/custom.css"
