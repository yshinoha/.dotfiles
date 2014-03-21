# zshが存在する場合
if [[ -s /bin/zsh ]] ; then
	# shellをzshに変更
    exec /bin/zsh
else
  # zshが存在せず、.bashrcが存在する場合は、bashrcを読み込む
  if [[ -s ~/.bashrc ]] ; then
    . ~/.bashrc
  fi
fi
