# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

#local bin before usr bin
export PATH=/opt/local/bin:~/bin/:/usr/local/bin/:/usr/local/Cellar/ruby/1.9.3-p0/bin:$PATH

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="butterfly-air"
# export ZSH_THEME="muse"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

[[ -s "/Users/brandonwang/.rvm/scripts/rvm" ]] && source "/Users/brandonwang/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# set the number of open files to be 1024
ulimit -S -n 1024

#ec2 stuff
export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY=pk-AIROK4X6EG7TILF5262H7YISMNEKLBUT.pem
export EC2_CERT=cert-AIROK4X6EG7TILF5262H7YISMNEKLBUT.pem
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
export RMANTREE=/Applications/Pixar/RenderMan.app/Versions/RenderManProServer-15.2/

#ssh aliases
alias sshhome="ssh -p 9000 brandonwang.no-ip.org"
alias vnchome="open vnc://brandonwang.no-ip.org"

