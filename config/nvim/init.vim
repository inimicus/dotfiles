" ==============================================================================
" NEOVIM CONFIGURATION FILE
" ==============================================================================

" ------------------------------------------------------------------------------
" Load Plugins
" ------------------------------------------------------------------------------

" Install vim-plug if it hasn't been installed yet
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path

call plug#begin(stdpath('data') . '/plugged')

" Key plugins
Plug 'vim-airline/vim-airline'                          " Lightweight statusline
Plug 'vim-airline/vim-airline-themes'                   " Lightweight Powerline for VIM
Plug 'chriskempson/base16-vim'                          " Colorschemes
Plug 'norcalli/nvim-base16.lua'
"Plug 'Soares/base16.nvim'
Plug 'RRethy/nvim-base16'
Plug 'dense-analysis/ale'                               " Linting/fixing
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " Fuzzy dependency
"Plug 'junegunn/fzf.vim'                                 " Fuzzy finder plugin
Plug 'antoinemadec/coc-fzf'                             " Use fzf for coc fuzzy instead
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-fzf-writer.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ludovicchabant/vim-gutentags'                     " Clever tag files - Use with universal-ctags
Plug 'liuchengxu/vista.vim'                             " Tag and structure browser
Plug 'tpope/vim-fugitive'                               " Git plugin
Plug 'fannheyward/telescope-coc.nvim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }       " LSP and more
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }  " File browser/manager
Plug 'Xuyuanp/nerdtree-git-plugin'                      " File browser/manager
Plug 'ryanoasis/vim-devicons'                           " Fancy file icons
Plug 'vwxyutarooo/nerdtree-devicons-syntax'             " Color devicons
Plug 'folke/todo-comments.nvim'

" QOL plugins
Plug 'AndrewRadev/splitjoin.vim'                        " Multi-line/single-line conversion
Plug 'SirVer/ultisnips'                                 " Snippet manager
Plug 'Yggdroot/indentLine'                              " Thin indent lines
Plug 'airblade/vim-gitgutter'                           " Show git changes in line numbers
Plug 'honza/vim-snippets'                               " Collection of snippets
Plug 'jiangmiao/auto-pairs'                             " Smart bracket/parents/quotes
Plug 'junegunn/goyo.vim'                                " Distraction-free writing
Plug 'tmhedberg/matchit'                                " Matching tags
Plug 'tommcdo/vim-fubitive'                             " Support for BitBucket URLs in fugitive
Plug 'tpope/vim-commentary'                             " Better comments
Plug 'tpope/vim-repeat'                                 " Repeatable plugin maps
Plug 'tpope/vim-surround'                               " Surrounding tags

" Syntax/formatting plugins
Plug 'editorconfig/editorconfig-vim'                    " EditorConfig plugin
Plug 'ekalinin/Dockerfile.vim'                          " Dockerfile syntax and snippets

" JavaScript/JSX
Plug 'yuezk/vim-js'                                     " Alternative Highlighting
Plug 'MaxMEllon/vim-jsx-pretty'                         " JSX Highlighting
"Plug 'pangloss/vim-javascript'                         " Improved JS syntax
Plug 'quramy/vim-js-pretty-template'                    " JS template formatting

" Lua
Plug 'xolox/vim-misc'                                   " Dependency for vim-lua-ftplugin
Plug 'xolox/vim-lua-ftplugin'                           " Lua syntax

" PHP
"Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}

" Initialize plugin system
call plug#end()

" ------------------------------------------------------------------------------
" Commands
" ------------------------------------------------------------------------------

" Take me to space, I wanna go to space!
let mapleader="\<space>"

" Reload vimrc
nnoremap <silent> <leader>vrc :so $MYVIMRC<cr>

" Assist with sticky shift/fast fingers
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q
:command! Qa qa

" Take advantage of unused arrow keys
nnoremap <silent><Left> :vertical resize -5<CR>
nnoremap <silent><Right> :vertical resize +5<CR>
nnoremap <silent><Up> :resize -5<CR>
nnoremap <silent><Down> :resize +5<CR>"

" ------------------------------------------------------------------------------
" Command Menu
" ------------------------------------------------------------------------------
"set wildmenu                " Show tab completion options
"set wildmode=list:longest   " Similar to shell matching

" ------------------------------------------------------------------------------
" Color Configuration
" ------------------------------------------------------------------------------
syntax on                                               " Use syntax coloring
set background=dark                                     " Dark colorscheme
let base16colorspace=256                                " Use 256 colors
colorscheme base16-tomorrow-night                       " Colorscheme
set termguicolors

" ------------------------------------------------------------------------------
" Line Numbers
" ------------------------------------------------------------------------------
set number                  " Show line numbers
set rnu                     " Use relative line numbers
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
set laststatus=2            " Always display the status line

set guicursor=a:block-Cursor    " Enable block cursor
set guicursor=a:blinkon100      " Blinking cursor

" Hide cursorline for inactive buffers
augroup CursorLine
    au!
    au WinLeave * setlocal nocursorline
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
augroup End

" ------------------------------------------------------------------------------
" Editing
" ------------------------------------------------------------------------------
"set autoread                " Automatically update buffers with changes
set complete-=i             " Hide noisy includes
set smarttab                " Consistent start of line tab handling
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
set shortmess+=c            " Don't pass messages to ins-completion-menu
if &diff
    " Ignore whitespace in diff
    set diffopt+=iwhite
endif

" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" ------------------------------------------------------------------------------
" Searching
" ------------------------------------------------------------------------------
set ignorecase              " Ignore case when searching
set smartcase               " Ignore above setting if pattern contains uppercase
set hlsearch                " Highlight search results
set incsearch               " Dynamically as typed

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
" Airline
" ------------------------------------------------------------------------------
let g:airline_theme='base16'                    " Force theme
let g:airline_powerline_fonts = 1               " Use powerline fonts
let g:airline_skip_empty_sections = 1           " Don't show empty sections
let g:airline#extensions#branch#displayed_head_limit = 15   " Limit branch length

" Change symbols behaving badly
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Lightning bolt misbehaving (⚡)
let g:airline_symbols.dirty=' '

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

" ------------------------------------------------------------------------------
" ALE
" ------------------------------------------------------------------------------
" Move between warnings or errors with ALENext and ALEPrevious
nnoremap <silent> <leader>aj :ALENext<cr>
nnoremap <silent> <leader>ak :ALEPrevious<cr>
" ALEFix will format the file in place
nnoremap <silent> <leader>af :ALEFix<cr>

let g:airline#extensions#ale#enabled = 1
" let g:ale_linters_explicit = 1
" let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['importjs', 'eslint', 'prettier'],
\   'php': ['php_cs_fixer'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'sass': ['prettier'],
\   'json': ['prettier'],
\}
highlight ALEWarning ctermfg=5 cterm=bold,underline
highlight ALEError ctermfg=1 cterm=bold,underline
let g:ale_sign_error = '●'      " Less aggressive than the default '>>'
let g:ale_sign_warning = '•'
let g:ale_lint_on_enter = 0     " Less distracting when opening a new file
let g:ale_hover_cursor = 0

let g:ale_php_cs_fixer_options = '--rules=''{
            \ "@Symfony": true,
            \ "concat_space": {"spacing": "one"},
            \ "single_quote": false,
            \ "no_break_comment": {"comment_text": "No break"},
            \ "yoda_style": {"less_and_greater": false}
            \ }'''

" ------------------------------------------------------------------------------
" coc
" ------------------------------------------------------------------------------
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-snippets',
    \ 'coc-phpls'
    \ ]

nmap <leader>do <Plug>(coc-codeaction)

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" ------------------------------------------------------------------------------
" coc-fzf
" ------------------------------------------------------------------------------
let g:coc_fzf_preview = ''
let g:coc_fzf_opts = []
nnoremap <silent><leader><space> :<C-u>CocFzfList<CR>
nnoremap <silent><leader>ca      :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent><leader>cd      :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent><leader>cc      :<C-u>CocFzfList commands<CR>
nnoremap <silent><leader>ce      :<C-u>CocFzfList extensions<CR>
nnoremap <silent><leader>cl      :<C-u>CocFzfList location<CR>
nnoremap <silent><leader>co      :<C-u>CocFzfList outline<CR>
nnoremap <silent><leader>cs      :<C-u>CocFzfList symbols<CR>
nnoremap <silent><leader>cp      :<C-u>CocFzfListResume<CR>

" ------------------------------------------------------------------------------
" Commentary
" ------------------------------------------------------------------------------
autocmd FileType php setlocal commentstring=//\ %s  " PHP comments as //

" ------------------------------------------------------------------------------
" Devicons
" ------------------------------------------------------------------------------
"
if has('mac')
    let g:WebDevIconsOS = 'Darwin'
endif
let g:webdevicons_enable_airline_statusline = 0         " Clean up status line
let g:DevIconsEnableFoldersOpenClose = 1                " Show different icons for open/closed folders in NERDTree

" ------------------------------------------------------------------------------
" EditorConfig
" ------------------------------------------------------------------------------
let g:EditorConfig_exclude_patterns = ['fugitive://.*'] " Be nice to Fugitive
let g:EditorConfig_exclude_patterns = ['scp://.*']      " Nothing over SSH

" ------------------------------------------------------------------------------
" fzf
" ------------------------------------------------------------------------------
let $FZF_DEFAULT_OPTS="--preview 'bat --theme=base16-256 --color=always --style=header,grid --line-range :300 {}'"
let $BAT_THEME="base16-256"

" Show buffers interactively
nnoremap <tab> :Buffers<CR>

" Search, honor gitignore
nnoremap <C-P> :GFiles<CR>

" ------------------------------------------------------------------------------
" GitGutter
" ------------------------------------------------------------------------------
nnoremap <silent> <leader>gg :GitGutterToggle<CR>
nnoremap <silent> ]g :GitGutterNextHunk<CR>
nnoremap <silent> [g :GitGutterPrevHunk<CR>
nnoremap <silent> <leader>gp :GitGutterPreview<CR>

" ------------------------------------------------------------------------------
" Gutentags
" ------------------------------------------------------------------------------
"let g:gutentags_trace = 1
let g:airline#extensions#gutentags#enabled = 1
let g:gutentags_add_default_project_roots = 0
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]
let g:gutentags_project_root = ['package.json', '.git', 'composer.json']
let g:gutentags_cache_dir = '~/.tags'
let g:gutentags_ctags_exclude = [ '*.git', '*.svg', '*.hg', 'dist',
                                \ '*-lock.json', '*.lock', '*.min.*',
                                \ '*.css', '*.html', '*.json', '*.xml',
                                \ '*.phar', '*.ini', '*.rst', '*.md',
                                \ '*vendor/*/test*', '*vendor/*/Test*',
                                \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                                \ '*var/cache*', '*var/log*']

" ------------------------------------------------------------------------------
" Indent Guides
" ------------------------------------------------------------------------------
let g:indentLine_char = '│'
let g:indentLine_color_term = 18

" ------------------------------------------------------------------------------
" NERDTree
" ------------------------------------------------------------------------------
" Show simple menu UI
let g:NERDTreeMinimalUI = 1

" Quick commands
nnoremap <silent> <leader>nn :NERDTreeToggle<CR>
nnoremap <silent> <leader>nf :NERDTreeFind<CR>

" ------------------------------------------------------------------------------
" NERDTree git plugin
" ------------------------------------------------------------------------------
" Customize signs
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  :'ﱤ',
    \ 'Staged'    :'',
    \ 'Untracked' :'',
    \ 'Renamed'   :'ﰲ',
    \ 'Unmerged'  :'',
    \ 'Deleted'   :'',
    \ 'Dirty'     :'',
    \ 'Ignored'   :'',
    \ 'Clean'     :'',
    \ 'Unknown'   :'',
\ }

" ------------------------------------------------------------------------------
" Tagbar
" ------------------------------------------------------------------------------
let g:tagbar_compact = 1
nnoremap <silent> <leader>tt :TagbarToggle<CR>
nnoremap <silent> <leader>tp :TagbarTogglePause<CR>
nnoremap <silent> <leader>to :TagbarOpenAutoClose<CR>

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
" vim-javascript
" ------------------------------------------------------------------------------
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 0

" ------------------------------------------------------------------------------
" vim-jsx-pretty
" ------------------------------------------------------------------------------
let g:vim_jsx_pretty_colorful_config = 1
let g:vim_jsx_pretty_highlight_close_tag = 0

" ------------------------------------------------------------------------------
" Telescope
" ------------------------------------------------------------------------------
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fe <cmd>Telescope file_browser<cr>

lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=always',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = " ❯ ",
    selection_caret = " ",
    entry_prefix = "  ",
    shorten_path = true,
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' },
  }
}
EOF

" ------------------------------------------------------------------------------
" todo-comments.nvim
" ------------------------------------------------------------------------------
"

lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
