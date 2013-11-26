" Vim color file
" Maintainer:  Michael Thompson <actionscripted@gmail.com>
" Last Change: 2009 Sept 18
"
" sated.vim -- let's make things pretty and functional


" Push the Reset Button
  set bg=dark  " dark|light
  hi clear     " clear user settings
  if exists("syntax_on")
    syntax reset
  endif

let colors_name = "sated"



hi Normal    gui=NONE guifg=#efefef guibg=#111111 ctermfg=gray  ctermbg=black
hi ErrorMsg  gui=NONE guifg=#ffffff guibg=#FF0000 ctermfg=white ctermbg=lightblue
hi LineNr    gui=NONE guifg=#333333 guibg=NONE    ctermfg=gray  cterm=NONE

hi Folded      gui=italic guifg=#808080 guibg=NONE cterm=bold ctermfg=grey ctermbg=black term=bold
hi FoldColumn  gui=NONE   guifg=#808080 guibg=NONE cterm=bold ctermfg=grey ctermbg=black term=bold

hi Constant   guifg=#FFA5B4 ctermfg=magenta cterm=none
hi Identifier guifg=#999999 ctermfg=cyan    cterm=NONE
hi Title      guifg=#CC0066 ctermfg=magenta cterm=bold

hi StatusLine   guifg=white guibg=darkgray gui=bold ctermfg=blue  ctermbg=gray term=none cterm=none
hi StatusLineNC guifg=black guibg=#333333  gui=none ctermfg=black ctermbg=gray term=none cterm=none

if version >= 700
  hi CursorLine    guifg=NONE guibg=#222222 ctermfg=NONE  ctermbg=black
  hi CursorColumn  guifg=NONE guibg=#222222 ctermfg=NONE  ctermbg=black
endif

" hi SpellBad guifg=white guibg=red
" hi SpellCap guifg=white guibg=red



" ---------------------------------------------------
" I have not changed anything under this comment line
" ---------------------------------------------------
"

hi Visual		guifg=#8080ff guibg=fg		gui=reverse				ctermfg=lightblue ctermbg=fg cterm=reverse
hi VisualNOS	guifg=#8080ff guibg=fg		gui=reverse,underline	ctermfg=lightblue ctermbg=fg cterm=reverse,underline
hi Todo			guifg=#d14a14 guibg=#1248d1						ctermfg=red	ctermbg=darkblue
hi Search		guifg=#90fff0 guibg=#2050d0						ctermfg=white ctermbg=darkblue cterm=underline term=underline
hi IncSearch	guifg=#b0ffff guibg=#2050d0							ctermfg=darkblue ctermbg=gray

hi SpecialKey		guifg=cyan			ctermfg=darkcyan
hi Directory		guifg=cyan			ctermfg=cyan
hi WarningMsg		guifg=red			ctermfg=red
hi WildMenu			guifg=yellow guibg=black ctermfg=yellow ctermbg=black cterm=none term=none
hi ModeMsg			guifg=#22cce2		ctermfg=lightblue
hi MoreMsg			ctermfg=darkgreen	ctermfg=darkgreen
hi Question			guifg=green gui=none ctermfg=green cterm=none
hi NonText			guifg=#0030ff		ctermfg=darkblue

hi VertSplit	guifg=black guibg=darkgray gui=none		ctermfg=black ctermbg=gray term=none cterm=none

hi DiffAdd	guibg=darkblue	ctermbg=darkblue term=none cterm=none
hi DiffChange	guibg=darkmagenta ctermbg=magenta cterm=none
hi DiffDelete	ctermfg=blue ctermbg=cyan gui=bold guifg=Blue guibg=DarkCyan
hi DiffText	cterm=bold ctermbg=red gui=bold guibg=Red

hi Cursor	guifg=black guibg=yellow ctermfg=black ctermbg=yellow
hi lCursor	guifg=black guibg=white ctermfg=black ctermbg=white


hi Comment	guifg=#80a0ff ctermfg=darkred
hi Special	ctermfg=brown guifg=Orange cterm=none gui=none
hi Statement	ctermfg=yellow cterm=none guifg=#ffff60 gui=none
hi PreProc	ctermfg=magenta guifg=#ff80ff gui=none cterm=none
hi type		ctermfg=green guifg=#99CC00 gui=none cterm=none
hi Underlined	cterm=underline term=underline
hi Ignore	guifg=bg ctermfg=bg

" suggested by tigmoid, 2008 Jul 18
hi Pmenu guifg=#c0c0c0 guibg=#404080
hi PmenuSel guifg=#c0c0c0 guibg=#2050d0
hi PmenuSbar guifg=blue guibg=darkgray
hi PmenuThumb guifg=#c0c0c0
