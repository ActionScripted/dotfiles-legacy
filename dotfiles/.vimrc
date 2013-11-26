"""''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
""" There are many like it, this one's mine.
""" If you get lost in here, ":h thingy" is your friend
""" Missing help (parts)? :Helptags
"""''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

""" EDITED FOR PUBLIC CONSUMPTION, REMOVING DEPS/PERSONAL

" GENERAL {{{
set backspace=eol,start,indent
set encoding=utf-8
set mouse=a
set nobackup
set nocompatible


"}}}'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" APPEARANCE {{{
syntax on
syntax sync fromstart

set background=dark
set list
set listchars=tab:>\ ,trail:° 
set noequalalways
set number
set numberwidth=6
set relativenumber
set report=0
set ruler
set shortmess+=rI
set showcmd
set showmode

if has('gui_running')
  " MacVim default is egmr...I think
  set guioptions=egmrT
  set guifont=Bitstream\ Vera\ Sans\ Mono:h10
  set lines=60 columns=150
  autocmd WinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
endif


"}}}'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" FORMATTING {{{
set autoindent
set expandtab
set formatoptions-=t
set shiftround
set shiftwidth=2
set smartindent
set tabstop=2
set textwidth=0


"}}}'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" SEARCH {{{
set hls
set ignorecase
set incsearch
set isfname-==
set matchpairs+=<:>
set showmatch
set smartcase
set wildmode=list:longest,full


"}}}'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" COMMENTS/FOLDING {{{
set foldlevel=0
set foldmethod=marker
set commentstring=\ #\ %s
" These improve the C-style /* comments by wrapping with
" a ' *' on each line.
" /*
"  * So that your
"  * multiline comments
"  * look like this
"  */
set comments-=s1:/*,mb:*,ex:*/
set comments+=s:/*,mb:\ *,ex:\ */
set comments+=fb:*


"}}}'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" KEYS/BINDINGS {{{
map  <F1> <Esc>
imap <F1> <Esc>
noremap gf gf`"
noremap <C-^> <C-^>`" 
nnoremap <space> za
vnoremap <space> zf


"}}}'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" FILE TYPES {{{
filetype plugin indent on

" Press "K" over a (key)word for docs, default is a man page
au FileType perl   set keywordprg=perldoc\ -f
au FileType python set keywordprg=pydoc

" Compilation checking for languages with ^B
au FileType php map <C-B> :!php -l %<CR>

" Fill in comment leading characters for C files
au FileType c,cpp,javascript,slang set cindent
au FileType c,cpp,javascript,slang set formatoptions+=ro

" Use skeletons for new files
au BufNewFile  *.html 0r ~/.vim/skeletons/skeleton.html

au FileType  mail,cvs,svn          set tw=72 nosmartindent    formatoptions+=t
au BufNewFile,BufRead  *.txt       set tw=72 formatoptions+=t formatoptions-=c

au FileType bash,coffee,markdown,python   set sw=4 ts=4
au FileType javascript,html,xhtml,css,php set sw=2 tw=2 fdm=indent

au FileType python set foldnestmax=2 foldmethod=indent


"}}}'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" STATUS LINE {{{
" TODO: Handle splits better
" TODO: Create function that returns Solarized hi strings as needed
"         solrHi(foreground, background, attrs)
"           foreground - string, solarized color name
"           background - string, solarized color name
"           terms - string, vim hi attr-list string
"         Use:
"           exe 'hi! User1 ' . solrHi('base02', 'red', 'bold')
"         Returns:
"           'ctermfg=235 ctermbg=160 guifg=#073642 guibg=#dc322f cterm=bold gui=bold'

" Colors taken from Solarized color scheme
let s:solr_gray = "ctermfg=240 ctermbg=235 guifg=#586E75 guibg=#073642"
let s:solr_warn = "ctermfg=230 ctermbg=160 guifg=#FDF6E3 guibg=#DC322F cterm=bold gui=bold"

exe 'hi! User1 ' . s:solr_gray
exe 'hi! User9 ' . s:solr_gray

" Based on http://stackoverflow.com/a/10416234/12276
" %0 is the default coloring, %1..9 are User1..9 hi's
set ls=2                               "required for custom (visible) statusline
set stl=                               "GTFO, statusline
set stl+=%1*\ [%n]\                    "buffernr
set stl+=%0*\ %<%F\                    "File+path
set stl+=%1*\ \ %{&filetype}\          "Filetype
set stl+=%1*\ %{&fenc!=''?&fenc:&enc}  "Encoding
set stl+=%1*\%{&bomb?\",BOM\":''}\     "Byte order mark?
set stl+=%9*\ %{StatusFileFormat()}\   "FileFormat, warn if 'dos'
set stl+=%1*\ %{&spelllang}\           "Language
set stl+=%1*\ %{&hls?'':\"no\"}hls\    "Highlight search?
set stl+=%1*\ %=\ %l/%L\ (%03p%%)\     "Rownumber/total (%)
set stl+=%1*\ %c\ \                    "Colnr
set stl+=%0*\ \ %m%r%w\ %P\            "Modified? Readonly? Top/bot.

function! StatusFileFormat()
  if &ff == 'dos'
    "This colors ALL statuslines at the moment...bug/feature?
    exe 'hi! User9 ' . s:solr_warn
    return 'WARNING: [DOS]'
  else
    return &ff
  endif
endfunction


"}}}'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" VIMWIKI {{{
let g:vimwiki_list = [{ 'path': '~/.vimwiki/',
                      \ 'syntax': 'markdown',
                      \ 'ext': '.md'
                      \}]


"}}}'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" WORK SHORTCUTS (MyNorth) {{{
function! WordToHTML()
  exe '%s`\t\+$``g'
  exe '%s`\t\+`</td><td>`g'
  exe '%s`$`</td></tr>`g'
  exe '%s`^`<tr><td>`g'
  exe 'set syntax=html'
  exe '%s`&`\&amp;`g'
endfunction


"}}}'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
