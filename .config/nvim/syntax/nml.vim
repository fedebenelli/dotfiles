" Quit when a syntax file was already loaded.
if exists('b:current_syntax') | finish|  endif

syntax match nmlId "&\+" nextgroup=nmlTitle
syntax match nmlTitle "\k\+"

hi def link nmlTitle Identifier

" syntax match nmlVar "\k\+" nextgroup=nmlAssignment
" syntax match nmlAssignment "=" contained nextgroup=nmleValue
" syntax match nmlValue ".*" contained
" 
" hi def link nmlVar Identifier
" hi def link nmlAssignment Statement
" hi def link nmlValue String

let b:current_syntax = 'nml'
