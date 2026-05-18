#!/usr/bin/env fish

set script_dir (dirname (status --current-filename))
set project_dir (dirname $script_dir)

echo "Watching CSS-Files in: $project_dir/src/css"
echo "Changes are being built in dist/custom.css automatically."
echo "Deploy is manuell."
echo "Ctrl+c to end."

$script_dir/build-css.fish

while true
    inotifywait -e modify,create,delete,move "$project_dir/src/css" >/dev/null 2>&1

    echo "Change noticed. New CSS was built."
    $script_dir/build-css.fish
end
