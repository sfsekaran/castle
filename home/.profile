
# MacPorts Installer addition on 2010-04-08_at_00:41:07: adding an appropriate PATH variable for use with MacPorts.
# export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=$PATH:/opt/jruby/bin:/usr/local/mysql/bin

# aliases
alias mate=/opt/local/bin/mate
alias g=git
# Use gnu sed instead of the sed that comes with OSX.
#alias sed=gsed
alias ll="ls -al"

# Colorize prompt
export PS1="\[\e[34;1m\]\u\[\e[33;1m\]@\[\e[32;1m\]\H\[\e[31;1m\]> \[\e[0m\]"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

## NGINX ##
alias nginx='sudo /usr/local/nginx/sbin/nginx'
alias stopnginx='sudo /usr/local/nginx/sbin/nginx -s stop'
export RUBY_HEAP_MIN_SLOTS=3000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

# Profounder Shtuff
export PAPERCLIP_COMMAND_PATH=/opt/local/bin
