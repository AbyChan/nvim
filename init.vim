if !has('nvim')
   set ttymouse=xterm2
endif

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using git URL
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

Plug 'Shougo/neocomplete'

Plug 'Shougo/neosnippet'
Plug 'A-Horse/neosnippet-snippets'
Plug 'asins/vim-dict'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'joeytwiddle/sexy_scroller.vim'


function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" WEB 
Plug 'mattn/emmet-vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'einars/js-beautify'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'mxw/vim-jsx'

Plug 'terryma/vim-multiple-cursors'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'marijnh/tern_for_vim'
Plug 'kchmck/vim-coffee-script'
Plug 'isRuslan/vim-es6'

" tool
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'xolox/vim-easytags'
Plug 'tpope/vim-commentary'

" misc
Plug 'xolox/vim-misc'
Plug 'plasticboy/vim-markdown'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'
Plug 'bling/vim-airline'
Plug 'edkolev/promptline.vim'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'DataWraith/auto_mkdir'
Plug 'edsono/vim-matchit' "extended % matching for HTML
Plug 'kien/ctrlp.vim'
Plug 'nelstrom/vimprint'

" color
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'w0ng/vim-hybrid'

Plug 'wakatime/vim-wakatime'
Plug 'jaxbot/semantic-highlight.vim'
" Indent guides ----------------------------------------------------------

" Add plugins to &runtimepath
call plug#end()

" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-s)

set background=dark
set t_Co=256
colorscheme hybrid

let mapleader=","

" Nav windows 
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
set wmh=0

nmap <F8> :TagbarToggle<CR>

set regexpengine=1
syntax enable
syntax on
set laststatus=2
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set scrolloff=3
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest,full
set completeopt=menu,menuone,longest
set cursorline
set ttyfast
set ruler
set laststatus=2
set undofile
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set ai "Auto indent"
set si "Smart indent"
set tabstop=2 
set softtabstop=2 
set shiftwidth=2 

"move
nnoremap j gj
nnoremap k gk
nnoremap ; :

" Use tab instead of % for moving between brackets
nnoremap <tab> %
vnoremap <tab> %

vnoremap // y/<C-R>"<CR>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" Abbreviations --------------------------------------------
ab teh the
ab hte the
ab taht that
ab waht what


" -----quick escape
imap jj <Esc>

nnoremap <C-t>     :tabnew<CR>


let g:startify_custom_header =
          \ map(split(system('fortune | cowsay | sed "s/[[:blank:]]*$//"'), '\n'), '"   ". v:val') + ['']


"vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/usr/local/bin/jsctags'
\ }


"syntastic
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" EasyTags
set tags=./tags;
set tags=./tags;
let g:easytags_always_enabled = 1
let g:easytags_file = './tags'
let g:easytags_dynamic_files = 1
let g:easytags_auto_highlight = 1
let g:easytags_updatetime_min = 5000

let g:syntastic_javascript_checkers = ['jshint']

let g:snips_trigger_key = '<C-\>'

let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

" remember last position in last session
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

:tnoremap <Esc> <C-\><C-n>
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

" :nnoremap <C-h> <C-w>h
" :nnoremap <C-l> <C-w>l

:nnoremap <C-z> :FZF<CR>


autocmd FileType javascript noremap <buffer> <F2> :TernDef<CR>
autocmd FileType javascript noremap <buffer> <F3> :TernRename<CR>
autocmd FileType javascript noremap <buffer> <F4> :TernRefs<CR>

" autocmd FileType javascript noremap <buffer>  <C-F> :call JsBeautify()<cr>
" autocmd FileType json noremap <buffer>  <C-F> :call JsBeautify()<cr>
" autocmd FileType html noremap <buffer> <C-F> :call HtmlBeautify()<cr>
" autocmd FileType css noremap <buffer> <C-F> :call CSSBeautify()<cr>
" autocmd FileType scss noremap <buffer> <C-F> :call CSSBeautify()<cr>

let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_return     = "➡"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_static     = "•"

:nnoremap <C-p> :CtrlPBuffer<CR>

let g:SimpleJsIndenter_BriefMode = 1

set clipboard=unnamed


" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:ycm_semantic_triggers = {
   \   'css': [ 're!^\s{2}', 're!:\s+' ],
   \ }
