" VIM CONFIGURATION FILE

" Setup Vundle
if filereadable($HOME . "/.vimrc.bundles")
  source $HOME/.vimrc.bundles
endif

" Commands
set wildmenu                " Show tab completion options
set wildmode=list:longest   " Similar to shell matching

" Line Numbers
set number            " Show line numbers
set numberwidth=5     " Line numbers up to 5 characters

" Visual
set nowrap            " No line wrapping
set cc=80             " Column guide
set noshowmode        " Don't show default mode indicator
set ruler             " Alway show cursor position
set cursorline        " Show active line
set laststatus=2      " Always display the status line

" Editing
set tabstop=4         " Column size of tabs
set expandtab         " Tabs as spaces
set softtabstop=4     " Colums of tabs in insert mode
set shiftwidth=4      " Columns to indent by
set timeoutlen=50     " Quickly change modes
set encoding=utf-8    " Default encoding
set lazyredraw        " Don't redraw while executing macros
set ai                " Auto indent
set si                " Smart indent

" OS X Ten Key
map <Esc>Oq 1
map <Esc>Or 2
map <Esc>Os 3
map <Esc>Ot 4
map <Esc>Ou 5
map <Esc>Ov 6
map <Esc>Ow 7
map <Esc>Ox 8
map <Esc>Oy 9
map <Esc>Op 0
map <Esc>On .
map <Esc>OQ /
map <Esc>OR *
map <kPlus> +
map <Esc>OS -
map <Esc>OX =
map <Esc>OM <CR>
map! <Esc>Oq 1
map! <Esc>Or 2
map! <Esc>Os 3
map! <Esc>Ot 4
map! <Esc>Ou 5
map! <Esc>Ov 6
map! <Esc>Ow 7
map! <Esc>Ox 8
map! <Esc>Oy 9
map! <Esc>Op 0
map! <Esc>On .
map! <Esc>OQ /
map! <Esc>OR *
map! <kPlus> +
map! <Esc>OS -
map! <Esc>OX =
map! <Esc>OM <CR>

" File Handling
set nobackup          " Don't create backups
set autoread          " Automatically read externally edited files
set nowb              " Prevent automatic write backup
set noswapfile        " Don't keep a swap file
set bsdir=last        " Last working directory is default working directory

" Color Configuration
syntax on                     " Use syntax coloring
set background=dark           " Dark colorscheme
let base16colorspace=256      " Use 256 colors
set t_Co=256                  " Use 256 colors
colorscheme base16-tomorrow   " Colorscheme

" Airline
let g:airline_powerline_fonts = 1 " Use powerline fonts

" Local Configuration
if filereadable($HOME . "/.vimrc.local")
  source $HOME/.vimrc.local
endif

