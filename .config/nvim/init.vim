set fileencoding=utf-8
set encoding=utf-8
set runtimepath^=~/.config/nvim/plugged/coc.nvim
filetype on
set colorcolumn=80
set nu rnu
set spelllang=es,en,technical
set splitbelow
set splitright
set nowrap
set mouse=a

packadd termdebug

" Vim-Plug
call plug#begin()

Plug 'ldelossa/litee.nvim'
"
Plug 'chrisbra/csv.vim'

Plug 'beauwilliams/focus.nvim'

" Treesiter for syntaxhighlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'nvim-treesitter/playground'

Plug 'vim-airline/vim-airline'

" Colors
Plug 'chrisbra/Colorizer'
Plug 'Mofiqul/dracula.nvim'

"Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' | Plug 'Shougo/neosnippet-snippets'
let g:ultisnips_python_style = 'numpy'

"Goyo
Plug 'junegunn/goyo.vim'

"Python
Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'python-mode/python-mode' 

" Fortran
Plug 'rudrab/vimf90'
let fortran_leader = ','
"let fortran_linter = '2'
let fortran_linter = '-1'
let fortran_completer = '<F3>'
let fortran_compiler = 'gfortran'
let fortran_exeExt = 'o'
let fortran_fcflags = '-Wall -O0 -fcheck=all -c'
let fortran_flflags = '-Wall -O0 -fcheck=all'
let g:fprettify_options = '--silent --indent 4'

" LaTeX
Plug 'lervag/vimtex'
let g:tex_flavor='xelatex'
let g:vimtex_quickfix_mode=0
"set conceallevel=1
let g:tex_conceal='abdmg'

" Julia
Plug 'JuliaEditorSupport/julia-vim'

" Linter
Plug 'dense-analysis/ale'

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'yasuhiroki/github-actions-yaml.vim'

call plug#end()

" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

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
" -----------------------------------------------------------------------------
lua require("focus").setup()


" -> Binds
" --> General
let mapleader = ','
vnoremap <C-c> "+y
inoremap <C-v> <ESC>"+pa
vnoremap <C-d> "+d
nnoremap <Space> @q
nnoremap <C-Left> :vertical resize +5<CR>
nnoremap <C-Right> :vertical resize -5<CR>
nnoremap <Leader>w :w<CR> 
nnoremap <Leader><Leader> :source $MYVIMRC<CR>
" --> LaTeX
autocmd FileType tex nmap cc :VimtexCompile<CR>
autocmd FileType tex nmap <C-t> :VimtexTocToggle<CR>
" --> Lazy presentation
noremap <Left> :silent bp<CR> :redraw!<CR>
noremap <Right> :silent bn<CR> :redraw!<CR>
" --> ALE
nnoremap <Leader>l :ALEToggle<cr>
nnoremap gd :ALEGoToDefinition<CR>
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

let g:magma_automatically_open_output = v:false
" -----------------------------------------------------------------------------

" -> Settings
set background=dark
colorscheme dracula

" --> IPython
let g:ipy_celldef = '^##'


" --> Treesitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" --> LaTeX
let g:vimtex_compiler_latexmk = {
	\ 'build_dir' : '',
	\ 'callback' : 1,
	\ 'continuous' : 1,
	\ 'executable' : 'latexmk',
	\ 'hooks' : [],
	\ 'options' : [
	\   '-verbose',
	\   '-file-line-error',
	\   '-synctex=1',
	\   '-interaction=nonstopmode',
	\ ],
\}

" --> CoC
let g:coc_start_at_startup = 1
augroup coc
  autocmd!
  autocmd VimEnter * :silent CocStart
augroup end

let g:coc_user_config = {
      \   'languageserver': {
      \     'fortran': {
      \       'command': '/usr/bin/fortls',
      \       'args': ['--lowercase_intrinsics', '--hover_signature'],
      \       'filetypes': ['fortran'],
      \       'rootPatterns': ['.fortls', '.git/'],
      \     }
      \},
\}
