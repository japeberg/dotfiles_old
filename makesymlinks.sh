#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc"    # list of files/folders to symlink in homedir
i3_config=".config/i3"
##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

echo "Moving i3-config from ~ to $olddir"
mv ~/$i3_config/config $olddir/i3-config
mv ~/$i3_config/i3status.conf $olddir/i3status.conf
echo "Creating symlink to i3-config in home directory."
ln -s $dir/i3-config ~/$i3_config/config
ln -s $dir/i3status.conf ~/$i3_config/i3status.conf
