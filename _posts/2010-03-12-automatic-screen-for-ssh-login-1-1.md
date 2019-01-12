---
title: Automatic Screen for SSH Login
date: 2010-03-12 00:00:00 Z
categories:
- geek
- linux
- bash
layout: post
---

Add the following to the end of your `~/.bashrc` file and you'll always be in a screen session when you SSH into your box.

``` bash
#======================================================================
# Auto-screen invocation. see: http://taint.org/wk/RemoteLoginAutoScreen
# if we're coming from a remote SSH connection, in an interactive session
# then automatically put us into a screen(1) session.   Only try once
# -- if $STARTED_SCREEN is set, don't try it again, to avoid looping
# if screen fails for some reason.
if [ "$PS1" != "" -a "${STARTED_SCREEN:-x}" = x -a "${SSH_TTY:-x}" != x ]
then
  STARTED_SCREEN=1 ; export STARTED_SCREEN
  [ -d $HOME/lib/screen-logs ] || mkdir -p $HOME/lib/screen-logs
  sleep 1
  screen -x && clear && exit 0
  if [ "$?" != "0" ]; then
    screen && clear && exit 0
  fi
  # normally, execution of this rc script ends here...
  echo "Screen failed! continuing with normal bash startup"
fi
# [end of auto-screen snippet]
# ======================================================================
```

Replace `screen` with `byobu` if you use that.

Remember to use `^a-d` to disconnect from your SSH session.
