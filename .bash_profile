export PATH="$HOME/.rbenv/bin:$PATH"
#export ANDROID_SDK_HOME=/Applications/adt-bundle-mac/sdk  # Android SDK's install path
export ANDROID_SDK_HOME=/usr/local/opt/android-sdk  # Android SDK's install path
export PATH=$ANDROID_SDK_HOME/tools:$ANDROID_SDK_HOME/platform-tools:$PATH
export ANDROID_NDK_HOME=/Applications/android-ndk-r8e  # Android NDK's install path
export PATH=$ANDROID_NDK_HOME:$PATH
export PATH=/Applications/Doxygen.app/Contents/Resources/:$PATH

#export NDK_PROJECT_PATH=/Applications/android-ndk-r8e
export STUDIO_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk
export ANDROID_HOME=/usr/local/opt/android-sdk

export GEM_HOME=~
export PATH=$GEM_HOME/bin:$PATH
export PATH=/Applications/CotEditor.app/Contents/MacOS/:$PATH

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# 自動補完
source ~/.git-completion.bash

# ブランチ名をbashに表示
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
GIT_PS1_SHOWDIRTYSTATE=true
PS1='\[\033[40;1;32m\]\u\[\033[2;32m\]@\[\033[0m\]\[\033[40;32m\]\h \[\033[1;36m\]\w \[\033[31m\]$(__git_ps1 "[%s]")\[\033[00m\] \[\033[0m\]\[\033[40;2;37m\]`date +"%Y/%m/%d %p %H:%M:%S"` \[\033[0m\]\n\\$ '
export PS1=$PS1

# 使用中bashの履歴数
export HISTSIZE=2000
# .bash_historyの履歴数 default=500
export HITSIZEFILESIZE=2000
# .bash_historyの重複記録を排除
export HISTCONTROL=ignoredups

# bash端末間で.bash_historyを共有 see http://iandeth.dyndns.org/mt/ian/archives/000651.html
#function share_history {
#    history -a
#    history -c
#    history -r
#}
#PROMPT_COMMAND='share_history'
#shopt -u histappend

# alias see http://yash.hateblo.jp/entry/2013/07/07/032228
alias gcommit_m='git commit -m'
alias gps='git push'
alias gpl='git pull'
alias ga='git add'
alias be='bundle exec'
alias berspec='bundle exec rspec'
alias gs='git status'
alias gl='git log'
alias gd='git diff'
alias gdh='git diff head'
alias berubocop='bundle exec rubocop -c config/rubocop.yml'
alias gateway1_login='ssh -A gateway1'
alias gba='git branch -a'
alias beturmeric_start_p3000='bundle exec foreman start -p 3000'
alias beturmeric_start_p3001='bundle exec foreman start -p 3001'
alias compilecheck='config/git_hooks/pre-commit'
alias check_rails_path='bundle exec rake routes'
alias top='top -u' # CPU使用率順
# alias kobito='/Applications/Kobito.app/Contents/MacOS/Kobito'

export PATH=~/.rbenv/shims:/Applications/CotEditor.app/Contents/MacOS/:~/bin:/Applications/Doxygen.app/Contents/Resources/:/Applications/android-ndk-r8e:/usr/local/opt/android-sdk/tools:/usr/local/opt/android-sdk/platform-tools:~/.rbenv/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Applications/eclipse/android/platform-tools
