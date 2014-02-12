if [[ -s /bin/zsh ]] ; then
    exec /bin/zsh
else
  if [[ -s ~/.bashrc ]] ; then
    . ~/.bashrc
  fi
fi
