#!/bin/bash

for i in 1 2 3 4 5 6 7 8; do
  echo "Saving workspace $i" 
  i3-save-tree --workspace $i > ~/.config/i3/workspaces/w$i.json
done
