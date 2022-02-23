let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Documents/school/CSE210/cse210-04
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd README.md
$argadd __main__.py
$argadd data/
$argadd game/
edit game/services/video_service.py
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 6 + 15) / 30)
exe '2resize ' . ((&lines * 20 + 15) / 30)
argglobal
if bufexists("game/services/video_service.py") | buffer game/services/video_service.py | else | edit game/services/video_service.py | endif
if &buftype ==# 'terminal'
  silent file game/services/video_service.py
endif
balt game/casting/artifact.py
let s:cpo_save=&cpo
set cpo&vim
nnoremap <buffer> <silent>  <Cmd>lua vim.lsp.buf.signature_help()
nnoremap <buffer> <silent>  rÞ <Nop>
nnoremap <buffer> <silent>  r <Cmd>lua require("which-key").show(" r", {mode = "n", auto = true})
nnoremap <buffer> <silent>  Þ <Nop>
nnoremap <buffer> <silent>   <Cmd>lua require("which-key").show(" ", {mode = "n", auto = true})
nnoremap <buffer> <silent>  cÞ <Nop>
nnoremap <buffer> <silent>  wÞ <Nop>
nnoremap <buffer> <silent>  f <Cmd>lua vim.lsp.buf.formatting()
nnoremap <buffer> <silent>  e <Cmd>lua vim.diagnostic.open_float()
nnoremap <buffer> <silent>  ca <Cmd>lua vim.lsp.buf.code_action()
nnoremap <buffer> <silent>  rn <Cmd>lua vim.lsp.buf.rename()
nnoremap <buffer> <silent>  D <Cmd>lua vim.lsp.buf.type_definition()
nnoremap <buffer> <silent>  wl <Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
nnoremap <buffer> <silent>  wr <Cmd>lua vim.lsp.buf.remove_workspace_folder()
nnoremap <buffer> <silent>  wa <Cmd>lua vim.lsp.buf.add_workspace_folder()
nnoremap <buffer> <silent>  q <Cmd>lua vim.diagnostic.setloclist()
nnoremap <buffer> <silent> ,v <Cmd>lua vim.lsp.buf.code_action()
nnoremap <buffer> <silent> ,d <Cmd>lua vim.lsp.buf.definition()
nnoremap <buffer> <silent> ,k <Cmd>lua vim.lsp.buf.signature_help
nnoremap <buffer> <silent> ,i <Cmd>lua vim.lsp.buf.implementation()
nnoremap <buffer> <silent> ,x <Cmd>lua vim.lsp.buf.execute_command()
nnoremap <buffer> <silent> ,h <Cmd>lua vim.lsp.buf.hover()
nnoremap <buffer> <silent> ,D <Cmd>lua vim.lsp.buf.declaration()
nnoremap <buffer> <silent> ,s <Cmd>lua vim.lsp.buf.document_symbol()
nnoremap <buffer> <silent> ,t <Cmd>lua vim.lsp.buf.type_definition()
nnoremap <buffer> <silent> ,r <Cmd>lua vim.lsp.buf.references()
nnoremap <buffer> <silent> K <Cmd>lua vim.lsp.buf.hover()
nnoremap <buffer> <silent> [d <Cmd>lua vim.diagnostic.goto_prev()
nnoremap <buffer> <silent> ]d <Cmd>lua vim.diagnostic.goto_next()
nnoremap <buffer> <silent> gr <Cmd>lua vim.lsp.buf.references()
nnoremap <buffer> <silent> gi <Cmd>lua vim.lsp.buf.implementation()
nnoremap <buffer> <silent> gD <Cmd>lua vim.lsp.buf.declaration()
nnoremap <buffer> <silent> gd <Cmd>lua vim.lsp.buf.definition()
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=b:#,fb:-
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal completeslash=
setlocal nocopyindent
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=^\\s*\\(def\\|class\\)
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'python'
setlocal filetype=python
endif
setlocal fillchars=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcqj
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=^\\s*\\(from\\|import\\)
setlocal includeexpr=substitute(substitute(substitute(v:fname,b:grandparent_match,b:grandparent_sub,''),b:parent_match,b:parent_sub,''),b:child_match,b:child_sub,'g')
setlocal indentexpr=GetPythonIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],:,!^F,o,O,e,<:>,=elif,=except
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=python\ -m\ pydoc
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal list
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
setlocal number
setlocal numberwidth=4
setlocal omnifunc=python3complete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollback=-1
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=yes:1
setlocal smartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=
setlocal statusline=
setlocal suffixesadd=.py
setlocal noswapfile
setlocal synmaxcol=500
if &syntax != ''
setlocal syntax=
endif
setlocal tagfunc=
setlocal tabstop=4
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal winblend=0
setlocal winhighlight=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let &fdl = &fdl
let s:l = 61 - ((1 * winheight(0) + 3) / 6)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 61
normal! 0
wincmd w
argglobal
if bufexists("game/casting/actor.py") | buffer game/casting/actor.py | else | edit game/casting/actor.py | endif
if &buftype ==# 'terminal'
  silent file game/casting/actor.py
endif
balt term://~/Documents/school/CSE210/cse210-04//22332:bash
let s:cpo_save=&cpo
set cpo&vim
nnoremap <buffer> <silent>  <Cmd>lua vim.lsp.buf.signature_help()
nnoremap <buffer> <silent>  cÞ <Nop>
nnoremap <buffer> <silent>  wÞ <Nop>
nnoremap <buffer> <silent>  rÞ <Nop>
nnoremap <buffer> <silent>  Þ <Nop>
nnoremap <buffer> <silent>   <Cmd>lua require("which-key").show(" ", {mode = "n", auto = true})
nnoremap <buffer> <silent>  f <Cmd>lua vim.lsp.buf.formatting()
nnoremap <buffer> <silent>  e <Cmd>lua vim.diagnostic.open_float()
nnoremap <buffer> <silent>  ca <Cmd>lua vim.lsp.buf.code_action()
nnoremap <buffer> <silent>  rn <Cmd>lua vim.lsp.buf.rename()
nnoremap <buffer> <silent>  D <Cmd>lua vim.lsp.buf.type_definition()
nnoremap <buffer> <silent>  wl <Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
nnoremap <buffer> <silent>  wr <Cmd>lua vim.lsp.buf.remove_workspace_folder()
nnoremap <buffer> <silent>  wa <Cmd>lua vim.lsp.buf.add_workspace_folder()
nnoremap <buffer> <silent>  q <Cmd>lua vim.diagnostic.setloclist()
nnoremap <buffer> <silent> ,v <Cmd>lua vim.lsp.buf.code_action()
nnoremap <buffer> <silent> ,d <Cmd>lua vim.lsp.buf.definition()
nnoremap <buffer> <silent> ,k <Cmd>lua vim.lsp.buf.signature_help
nnoremap <buffer> <silent> ,i <Cmd>lua vim.lsp.buf.implementation()
nnoremap <buffer> <silent> ,x <Cmd>lua vim.lsp.buf.execute_command()
nnoremap <buffer> <silent> ,h <Cmd>lua vim.lsp.buf.hover()
nnoremap <buffer> <silent> ,D <Cmd>lua vim.lsp.buf.declaration()
nnoremap <buffer> <silent> ,s <Cmd>lua vim.lsp.buf.document_symbol()
nnoremap <buffer> <silent> ,t <Cmd>lua vim.lsp.buf.type_definition()
nnoremap <buffer> <silent> ,r <Cmd>lua vim.lsp.buf.references()
nnoremap <buffer> <silent> K <Cmd>lua vim.lsp.buf.hover()
nnoremap <buffer> <silent> [d <Cmd>lua vim.diagnostic.goto_prev()
nnoremap <buffer> <silent> ]d <Cmd>lua vim.diagnostic.goto_next()
nnoremap <buffer> <silent> gr <Cmd>lua vim.lsp.buf.references()
nnoremap <buffer> <silent> gi <Cmd>lua vim.lsp.buf.implementation()
nnoremap <buffer> <silent> gD <Cmd>lua vim.lsp.buf.declaration()
nnoremap <buffer> <silent> gd <Cmd>lua vim.lsp.buf.definition()
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=b:#,fb:-
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal completeslash=
setlocal nocopyindent
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal cursorlineopt=both
setlocal define=^\\s*\\(def\\|class\\)
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'python'
setlocal filetype=python
endif
setlocal fillchars=
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcqj
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=^\\s*\\(from\\|import\\)
setlocal includeexpr=substitute(substitute(substitute(v:fname,b:grandparent_match,b:grandparent_sub,''),b:parent_match,b:parent_sub,''),b:child_match,b:child_sub,'g')
setlocal indentexpr=GetPythonIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],:,!^F,o,O,e,<:>,=elif,=except
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=python\ -m\ pydoc
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal list
setlocal listchars=
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,hex
setlocal number
setlocal numberwidth=4
setlocal omnifunc=python3complete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollback=-1
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal showbreak=
setlocal sidescrolloff=-1
setlocal signcolumn=yes:1
setlocal smartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal spelloptions=
setlocal statusline=
setlocal suffixesadd=.py
setlocal noswapfile
setlocal synmaxcol=500
if &syntax != ''
setlocal syntax=
endif
setlocal tagfunc=
setlocal tabstop=4
setlocal tagcase=
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal thesaurusfunc=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal winblend=0
setlocal winhighlight=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let &fdl = &fdl
let s:l = 35 - ((18 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 35
normal! 028|
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 6 + 15) / 30)
exe '2resize ' . ((&lines * 20 + 15) / 30)
tabnext 1
badd +7 game/directing/director.py
badd +44 __main__.py
badd +39 game/services/video_service.py
badd +11 game/casting/artifact.py
badd +35 game/casting/actor.py
badd +10013 term://~/Documents/school/CSE210/cse210-04//22332:bash
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOFc
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
