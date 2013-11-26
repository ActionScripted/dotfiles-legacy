# Some fun bash commands to NEVER forget:
#   !$ -- references the last path used (sort of...)
#   !! -- references the last command used

# term declaration
export EDITOR=vim
export TERM=xterm-256color
export LC_CTYPE=en_US.UTF-8

# From http://superuser.com/questions/260535/bash-color-shell-on-mac
export CLICOLOR=1

# mac backspace fixes
# stty erase 

# command aliases
alias flushdns="dscacheutil -flushcache"
alias gitstatus="~/Edification/bash/gitstatus.sh"
alias golden="python ~/Edification/python/golden_ratio.py"
alias grid="python ~/Edification/python/grid.py"
alias kill_mac_ui="killall Dock; killall Finder; killall SystemUIServer"
alias ls='ls -G'
alias macvim="open -a macvim "
alias pip_upgrade_all="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"
alias py='python'
alias snap_diff='diff -rw --strip-trailing-cr -q'
alias syn='synergys -f'
alias tree='tree -C'
alias untar='tar zxvf'
alias wget_folder="wget -np -r "
alias wget_site="wget -r -p -U Mozilla "
alias wget_site_fancy="echo wget -r -p --convert-links -U Mozilla -E -D \"www.site.com,site.com\" -H www.site.com"

alias mysql='/usr/local/mysql/bin/mysql'
alias mysql_config='/usr/local/mysql/bin/mysql_config'
alias mysqladmin='/usr/local/mysql/bin/mysqladmin'
alias mysqldump='/usr/local/mysql/bin/mysqldump'
alias mysqlrestart='sudo /usr/local/mysql/support-files/mysql.server restart'
alias mysqlstart='sudo /usr/local/mysql/support-files/mysql.server start'
alias mysqlstop='sudo /usr/local/mysql/support-files/mysql.server stop'

alias webstart='mysqlrestart; sudo apachectl restart'
alias webstop='mysqlstop; sudo apachectl stop'

# Functions
# ---

# Since we don't have "rename"...
# http://blog.commandlinekungfu.com/2009/04/episode-26-renaming-files-with-regular.html
function rename_for_web {
  for f in "$@";
    do mv -- "$f" "${f//[^-_.A-Za-z0-9]/-}";
  done
}

function check_http_status {
  curl -sL -w "%{http_code} %{url_effective}\n" -o /dev/null $1
}

function osx_mailbox_cleanup {
  # TODO: put a prompt in, to make sure mail is shut downi
  sqlite3 ~/Library/Mail/V2/MailData/Envelope\ Index vacuum;
}

function battery_percentage {
  # http://hints.macworld.com/article.php?story=20100130123935998
  ioreg -l | grep -i capacity | tr '\n' ' | ' | awk '{printf("%.2f%%", $10/$5 * 100)}'
}

function reset_file_permissions {
  echo "Recursively set files to 644, folders to 755 and remove extended attributes on:"
  echo "  $PWD"
  read -p "You sure? [Y/n] " -n 1 -r

  if [[ $REPLY =~ ^[Yy]$ ]] || [[ $REPLY = "" ]]; then
    echo "Setting folders to 755..."
    find . -type d -exec chmod 755 {} \;
    echo "Setting files to 644..."
    find . -type f -exec chmod 644 {} \;
    echo "Removing extended attributes..."
    xattr -rc .
    echo "Done"
  fi
}

function update_dev_shit {
  cmds=(
    #"sudo port selfupdate"
    #"sudo port upgrade outdated"
    "brew update"
    "brew upgrade"
    "npm cache clean -g"
    "npm update -g"
    "sudo gem update"
  )

  echo "Going to update Homebrew, Node, Ruby Gems and their friends:"
  for cmd in "${cmds[@]}"; do
    echo -e "\t${cmd}"
  done

  echo
  # -p: prompt, -n 1: auto-return after 1 char, -r safe backslashes
  read -p "That cool? [Y/n] " -n 1 -r
  # cursor on the next line please
  echo

  # $REPLY comes from the read command a few lines up, when you don't supply a name
  if [[ $REPLY =~ ^[Yy]$ ]] || [[ $REPLY = "" ]]; then

    # See ~/Edification/bash/arrays.sh for more
    for cmd in "${cmds[@]}"; do
      echo -e "\n==> ${cmd}"
      $cmd
      echo "---"
    done

    echo
    #echo "HEY! npm might be broken (macports!), fix: 'sudo port install -f npm'"
    #echo "...if it was broken, re-run this command once it's 'fixed'"

  else
    echo "Okay, nevermind. I was, uh, just kidding anyways."
  fi
}

# Need some local network information?
# arp -a
# ifconfig

# Doesn't work, (expansion, duh)
#function add_extension {
#  for f in "$2";
#    do mv "$f" "$f.$1";
#  done
#}

# show_colors() {
#   for i in $(eval echo {0..$(tput colors)}); do tput setab $i; echo -n "    ($i)"; done; tput setab 0; tput sgr0; echo
# }

# emoji () {
#   # alert: \342\232\240
#   # frown: \360\237\230\225
#   # shell: \360\237\220\232
#   # smile: \360\237\230\203
#   if [ $? -gt 0 ]; then
#     echo "\342\232\240 "
#   fi
# }

# Fancy / annoying prompt
# export PS1="[$(emoji)\D{%a %m/%d/%Y %I:%M%p} $(battery_percentage) \u@\h] $(tput bold)$(tput setaf 4)\w$(tput sgr0) \$ "

# Boring ol' prompt
#export PS1="[\u@\h:\w] \$ $(tput sgr0)"

# Homebrew
export PATH="/usr/local/bin:$PATH"
