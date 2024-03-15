# tmux - terminal multiplexer

Keep in mind, there is one tmux server that can have multiple sessions.
Every session can have multiple windows.
And every window can have multiple panes.

`tmux-server -> sessions -> windows -> panes`

Run `tmux` in the terminal to start a tmux server. 
Note that you can not start a tmux server in a tmux server.

If no server is running already then it will spin up one and open a pane on a window on a session on the server.

`C-d` writes an EOF (end of line) to stdin, which closes the shell.

`tmux list-sessions` will list all sessions running on the server.

`tmux kill-server` will kill the server.

`tmux a` will attach to the server.

`tmux new-session -d` will start a new detached session.
Note creating a session in an already existing session won't work.
The -d flag will spawn a new session and we will keep beeing attached to our old session.

`tmux new-window` or `<prefix>-c` will create a new window on a session.
`tmux list-windows` will list all the windows of the attached session.

## Prefix key

The prefix key will tell the tmux-server to go into the command mode and treat the next input character as a commmand.

The default prefix key is `C-b` (at linux).

## Navigation between sessions

Usually you do not need this but for the record:

`<prefix>-(` will go to the next session
`<prefix>-)` will go to the prev session

## Navigation between windows

`<prefix>-n` will go to the next window
`<prefix>-v` will go to the prev window
`<prefix>-1` will go to the first window

## Nice stuff

For Session
`tmux new-session -d -s "foo"` will create a detached session with name foo.
`<prefix>-w` will show an extended list of all sessions and the windows.

For Windows

`tmux new-session -n "foofoo"` will create a window with name foofoo.

## Pain

We do not use paines but if you do:

`<prefix>-%` will split the window (pain) in a half, or better said into two pains on a window.

## Did you know?

You can open a session for a specific path!
`tmux new-session -s "foobar" -d -c "$HOME/personal/dev-productivity"` 

You can open a window for a specific path!
`tmux new-window -n "foobar" -c "$HOME/personal"` 

You can switch to a session by name!
`tmux switch-client -t "foobar"`

You can run a command right away when creating a window
`tmux new-window -n "foobar" [some command goes here]`

READ THE FUCKING MANUAL!
`man tmux`

## Special candy

Usability Tip
`<prefix>-[` goes into vi mode

This for the copy/paste in tmuxrc

```
set-window-option -g mode-keys vi
bind -T copy-mode-vi v send-keys -X begin-selection
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'
```