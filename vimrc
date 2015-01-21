
" Setup Vundle
if filereadable($HOME . "/.vimrc.bundles")
  source $HOME/.vimrc.bundles
endif

" Line Numbers
set number            " Show line numbers
set numberwidth=5     " Line numbers up to 5 characters

" Visual
set ruler             " Alway show cursor position
set laststatus=2      " Always display the status line

" Color Configuration
syntax on
set background=dark
colorscheme base16-tomorrow

" Setup
set encoding=utf-8

" Local Configuration
if filereadable($HOME . "/.vimrc.local")
  source $HOME/.vimrc.local
endif
