" =============================================================================
"  Functions
" -----------------------------------------------------------------------------

function! RangeSearch(direction)
" -> Search inside a visual selection
  call inputsave()
  let g:srchstr = input(a:direction)
  call inputrestore()
  if strlen(g:srchstr) > 0
    let g:srchstr = g:srchstr.
          \ '\%>'.(line("'<")-1).'l'.
          \ '\%<'.(line("'>")+1).'l'
  else
    let g:srchstr = ''
  endif
endfunction
vnoremap <silent> / :<C-U>call RangeSearch('/')<CR>:if strlen(g:srchstr)
			\> 0\|exec '/'.g:srchstr\|endif<CR>
vnoremap <silent> ? :<C-U>call RangeSearch('?')<CR>:if strlen(g:srchstr) 
			\> 0\|exec '?'.g:srchstr\|endif<CR>


function! VW()
    :VimwikiIndex<CR>
    :Calendar<CR>
endfunction

function! GetDate()
    :r!echo $(date "+\%Y/\%m/\%d")
    :r!echo ""
endfunction
" =============================================================================
set undodir=~/.local/share/nvim/undo-dir
set undofile
set fileencoding=utf-8
set encoding=utf-8
set runtimepath^=~/.config/nvim/
set colorcolumn=80
set nu rnu
set spelllang=es,en
set splitbelow
set splitright
set nowrap
set mouse=a
set tabstop=4 shiftwidth=4 expandtab
set nofoldenable "asd
set foldmethod=indent
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
" set foldtext=substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend))
set fillchars=fold:\ 
set foldnestmax=3
set foldminlines=1
set nocompatible
filetype plugin on

packadd termdebug
let g:ale_disable_lsp = 1

" ==============================================================================
" PLUGINS
" ------------------------------------------------------------------------------
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-sleuth'
Plug 'puremourning/vimspector'
Plug 'salkin-mada/openscad.nvim'
Plug 'kevinoid/vim-jsonc'
" Plug 'chrisbra/csv.vim'
Plug 'beauwilliams/focus.nvim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
" Plug 'nvim-treesitter/playground'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vimwiki-sync'
Plug 'mattn/calendar-vim'
Plug 'chrisbra/Colorizer'
Plug 'Mofiqul/dracula.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' | Plug 'Shougo/neosnippet-snippets'
Plug 'junegunn/goyo.vim'
Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rudrab/vimf90'
Plug 'lervag/vimtex'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'jpalardy/vim-slime'
Plug 'dense-analysis/ale'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'yasuhiroki/github-actions-yaml.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'vim-autoformat/vim-autoformat'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'mcchrish/zenbones.nvim'
Plug 'rktjmp/lush.nvim' " Required by zenbones
Plug 'savq/melange-nvim'
Plug 'preservim/tagbar'
Plug 'junegunn/limelight.vim'
Plug 'nyoom-engineering/oxocarbon.nvim'
Plug 'rhysd/vim-grammarous'
"Plug 'edluffy/hologram.nvim'

call plug#end()


" -> Binds
let mapleader = ','
let g:vimspector_enable_mappings = 'HUMAN'
noremap <Leader>d :call GetDate()<CR>

nmap <F8> :TagbarToggle<CR>

" --> Select colorschemes
nnoremap <leader>csl :colorscheme vimbones<CR>
nnoremap <leader>csd :colorscheme tokyobones<CR>

" --> General
noremap <F3> :Autoformat<CR>
vnoremap <C-c> "+y
inoremap <C-v> <ESC>"+pa
vnoremap <C-d> "+d
nnoremap <Space> @q
nnoremap <C-Left> :vertical resize +5<CR>
nnoremap <C-Right> :vertical resize -5<CR>
nnoremap <Leader>w :w<CR> 
nnoremap <Leader><Leader> :source $MYVIMRC<CR>
nnoremap <C-s> :r!screenshot -tex<CR>
" --> Markdon
autocmd FileType markdown nmap <leader>cc :!pandoc % -o %.pdf
" --> LaTeX
autocmd FileType tex nmap cc :VimtexCompile<CR>
autocmd FileType tex nmap <C-t> :VimtexTocToggle<CR>
autocmd FileType tex nmap <leader>ss :!screenshot -tex<CR>

" --> Lazy presentation
noremap <Left> :silent bp<CR> :redraw!<CR>
noremap <Right> :silent bn<CR> :redraw!<CR>
" --> ALE
nnoremap <Leader>l :ALEToggle<cr>
nnoremap gd :ALEGoToDefinition<CR>
nnoremap <silent> <leader>aj :ALENext<cr>
nnoremap <silent> <leader>ak :ALEPrevious<cr>
" --> Git
nnoremap <Leader>gl :GV<CR>
nnoremap <Leader>gd :Git diff %<CR>
nnoremap <Leader>gc :Git commit %<CR>
nnoremap <Leader>gs :Git status %<CR>
" --> CSV
autocmd FileType csv nmap <Leader>a :ArrangeColumn<CR>
autocmd FileType csv nmap <Leader>dc :DeleteColumn<CR>
" --> Magma-nvim
nnoremap <silent><expr> <Leader>r  :MagmaEvaluateOperator<CR>
nnoremap <silent>       <Leader>rr :MagmaEvaluateLine<CR>
xnoremap <silent>       <Leader>r  :<C-u>MagmaEvaluateVisual<CR>
nnoremap <silent>       <Leader>rc :MagmaReevaluateCell<CR>
nnoremap <silent>       <Leader>rd :MagmaDelete<CR>
nnoremap <silent>       <Leader>ro :MagmaShowOutput<CR>
" --> Focus
nnoremap <C-h> :FocusSplitLeft<CR>
nnoremap <C-j> :FocusSplitDown<CR>
nnoremap <C-k> :FocusSplitUp<CR>
nnoremap <C-l> :FocusSplitRight<CR>
let g:focusmode_width = 90
nnoremap <leader>fm :FocusMaxOrEqual<CR>

" =============================================================================
"  Settings
" -----------------------------------------------------------------------------
" -> General
" hi Normal guibg=NONE ctermbg=NONE
" set background=dark

" --> Magma
let g:magma_automatically_open_output = v:false

" --> Indent lines

" lua << EOF
" vim.opt.termguicolors = true
" vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
" vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
" vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
" vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
" vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
" vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
" 
" vim.opt.list = true
" -- vim.opt.listchars:append("space:⋅")
" -- vim.opt.listchars:append("eol:↴")
" 
" require("indent_blankline").setup {
"     space_char_blankline = "-",
"     char_highlight_list = {
"         "IndentBlanklineIndent1",
"         "IndentBlanklineIndent2",
"         "IndentBlanklineIndent3",
"         "IndentBlanklineIndent4",
"         "IndentBlanklineIndent5",
"         "IndentBlanklineIndent6",
"     },
" }
" EOF
"

lua << EOF
vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

require("ibl").setup()
EOF

" --> Slime
let g:slime_target = "kitty"

" --> Hologram
" lua require('hologram').setup{ auto_display = true }

" --> Treesitter
" lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
" lua require('openscad')
lua require("focus").setup()


" --> Git
let g:gitblame_display_virtual_text = 1

" --> Fortran
autocmd FileType fortran set foldmethod=indent
autocmd FileType fortran syntax match FortranConceal '%' conceal cchar=→
autocmd FileType fortran  inoremap <buffer> ; %
let fortran_free_source=1
let fortran_do_enddo=1
let fortran_more_precise=1
let fortran_leader = ','
"let fortran_linter = '2'
let fortran_linter = '-1'
let fortran_completer = '<F3>'
let fortran_compiler = 'gfortran'
let fortran_exeExt = 'o'
let fortran_fcflags = '-Wall -g -O0 -fcheck=all -c'
let fortran_flflags = '-Wall -g -O0 -fcheck=all'
let g:fprettify_options = '--silent --indent 4'


" --> Python
"  Don't use virtualenv's python
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n1 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

" --> IPython
let g:ipy_celldef = '^##'

" --> Ale
let g:ale_disable_lsp = 1

" --> LaTeX
let g:tex_flavor='lualatex'
let g:vimtex_quickfix_mode=0
let g:formatdef_latexindent = '"latexindent -"'

"set conceallevel=1
let g:tex_conceal='abdmg'

let g:vimtex_compiler_method='tectonic'
let g:vimtex_compiler_generic = {
      \ 'command': 'tectonic -X watch'
      \}
let g:vimtex_compiler_tectonic = {
    \ 'out_dir' : '',
    \ 'hooks' : [],
    \ 'options' : [
    \   '--keep-logs',
    \   '--synctex'
    \ ],
    \}
" let g:vimtex_compiler_latexmk = {
" 	\ 'build_dir' : 'build',
" 	\ 'callback' : 1,
" 	\ 'continuous' : 1,
" 	\ 'executable' : 'latexmk',
" 	\ 'options' : [
"         \   '-shell-escape',
" 	\   '-verbose',
" 	\   '-file-line-error',
" 	\   '-synctex=1',
" 	\   '-interaction=nonstopmode',
" 	\ ],
" \}

" --> CoC
let g:coc_start_at_startup = 1
augroup coc
  autocmd!
  autocmd VimEnter * :silent CocStart
augroup end

let g:coc_user_config = {
      \   'languageserver': {
      \     'fortran': {
      \       'command': 'fortls',
      \       'args': ['--lowercase_intrinsics', '--hover_signature'],
      \       'filetypes': ['fortran'],
      \       'rootPatterns': ['.fortls', '.git/'],
      \     }
      \},
\}

"" Use K to show documentation in preview window.
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

" -> Snippets
let g:ultisnips_python_style = 'numpy'

" -> airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_left_sep = "\uE0B4"
let g:airline_right_sep = "\uE0B6"

" -> VimWiki
let g:vimwiki_list = [{ 'path': '~/docs/vimwiki', 
                      \ 'path_html': '~/docs/vimwiki/html'}]
let g:vimwiki_global_ext = 0
let g:vimwiki_folding='list'

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
