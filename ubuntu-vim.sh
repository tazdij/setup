#!/bin/bash

# This script will install and configure vim on an ubuntu 16.04+ machine, and mabye some ubuntu based
# It will install dein and configure it how I like it, with a theme and some shortcuts and plugins
# this script is not built for flexibility, but for me to be able to get Vim how I want on a machine
# quickly, without trying to remember all the settings or even what plugins I like.


# We need git and vim
sudo apt update && sudo apt install -y git vim curl

# We need to obtain and run the dein install
#curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh  # OLD Install from main (Main has new install procedure)
#curl https://raw.githubusercontent.com/Shougo/dein.vim/release/bin/installer.sh > installer.sh
curl https://raw.githubusercontent.com/Shougo/dein-installer.vim/main/installer.sh > installer.sh

# Run installer and clean installer file
sh ./installer.sh ~/.cache/dein; rm ./installer.sh


# Put this into our vimrc file

cat > ~/.vimrc <<-EOF
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=${HOME}/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " My plugins
  call dein#add('itchyny/lightline.vim')
  call dein#add('miyakogi/conoline.vim')
  call dein#add('miyakogi/slateblue.vim')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('kien/ctrlp.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


" Line Numbers & Native Feature Settings
set number
set tabstop=4

" STATUS BAR
set laststatus=2

if !has('gui_running')
  set t_Co=256
endif

set noshowmode

" COLOR SCHEME
:colorscheme slateblue

" Indent Visual
let g:indent_guides_enable_on_vim_startup = 1

" Tabbed Editing Shortcuts
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" WhiteSpace visibility?
set list
set listchars+=tab:>-,space:.

EOF


