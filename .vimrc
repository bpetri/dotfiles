" Venantius' .vimrc

autocmd!
execute pathogen#infect()
execute pathogen#helptags()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CORE EDITING SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
"
" " Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
"
" " Default: 0.5
let g:limelight_default_coefficient = 0.7
"
" Number of preceding/following paragraphs to include (default: 0)
" let g:limelight_paragraph_span = 0

set wildmenu
set wildmode=list:longest
"set nocompatible
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set cindent " replaceing smartindent because of some weird stuff with # symbols
set laststatus=2
set backspace=indent,eol,start
set number
set laststatus=2
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase
set cursorline
set cmdheight=1
set switchbuf=useopen
set winwidth=79
set shell=bash
set scrolloff=3
set showcmd
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set term=xterm-256color

syntax enable
filetype indent plugin on

let mapleader=','
set pastetoggle=<Leader>t
map <Leader>d <C-]>

nnoremap + :call limelight#increase()<CR>
nnoremap - :call limelight#decrease()<CR>

"easy indent
noremap > >>
noremap < <<
vnoremap > >gv
vnoremap < <gv


nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

"nnoremap <silent> <Left> :wincmd h<CR>
"nnoremap <silent> <Down> :wincmd j<CR>
"nnoremap <silent> <Up> :wincmd k<CR>
"nnoremap <silent> <Right> :wincmd l<CR>

"easy buffer switching
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
nnoremap <Leader>11 :11b<CR>
nnoremap <Leader>12 :12b<CR>
nnoremap <Leader>13 :13b<CR>
nnoremap <Leader>14 :14b<CR>
nnoremap <Leader>15 :15b<CR>
nnoremap <Leader>16 :16b<CR>
nnoremap <Leader>17 :17b<CR>
nnoremap <Leader>18 :18b<CR>
nnoremap <Leader>19 :19b<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"dim when focus lost
"
"
function! Dim()
  set syntax=off

"  if (&filetype == "clojure")
  RainbowParentheses!
  Limelight!
"  endif
  highlight Normal ctermfg=240
  highlight LineNr ctermfg=240
endfunction


function! Raise()
  set syntax=on
  colorscheme gotham
  if (&filetype == "clojure")
     RainbowParentheses
     Limelight
  endif
  AirlineRefresh
endfunction


autocmd FocusLost * :call Dim()
autocmd FocusGained * :call Raise()
"autocmd BufLeave * :call Dim()
"autocmd BufEnter * :call Raise()


":syntax off | :highlight Normal ctermfg=240 |:highlight LineNr ctermfg=240 | :RainbowParentheses! | :
"autocmd FocusLost * :syntax off | :highlight Normal ctermfg=240 |:highlight LineNr ctermfg=240 | :RainbowParentheses! | :
"autocmd FocusGained * :syntax on | :AirlineRefresh | :RainbowParentheses | :colorscheme gotham | :Limelight | :
"autocmd FocusGained * :syntax on | :AirlineRefresh | :RainbowParentheses | :Limelight | :colorscheme gotham  | :Limelight | :

"autocmd FocusLost * :LimeGanied
"autocmd FocusLost * if(&filetype == "clojure") |:set nocursorline | :highlight Normal ctermfg=235 ctermbg=236 | :highlight Normal ctermfg=235 ctermbg=236
"autocmd FocusGained * if(&filetype == "clojure") | :set cursorline | :highlight Normal ctermfg=12 ctermbg=8 | :AirlineRefresh | :colorscheme gotham | :RainbowParenthesesActivate

" vim-markdown
let g:vim_markdown_folding_disabled=1


" NERDtree
map <F5> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Tagbar
map <F8> :TagbarOpenAutoClose<CR>

" vim-airline
let g:airline_powerline_fonts = 1

 let g:airline_theme = 'gotham'
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
"function! AirlineInit()
let g:airline_section_b = airline#section#create(['branch'])
let g:airline_section_c = '%<%f%m'
let g:airline_section_warning = airline#section#create(['syntastic'])

"  endfunction
"autocmd VimEnter * if exists(':AirlineToggle') | call AirlineInit()


" vim-cljfmt
let g:clj_fmt_autosave = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LANGUAGES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au Filetype html setlocal sw=2 ts=2 sts=2
au Filetype less setlocal sw=2 ts=2 sts=2
let g:airline#extensions#tagbar#enabled = 1


" Clojure
au Filetype clojure nmap <c-c><c-k> :Require<cr>
au Filetype clojure let g:clojure_fuzzy_indent = 1
au Filetype clojure let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let']
au BufNewFile,BufRead *.edn set filetype=clojure
au Filetype clojure autocmd BufWritePre * :%s/\s\+$//e
au Filetype clojure autocmd BufWritePre * :match ErrorMsg  /\C\<[a-z0-9]\+[A-Z]\w*\>/
" au FileType clojure RainbowParentheses
"au FileType clojure Limelight


"au Filetype clojure autocmd BufWritePost * :Require
function! TestToplevel() abort
  "Eval the toplevel clojure form (a deftest) and then test-var the
  "result."
  normal! ^
  let line1 = searchpair('(','',')', 'bcrn', g:fireplace#skip)
  let line2 = searchpair('(','',')', 'rn', g:fireplace#skip)
  let expr = join(getline(line1, line2), "\n")
  let var = fireplace#session_eval(expr)
  let result = fireplace#echo_session_eval("(clojure.test/test-var " . var . ")")
  return result
endfunction
au Filetype clojure nmap <c-c><c-t> :call TestToplevel()<cr>
au Filetype clojure nmap <Leader>cf :Cljfmt<cr>
"augroup rainbow_lisp
"  autocmd!
"  autocmd FileType lisp,clojure,scheme RainbowParentheses
"augroup END

let g:rainbow#blacklist = [9]
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

nmap <Leader>t :CtrlPFunky<cr>
nmap <Leader>f :CtrlP<cr>
nmap <Leader>b :CtrlPBuffer<cr>
nmap <Leader>r :CtrlPMRU<cr>


" Go
au FileType go set noexpandtab softtabstop=4 tabstop=4 shiftwidth=4

" HTML
au Filetype html set tabstop=2 shiftwidth=2


" YAML
au Filetype yaml set tabstop=2 shiftwidth=2

" Ruby
au Filetype ruby set tabstop=2 shiftwidth=2
au Filetype eruby set tabstop=2 shiftwidth=2
au Filetype ruby autocmd BufWritePre * :%s/\s\+$//e


" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


set textwidth=80
set encoding=utf-8

"ctrlP + extensions
"let g:ctrlp_lazy_update = 100 "Only refreshes the results every 100ms so if you type fast searches don't pile up
"let g:ctrlp_user_command = 'find %s -type f | egrep -iv "(\.(eot|gif|gz|ico|jpg|jpeg|otf|png|psd|pyc|svg|ttf|woff|zip)$)|(/\.)|((^|\/)tmp\/)"' "Quicker indexing
let g:ctrlp_funky_syntax_highlight = 1

" Set no max file limit
let g:ctrlp_max_files = 0
" " Search from current directory instead of project root
let g:ctrlp_working_path_mode = 0

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind g  to grep word under cursor
nnoremap <Leader>g :grep! <C-r><C-w><CR>:cw<CR>

" disable paredit with leader p
" nnoremap <Leader>p :call PareditToggle()<cr>



"mouse support
set mouse=a
set ttymouse=xterm2


"remap home/end according to xterm2 seetings
:map <C-a> 0
:map <C-e> $
:imap <C-a> <C-o>0
:imap <C-e> <C-o>$


"remap window chaning

"clojure format
let g:clj_fmt_autosave = 0


"
" use system clipboard by default
set clipboard=unnamedplus
set hidden


" air-line
let g:airline_powerline_fonts = 1
"if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
"    endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'


"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_clojure_checkers = ['eastwood']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme gotham
