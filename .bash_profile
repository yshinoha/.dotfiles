[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

## rbenv
#
if [[ -s /opt/boxen/rbenv/bin ]] ; then
    rbenv global 2.0.0-p247
    rbenv version | sed -e 's/ .*//'
fi

## nodenv
#
if [[ -s /opt/boxen/nodenv/bin ]] ; then
    nodenv global v0.10
    nodenv version | sed -e 's/ .*//'
fi
