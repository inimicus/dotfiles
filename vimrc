" ==============================================================================
" VIM CONFIGURATION FILE
" ==============================================================================

" ------------------------------------------------------------------------------
" Vundle
" ------------------------------------------------------------------------------
if filereadable($HOME . "/.vimrc.bundles")
    source $HOME/.vimrc.bundles
endif

let mapleader="\<space>"    " Take me to space, I wanna go to space!

" ------------------------------------------------------------------------------
" Commands
" ------------------------------------------------------------------------------
" Reload vimrc
nmap <silent> <leader>vrc :so $MYVIMRC<cr>
" Get commit history of current buffer
command History !git --no-pager log --topo-order '--date=short' '--pretty=format:\%C(blue)\%ad\%C(reset) \%C(green)\%h\%C(reset)\%<|(38) \%aN :: \%s\%C(red)\%d\%C(reset)' -- %

" ------------------------------------------------------------------------------
" Command Menu
" ------------------------------------------------------------------------------
set wildmenu                " Show tab completion options
set wildmode=list:longest   " Similar to shell matching

" ------------------------------------------------------------------------------
" Color Configuration
" ------------------------------------------------------------------------------
syntax on                   " Use syntax coloring
set background=dark         " Dark colorscheme
let base16colorspace=256    " Use 256 colors
set t_Co=256                " Use 256 colors
colorscheme base16-tomorrow " Colorscheme

" ------------------------------------------------------------------------------
" Line Numbers
" ------------------------------------------------------------------------------
set number                  " Show line numbers
set numberwidth=5           " Line numbers up to 5 characters

" ------------------------------------------------------------------------------
" Visual
" ------------------------------------------------------------------------------
set splitbelow              " Horizontal windows split below
set nowrap                  " No line wrapping
set colorcolumn=80          " Column guide at 80 characters
set noshowmode              " Don't show default mode indicator
set ruler                   " Alway show cursor position
set cursorline              " Show active line
hi clear cursorlinenr       " Clear underlines
hi CursorLineNr ctermbg=19
hi CursorLine term=none ctermbg=18 guibg=Grey40
set laststatus=2            " Always display the status line
" Hide cursorline for inactive buffers
augroup CursorLine
    au!
    au WinLeave * setlocal nocursorline
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
augroup End

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
set timeoutlen=750          " Short timeouts
set ttimeoutlen=100         " Quickly change modes
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
if &diff
    " Ignore whitespace in diff
    set diffopt+=iwhite
endif

" ------------------------------------------------------------------------------
" Searching
" ------------------------------------------------------------------------------
set ignorecase              " Ignore case when searching
set smartcase               " Ignore above setting if pattern contains uppercase
set hlsearch                " Highlight search results
set incsearch               " Dynamically as typed
" Normal mode search text under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" Visual mode search text selection
vnoremap K y:grep! "\b<C-R>"\b"<CR>:cw<CR>

" ------------------------------------------------------------------------------
" File Handling
" ------------------------------------------------------------------------------
set nobackup                " Don't create backups
set nowritebackup           " Prevent automatic write backup
set noswapfile              " Don't keep a swap file
set bsdir=last              " Last working directory is default working directory


" ==============================================================================
" PLUGIN-SPECIFIC CONFIGURATION
" ==============================================================================

" ------------------------------------------------------------------------------
" Commentary
" ------------------------------------------------------------------------------
autocmd FileType php setlocal commentstring=//\ %s  " PHP comments as //

" ------------------------------------------------------------------------------
" CtrlP
" ------------------------------------------------------------------------------
if executable('rg')
    "set grepprg=rg\ -n\ --files\ --hidden\ --glob\ \"\"
    set grepprg=rg\ -n
    let g:ctrlp_user_command = 'rg %s --files --hidden --glob ""'
    let g:ctrlp_use_caching = 0                 " Do not cache
endif

" Interactively search tag under cursor
map <silent> <leader>jd :CtrlPTag<cr><C-\>w

" Show buffers interactively
nnoremap <tab> :CtrlPBuffer<cr>

let g:ctrlp_lazy_update = 1
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ }

" ------------------------------------------------------------------------------
" EditorConfig
" ------------------------------------------------------------------------------
let g:EditorConfig_exclude_patterns = ['fugitive://.*'] " Be nice to Fugitive
let g:EditorConfig_exclude_patterns = ['scp://.*']      " Nothing over SSH

" ------------------------------------------------------------------------------
" GitGutter
" ------------------------------------------------------------------------------
let g:gitgutter_enabled = 0     " Off by default
command GGT GitGutterToggle

" ------------------------------------------------------------------------------
" Gutentags
" ------------------------------------------------------------------------------
let g:airline#extensions#gutentags#enabled = 1
let g:gutentags_cache_dir = '~/.tags'
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.json', '*.xml',
                                \ '*.phar', '*.ini', '*.rst', '*.md',
                                \ '*vendor/*/test*', '*vendor/*/Test*',
                                \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                                \ '*var/cache*', '*var/log*']

" ------------------------------------------------------------------------------
" YouCompleteMe
" ------------------------------------------------------------------------------
"let g:loaded_youcompleteme = 1
" set completeopt-=preview            " Don't show preview pane when completing
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_filetype_blacklist = {
      \ 'gitcommit': 1,
      \ 'tagbar': 1,
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'netrw': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'mail': 1
      \}

" ------------------------------------------------------------------------------
" Tagbar
" ------------------------------------------------------------------------------
let g:tagbar_compact = 1
command TT TagbarToggle

" ------------------------------------------------------------------------------
" UltiSnips
" ------------------------------------------------------------------------------
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:ultisnips_php_scalar_types = 1
let g:snips_author = "Garret Jennings"

" ------------------------------------------------------------------------------
" NERDTree
" ------------------------------------------------------------------------------
let g:NERDTreeMinimalUI = 1

" ------------------------------------------------------------------------------
" Tsuquyomi
" ------------------------------------------------------------------------------
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

" ------------------------------------------------------------------------------
" vim-php-cs-fixer
" ------------------------------------------------------------------------------
let g:php_cs_fixer_rules = '{
            \ "@Symfony": true,
            \ "concat_space": {"spacing": "one"},
            \ "single_quote": false,
            \ "no_break_comment": {"comment_text": "No break"}
            \ }'

" ------------------------------------------------------------------------------
" vim-go
" ------------------------------------------------------------------------------
let g:go_fmt_experimental=1         " Enable experimental features
                                    " to hopefully maintain folds on save
let g:go_fmt_command = "goimports"  " Auto import packages
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

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
let g:airline#extensions#branch#displayed_head_limit = 15   " Limit branch length

" Change symbols behaving badly
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Lightning bolt misbehaving (⚡)
"let g:airline_symbols.dirty=' ⚙'

"let g:airline_section_b = '%{gutentags#statusline()}'
" Customize Right Side Display
let g:airline_section_x = ''
let g:airline_section_y = '%{airline#util#wrap(airline#parts#filetype(),0)}'
" Previously %{airline#util#wrap(airline#parts#ffenc(),0)}
let g:airline_section_z = '%{g:airline_symbols.linenr}%\%l:%-2v%{g:airline_symbols.maxlinenr}%\ %L'

" Shorten Modes Display
let g:airline_mode_map = {
    \ '__' : '-', 'n'  : 'N', 'i'  : 'I', 'R'  : 'R',
    \ 'c'  : 'C', 'v'  : 'V', 'V'  : 'V', '' : 'V',
    \ 's'  : 'S', 'S'  : 'S', '' : 'S'}


" ==============================================================================
" Local Configuration
" ==============================================================================

if filereadable($HOME . "/.vimrc.local")
    source $HOME/.vimrc.local
endif

