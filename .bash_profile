if [[ -s /bin/zsh ]] ; then
    /bin/zsh
else
  if [[ -s ~/.bashrc ]] ; then
    . ~/.bashrc
  fi
fi
