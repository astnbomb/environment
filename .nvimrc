let g:python3_host_prog='/usr/bin/python3'
let g:deoplete#sources#jedi#python_path='/usr/bin/python3.6'
let g:neomake_python_pylint_exe = 'pylint3.6'

"let g:python3_host_prog='/usr/bin/python'
"let g:deoplete#sources#jedi#python_path='/usr/bin/python'
"let g:neomake_python_pylint_exe = 'pylint'

set mouse=

" Fix conflict between pydocstring and tmuxnavigate
nmap <silent> <C-y> <Plug>(pydocstring)

let g:grepper = {
    \ 'tools': ['rack'],
    \ 'rack': {
    \   'grepprg':    '~/bin/robot-grep',
    \   'grepformat': '%f:%l:%c:%m',
    \   'escape':     '\^$.*+?()[]{}|',
    \ }}

call plug#begin()

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeFind' }
Plug 'flazz/vim-colorschemes'
Plug 'taglist.vim', { 'on': 'TlistToggle' }
Plug 'fholgado/minibufexpl.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'christoomey/vim-tmux-navigator'
Plug 'heavenshell/vim-pydocstring'
Plug 'benekastah/neomake'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/neocomplcache'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'bogado/file-line'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanalderson/yang.vim'
Plug 'mfukar/robotframework-vim'
Plug 'mhinz/vim-grepper'
Plug 'pearofducks/ansible-vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'rdolgushin/groovy.vim'

call plug#end()


set tabstop=4                 " how many columns is a tab worth
set softtabstop=4             " Always use tabs
set shiftwidth=4              " how far over to move when using >> 
set expandtab                 " do not expand tabs to spaces
set hidden                    " allow me to switch buffers without saving
set ve=all                    " allow cursor to go ANYWHERE
syntax on

" Python has to get 4 spaces
au! Syntax python set tabstop=4
au! Syntax python set softtabstop=4
au! Syntax python set shiftwidth=4

" Yang has to get 2 spaces
au! Syntax yang set tabstop=2
au! Syntax yang set softtabstop=2
au! Syntax yang set shiftwidth=2

au! Syntax yaml set tabstop=2
au! Syntax yaml set softtabstop=2
au! Syntax yaml set shiftwidth=2

let g:deoplete#enable_at_startup = 1

" Taglist configuration
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
let Tlist_WinWidth = 40
let Tlist_Exit_OnlyWindow = 1

" CtrlP Configuration
"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30'
let g:ctrlp_max_files = 1000
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|build|install|release)$'
let g:ctrlp_root_markers = ['128.cmake', '.bashrc']
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''build'' --ignore ''release'' --ignore ''.install'' --ignore --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 350

let g:neomake_python_enable_makers = ['pylint']
let g:neomake_python_pylint_args = ["-d", "line-too-long,too-few-public-methods,missing-docstring,invalid-name,bad-continuation,too-many-arguments"] + neomake#makers#ft#python#pylint()['args']
let g:neomake_open_list=0
let g:neomake_serialize_abort_on_error=1
let g:neomake_serialize=1
autocmd BufWritePost *.py :Neomake pylint


let g:pydocstring_templates_dir = '~/.config/nvim/pydocstring'

colorscheme zenburn

map <F7> :NERDTreeFind<CR>
map <F8> :TlistToggle<CR>

"  move text and rehighlight -- vim tip_id=224
vnoremap > ><CR>gv
vnoremap < <<CR>gv
" ...

tnoremap <C-h> <C-\><C-n><C-h>
tnoremap <C-l> <C-\><C-n><C-l>
tnoremap <C-j> <C-\><C-n><C-j>
tnoremap <C-k> <C-\><C-n><C-k>
tnoremap <Esc> <C-\><C-n>


" deoplete for nvim
" ---

set completeopt+=noinsert,noselect

" Use auto delimiter
call deoplete#custom#set('_', 'converters',
  \ ['converter_auto_paren',
  \  'converter_auto_delimiter', 'remove_overlap'])

let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns._ = '[a-zA-Z_]\k*\(?'

let g:deoplete#sources#go = 'vim-go'

" Movement within 'ins-completion-menu'
imap <expr><C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"
imap <expr><C-k>   pumvisible() ? "\<C-p>" : "\<C-k>"

" Scroll pages in menu
inoremap <expr><C-f> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<Left>"
imap     <expr><C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
imap     <expr><C-u> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

" Undo completion
inoremap <expr><C-g> deoplete#mappings#undo_completion()

" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
"inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"

" <CR>: If popup menu visible, expand snippet or close popup with selection,
"       Otherwise, check if within empty pair and use delimitMate.
imap <silent><expr><CR> pumvisible() ?
  \ (neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : "\<C-y>")
    \ : (delimitMate#WithinEmptyPair() ? "\<Plug>delimitMateCR" : "\<CR>")

" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
imap <silent><expr><Tab> pumvisible() ? "\<C-n>"
  \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
  \ : (<SID>is_whitespace() ? "\<Tab>"
  \ : deoplete#mappings#manual_complete()))

smap <silent><expr><Tab> pumvisible() ? "\<C-n>"
  \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
  \ : (<SID>is_whitespace() ? "\<Tab>"
  \ : deoplete#mappings#manual_complete()))

inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:is_whitespace() "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~? '\s'
endfunction "}}}

nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

" vim: set ts=2 sw=2 tw=80 noet :
