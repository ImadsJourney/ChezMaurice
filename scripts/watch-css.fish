#!/usr/bin/env fish

echo "Beobachte src/css/*.css ..."
echo "Drücke Ctrl+C zum Beenden."

./scripts/build-css.fish

while true
    inotifywait -e modify,create,delete,move src/css >/dev/null 2>&1
    ./scripts/build-css.fish
end
