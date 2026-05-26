#!/bin/zsh
fswatch -o /Users/rizky/.zshrc /Users/rizky/.zsh/ | xargs -n1 -I {} echo "file changed"
