#!/bin/bash
# ---
# dotfiles boostrap
#
# DON'T FREAK! It backs everything up to:
#   ~/.dotfiles.backups
#
# ...unless you've tampered with things


HOMEDIR=$HOME
BACKUPDIR="$HOMEDIR/.dotfiles.backups"
CURRENTDIR=$(pwd -P)
DOTFILEDIR="$CURRENTDIR/dotfiles"


backup_dotfile() {
  if [[ -e "$HOMEDIR/$1" ]]; then

    # Do we already have any backups? How many?
    # This needs some work. Doesn't handle things like
    # $BACKUPDIR/.vim* and $BACKUPDIR/.vimrc* well
    dotfile_count=$(find $BACKUPDIR/$1* -maxdepth 0 2> /dev/null | wc -l | sed 's/ //g')

    if [[ $dotfile_count -ne '0' ]]; then
      mv $HOMEDIR/$1 $BACKUPDIR/$1.$dotfile_count
    else
      mv $HOMEDIR/$1 $BACKUPDIR/$1
    fi
  fi
}

symlink_dotfile() {
  ln -s $DOTFILEDIR/$1 $HOMEDIR/$1
}


if [[ $SUDO_USER ]]; then
  echo "Running scripts you find on the internet as root is dangerous. Try again without 'sudo'."
  exit 1
fi


if [[ ! -e $BACKUPDIR ]]; then
  echo "Creating back ups folder $BACKUPDIR..."
  mkdir $BACKUPDIR
fi


dotfiles=$(ls -1 -A $DOTFILEDIR 2> /dev/null)

if [[ $dotfiles ]]; then
  echo "Symlinking dotfiles..."

  for dotfile in $dotfiles; do
    echo "$dotfile"
    backup_dotfile $dotfile
    symlink_dotfile $dotfile
  done

  echo "All set! Any existing files were moved to $BACKUPDIR"

else
  echo "You don't have anything in '$DOTFILEDIR', bro-tato"
fi
