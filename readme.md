# Sound

LANG=C pactl list | grep -A2 'Sink #' | grep Name: | cut -d" " -f2
