" ==============================================================================
" VIM CONFIGURATION FILE
" ==============================================================================

" ------------------------------------------------------------------------------
" Vundle
" ------------------------------------------------------------------------------
if filereadable($HOME . "/.vimrc.bundles")
    source $HOME/.vimrc.bundles
endif

" ------------------------------------------------------------------------------
" Commands
" ------------------------------------------------------------------------------
set wildmenu                " Show tab completion options
set wildmode=list:longest   " Similar to shell matching

" ------------------------------------------------------------------------------
" Line Numbers
" ------------------------------------------------------------------------------
set number                  " Show line numbers
set numberwidth=5           " Line numbers up to 5 characters

" ------------------------------------------------------------------------------
" Visual
" ------------------------------------------------------------------------------
set nowrap                  " No line wrapping
set colorcolumn=80          " Column guide at 80 characters
set noshowmode              " Don't show default mode indicator
set ruler                   " Alway show cursor position
set cursorline              " Show active line
set laststatus=2            " Always display the status line

" ------------------------------------------------------------------------------
" Editing
" ------------------------------------------------------------------------------
set tabstop=4               " Column size of tabs
set hidden                  " Enable background buffer
set backspace=2             " Backspace over indent, eol, start in insert mode
set expandtab               " Tabs as spaces
set softtabstop=4           " Colums of tabs in insert mode
set shiftwidth=4            " Columns to indent by
set shiftround              " Always align indents to shift width
set timeoutlen=50           " Quickly change modes
set encoding=utf-8          " Default encoding
set lazyredraw              " Don't redraw while executing macros
set autoindent              " Auto indent
set smartindent             " Smart indent
set noerrorbells            " Turn off error bells
set visualbell              " Enable visual bell...
set t_vb=                   " ...then set it to nothing (off)
set updatetime=250          " Shorten delay between updates
set foldmethod=syntax       " Use syntax mode for folding
set foldlevelstart=99       " Manually close folds

" ------------------------------------------------------------------------------
" Searching
" ------------------------------------------------------------------------------
set hlsearch                " Highlight search results
set incsearch               " Dynamically as typed

" ------------------------------------------------------------------------------
" File Handling
" ------------------------------------------------------------------------------
set nobackup                " Don't create backups
set nowritebackup           " Prevent automatic write backup
set noswapfile              " Don't keep a swap file
set bsdir=last              " Last working directory is default working directory

" ------------------------------------------------------------------------------
" Color Configuration
" ------------------------------------------------------------------------------
syntax on                   " Use syntax coloring
set background=dark         " Dark colorscheme
let base16colorspace=256    " Use 256 colors
set t_Co=256                " Use 256 colors
colorscheme base16-tomorrow " Colorscheme


" ==============================================================================
" PLUGIN-SPECIFIC CONFIGURATION
" ==============================================================================

" ------------------------------------------------------------------------------
" EditorConfig
" ------------------------------------------------------------------------------
let g:EditorConfig_exclude_patterns = ['fugitive://.*'] " Be nice to Fugitive
let g:EditorConfig_exclude_patterns = ['scp://.*']      " Nothing over SSH

" ------------------------------------------------------------------------------
" GitGutter
" ------------------------------------------------------------------------------
let g:gitgutter_enabled = 0     " Off by default, explicitly enable

" ------------------------------------------------------------------------------
" YouCompleteMe
" ------------------------------------------------------------------------------
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
" ------------------------------------------------------------------------------
" vim-go
" ------------------------------------------------------------------------------
let g:go_fmt_experimental=1         " Enable experimental features
                                    " to hopefully maintain folds on save

" ------------------------------------------------------------------------------
" Indent Guides
" ------------------------------------------------------------------------------
autocmd VimEnter * call s:CheckTabStyle()       " This might be overkill...
autocmd WinEnter * call s:CheckTabStyle()       " But we'll see how it
autocmd BufReadPost * call s:CheckTabStyle()    " handles multiple buffers

" Use different indent guides based on indent style
function! s:CheckTabStyle()
    if &expandtab
                                                " For tabs as spaces
        :IndentGuidesEnable                     " Use IndentGuides plugin
        highlight IndentGuidesOdd  ctermbg=18   " Gray
        highlight IndentGuidesEven ctermbg=18   " Gray
        let g:indent_guides_guide_size = 1      " Skinny guides
        let g:indent_guides_auto_colors = 0     " Use above forced colors
        let g:indent_guides_start_level = 2     " Only show after second indent
    else
                                                " For tabs as tabs
        :IndentGuidesDisable                    " Turn off IndentGuides plugin
        set list lcs=tab:│\                     " Mind the space
        highlight FirstIndent  ctermfg=0        " First indent hidden
        highlight OtherIndents ctermfg=19       " Gray
        let w:m1=matchadd('FirstIndent', '^\t', -1)
        let w:m2=matchadd('OtherIndents', '\(^\t\)\@!\t', -1)

        " Other methods for persistence?
        "autocmd VimEnter * autocmd WinEnter * let w:created=1
        "autocmd VimEnter * let w:created=1
        "autocmd WinEnter * if !exists('w:created') | 
        "   \ let w:m1=matchadd('FirstIndent', '^\t', -1) | 
        "   \ endif
        "autocmd WinEnter * if !exists('w:created') | 
        "   \ let w:m2=matchadd('OtherIndents', '\(^\t\)\@!\t', -1) | 
        "   \ endif
    endif
endfunction


" ------------------------------------------------------------------------------
" Airline
" ------------------------------------------------------------------------------
let g:airline_theme='base16'                    " Force theme
let g:airline_powerline_fonts = 1               " Use powerline fonts
let g:airline_skip_empty_sections = 1           " Don't show empty sections
let g:airline#extensions#syntastic#enabled = 1  " Integrate Syntastic

" Customize Right Side Display
let g:airline_section_x = ''
let g:airline_section_y = '%{airline#util#wrap(airline#parts#filetype(),0)}'
" Previously %{airline#util#wrap(airline#parts#ffenc(),0)}
let g:airline_section_z = '%{g:airline_symbols.linenr}%\ %l:%-2v %{g:airline_symbols.maxlinenr}%\ %L'

" Shorten Modes Display
let g:airline_mode_map = {
    \ '__' : '-', 'n'  : 'N', 'i'  : 'I', 'R'  : 'R',
    \ 'c'  : 'C', 'v'  : 'V', 'V'  : 'V', '' : 'V',
    \ 's'  : 'S', 'S'  : 'S', '' : 'S'}


" ==============================================================================
" OS X Ten Key Fix
" ==============================================================================

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


" ==============================================================================
" Local Configuration
" ==============================================================================

if filereadable($HOME . "/.vimrc.local")
    source $HOME/.vimrc.local
endif

