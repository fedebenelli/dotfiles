set fileencoding=utf-8
set encoding=utf-8
filetype on
set colorcolumn=80
set nu rnu
set spelllang=es,en,technical

" Vim-Plug
call plug#begin()

"Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' | Plug 'Shougo/neosnippet-snippets'

"Goyo
Plug 'junegunn/goyo.vim'

"Python
Plug 'python-mode/python-mode' ", { 'for': 'python', 'branch': 'develop' }

" Fortran
"-Vimf90
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

Plug 'fpnick/flowhighlight'

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

call plug#end()

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
vnoremap <silent> / :<C-U>call RangeSearch('/')<CR>:if strlen(g:srchstr) > 0\|exec '/'.g:srchstr\|endif<CR>
vnoremap <silent> ? :<C-U>call RangeSearch('?')<CR>:if strlen(g:srchstr) > 0\|exec '?'.g:srchstr\|endif<CR>


" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif


" -> Binds

" --> General
let mapleader = ','
nnoremap <Leader>w :w<cr>
vnoremap <C-c> "+y
inoremap <C-v> <ESC>"+pa
vnoremap <C-d> "+d
nnoremap <Space> @q


" --> LaTeX
autocmd FileType tex nmap cc :VimtexCompile<CR>
nnoremap <C-t> :VimtexTocToggle<CR>

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
"----------------------------------------------

" --> Lazy presentation
noremap <Left> :silent bp<CR> :redraw!<CR>
noremap <Right> :silent bn<CR> :redraw!<CR>

" -> CoC
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
