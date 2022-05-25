#!/bin/bash

#for $i 1 2 3 4 5 8; do
#  exec --no-startup-id "i3-msg 'workspace $i; append_layout ~/.config/i3/workspaces/w$i.json'";
#done
exec --no-startup-id "i3-msg 'workspace 1; append_layout ~/.config/i3/workspaces/w1.json'"
exec --no-startup-id "i3-msg 'workspace 2; append_layout ~/.config/i3/workspaces/w2.json'"
exec --no-startup-id "i3-msg 'workspace 3; append_layout ~/.config/i3/workspaces/w3.json'"
exec --no-startup-id "i3-msg 'workspace 4; append_layout ~/.config/i3/workspaces/w4.json'"
exec --no-startup-id "i3-msg 'workspace 5; append_layout ~/.config/i3/workspaces/w5.json'"
exec --no-startup-id "i3-msg 'workspace 8; append_layout ~/.config/i3/workspaces/w8.json'"
