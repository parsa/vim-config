" Maintainer:		Parsa Amini
" Last Update:		Mon Mar 30 2015

""""""""""""""""""""""
" Legacy Vi behavior "
""""""""""""""""""""""

" don't emulate vi bugs/strange behavior
set nocompatible

" The default for 'backspace' is very confusing to new users, so change it to a
" more sensible value.  Add "set backspace&" to your ~/.vimrc to reset it.
set backspace+=indent,eol,start

" Disable localized menus for now since only some items are translated (e.g.
" the entire MacVim menu is set up in a nib file which currently only is
" translated to English).
set langmenu=none

" modelines are a security risk
set modelines=0

" allow buffer switching without saves
set hidden

""""""""""
" Vundle "
""""""""""

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'
Plugin 'Valloric/YouCompleteMe'
" Installation: cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer
Plugin 'Valloric/ListToggle'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
" Installation
" cd ~/.vim/bundle/command-t/ruby/command-t && ruby extconf.rb && make
Plugin 'wincent/command-t'
" Mac only
Plugin 'zerowidth/vim-copy-as-rtf'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'yegappan/mru'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""
" filters "
"""""""""""

" AStyle installation:
" wget --content-disposition http://downloads.sf.net/project/astyle/astyle/astyle%202.05.1/astyle_2.05.1_linux.tar.gz
" tar xf astyle_2.05.1_linux.tar.gz && cd astyle/build/gcc && make && cp bin/astyle ~/.local/bin
" set equalprg=astyle\ --style=linux\ --indent=spaces\ --indent-namespaces\ --indent-labels\ --indent-col1-comments\ --break-blocks=all\ --pad-oper\ --pad-header\ --unpad-paren\ --delete-empty-lines\ --align-pointer=type\ --align-reference=type\ --remove-brackets
autocmd FileType cpp,c setlocal equalprg=astyle\ --style=linux\ --indent=spaces\ --indent-namespaces\ --indent-labels\ --indent-col1-comments\ --pad-oper\ --pad-header\ --unpad-paren\ --align-pointer=type\ --align-reference=type

""""""""""""""""""
" user interface "
""""""""""""""""""

colorscheme badwolf
syntax on
filetype on

" set up the mouse
" I know, mouse is bad, but this is useful purely for resizing splits visually
" http://usevim.com/2012/05/16/mouse/
set mouse=a
set ttymouse=xterm2

""""""""""""""
" whitespace "
""""""""""""""

" set tab width to 4
set tabstop=4 shiftwidth=4

" tabs = spaces
set expandtab

set autoindent

""""""
" ex "
""""""

" turn on command line completion wild style
set wildmenu wildmode=list:longest

" wrap cursor at line endings and beginnings
set whichwrap=b,s,h,l,<,>,~,[,]


"""""""""""
" display "
"""""""""""

" highlight searches
set hlsearch

" show the cursor position all the time
set ruler

" show line numbers
set number

" show right margin
set cc=81

" set the guifont
set guifont=Consolas


"""""""""""""""
" keybindings "
"""""""""""""""
set pastetoggle=<f5>
noremap <f1> <nop>
"map <f3> :!ninja<cr>
"map <s-f3> :!make<cr>
nnoremap <f12> :!ctags -R<cr>

""""""""""""
" NERDTree "
""""""""""""
nmap <f4> :NERDTreeToggle<cr>


"""""""""""""""""
" YouCompleteMe "
"""""""""""""""""

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:gist_use_password_in_gitconfig = 1


"""""""""""""
" UltiSnips "
"""""""""""""
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader>j"
let g:UltiSnipsJumpBackwardTrigger="<leader>k"
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""
" search and replace "
""""""""""""""""""""""
set gdefault


""""""
" io "
""""""

" number of lines of command line history
set history=900

"" auto-switch to each buffer's cwd
set autochdir

"" watch for file changes by other programs
"set autoread

"" auto write files on exit
"set autowrite autowriteall

" persistent undo
set undodir=~/.vim/undo//
set undofile
" number of undo levels
set undolevels=1000
set undoreload=1000

set backup
set backupdir=~/.vim/bkp//
" change swp file locations
set directory=~/.vim/swp//


"""""""""
" search "
"""""""""

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@<CR><CR>


function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

""""""""""""
" commands "
""""""""""""

command Ww execute "set buftype= | silent w"
command WriteSudo execute "w !sudo cat >%"

" word count, taken from
" http://stackoverflow.com/questions/114431/fast-word-count-function-in-vim
function! WordCount()
  let s:old_status = v:statusmsg
  let position = getpos(".")
  exe ":silent normal g\<c-g>"
  let stat = v:statusmsg
  let s:word_count = 0
  if stat != '--No lines in buffer--'
    let s:word_count = str2nr(split(v:statusmsg)[11])
    let v:statusmsg = s:old_status
  end
  call setpos('.', position)
  return s:word_count
endfunction

" toggle spell checking
command! -nargs=0 Spl
\ setlocal spell!

" toggle tab width between 2 and 4
function! ToggleTabStop()
  if &tabstop == 2
    echo "Setting tab width from " . &tabstop . " to 4."
    set tabstop=4
  else
    echo "Setting tab width from " . &tabstop . " to 2."
    set tabstop=2
  endif
endfunction

command! -nargs=0 Ts call ToggleTabStop()

" toggle what the tab key inserts (e.g. tabs or spaces)
function! ToggleTabKey()
  if &expandtab
    echo "Disabling expandtab"
    set noexpandtab
  else
    echo "Enabling expandtab"
    set expandtab
  endif
endfunction

command! -nargs=0 Tk call ToggleTabKey()

command! -nargs=0 RemoteExtraWhitespace
\ exec ":%s/\s\+$//"

command! -nargs=0 EnablePrintLineNumbers
\ exec ":set printoptions=number:y"

command -nargs=0 CleanCMake
\ exec ":!find\ -iname\ '*cmake*'\ -not\ -name\ CMakeLists.txt\ -exec\ rm\ -rf\ {}\ \\+"

" insert a C++-style UUID identifier at the cursor
command! -nargs=0 UUID
\ exe ":put! ='" .
\     matchstr(system("uuidgen"), "[^\n\r]*") .
\     "'"

" insert a C++-style UUID identifier at the cursor
command! -nargs=0 UUname
\ exe ":put! ='uuid_" .
\     substitute(matchstr(system("uuidgen"), "[^\n\r]*"), "-", "_", "ge") .
\     "'"

" insert a C++-style UUID string at the cursor
command! -nargs=0 UUstr
\ exe ":put! ='\\\"" .
\     matchstr(system("uuidgen"), "[^\n\r]*") .
\     "\\\"'"

" replace %%UUID%% with a UUID
command! -nargs=0 UUrep
\ exe ":%s/%%UUID%%/" .
\     toupper
\       (substitute(matchstr(system("uuidgen"), "[^\n\r]*"), "-", "_", "ge")) .
\     "/ge"

" auto-replace %%UUID%% with a UUID in C++ and C headers
au! BufWrite *.ipp,*.hpp,*.hxx,*.hh,*.H,*.h
\ exe ":%s/%%UUID%%/" .
\     toupper
\       (substitute(matchstr(system("uuidgen"), "[^\n\r]*"), "-", "_", "ge")) .
\     "/ge"
