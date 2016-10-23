" Maintainer:       Parsa Amini
" Last Update:      Sat Oct 22 2016

" Legacy Vi behavior {{{ "
" don't emulate vi bugs/strange behavior
set nocompatible

" The default for 'backspace' is very confusing to new users, so change it to a
" more sensible value.  Add "set backspace&" to your $VIM/.vimrc to reset it.
set backspace+=indent,eol,start

""""""
" ex "
""""""

" turn on command line completion wild style
set wildmenu wildmode=list:longest
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" wrap cursor at line endings and beginnings
set whichwrap=b,s,h,l,<,>,~,[,]
" }}} Legacy Vi behavior "

if v:version > 703
    " Vundle {{{ "
    filetype off
    "
    " Vundle Installation:
    " git clone https://github.com/gmarik/Vundle.vim.git $VIM/plugins/Vundle.vim 
    " vim +PluginInstall +qall
    
    try
        set rtp+=~/.vim/vundle/Vundle.vim
        call vundle#begin('~/.vim/vundle')
        " Vundle itself
        Plugin 'gmarik/Vundle.vim'
        " Color Schemes
        Plugin 'sjl/badwolf'
        Plugin 'IDLE'
        " Git Integration
        "Plugin 'tpope/vim-fugitive'
        "
        "Plugin 'tpope/vim-surround'
        "Plugin 'tpope/vim-abolish'
        "Plugin 'vimcat'
        "Plugin 'vimwiki/vimwiki'
        "Plugin 'project.tar.gz'
        """ Needs to be built by :VimProcInstall
        "Plugin 'Shougo/vimproc'
        "" Depends on vimproc
        "Plugin 'Vebugger'
        Plugin 'scrooloose/nerdtree'
        "" Depends on vimproc
        "Plugin 'rhysd/wandbox-vim'
        " Installation:
        " Mac only
        Plugin 'zerowidth/vim-copy-as-rtf'
        Plugin 'fholgado/minibufexpl.vim'
        "Plugin 'yegappan/mru'
        Plugin 'bling/vim-airline'
        Plugin 'sjl/gundo.vim.git'
    
        "Plugin 'Conque-Shell'
        "Plugin 'Conque-GDB'
    
        "Plugin 'parkr/vim-jekyll'
        "Plugin 'cmake.vim--Alcin'
        "Plugin 'Valloric/ListToggle'
        Plugin 'scrooloose/syntastic'
    
        " UltiSnips
        Plugin 'SirVer/ultisnips'
    
        Plugin 'majutsushi/tagbar'
        Plugin 'taglist.vim'
    
        " Python
        "Plugin 'hdima/python-syntax'
        "Plugin 'klen/python-mode'
    
        " Command-T
        " cd $VIM/plugins/command-t/ruby/command-t && ruby extconf.rb && make
        "Plugin 'wincent/command-t'
    
        " You Complete Me
        " cd $VIM/plugins/YouCompleteMe && ./install.py --clang-completer
        Plugin 'Valloric/YouCompleteMe'
    
        " All of your Plugins must be added before the following line
        call vundle#end()            " required
        " To ignore plugin indent changes, instead use:
        filetype plugin on
        "
        " Brief help
        " :PluginList          - list configured plugins
        " :PluginInstall(!)    - install (update) plugins
        " :PluginSearch(!) foo - search (or refresh cache first) for foo
        " :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
        "
        " see :h vundle for more details or wiki for FAQ
        " Put your non-Plugin stuff after this line
    catch
        echo 'Something's not right with Vundle'
    endtry
    " }}} Vundle "

    "let g:gundo_prefer_python3 = 1
    "let g:jedi#force_py_version = 3
    "let g:syntastic_python_python_exec = 'python3'
    "let g:pymode_python = 'python3'

    " vim:ft=vim:
endif

" modelines {{{ "
" modelines are a security risk
set modelines=0
" }}} modelines "

" user interface {{{ "
try
    colorscheme IDLE
    "colorscheme badwolf
    "colorscheme github
catch
    colorscheme desert
endtry

"" disable scrollbars
"set guioptions-=r
"set guioptions-=R
"set guioptions-=l
"set guioptions-=L

"set background=dark
"
"" Set extra options when running in GUI mode
"if has("gui_running")
"    set guioptions-=T
"    set guioptions-=e
"    set t_Co=256
"    set guitablabel=%M\ %t
"endif

"if has("mac") || has("macunix")
"  nmap <D-j> <M-j>
"  nmap <D-k> <M-k>
"  vmap <D-j> <M-j>
"  vmap <D-k> <M-k>
"endif

syntax on
filetype on

if v:version >= 800 || has('patch710')
    set listchars=space:·,precedes:«,extends:»,eol:↲,tab:▸\
else
    set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\
endif
set list

"set visualbell t_vb= " Turn off visual bell, error flash

" set up the mouse
" I know, mouse is bad, but this is useful purely for resizing splits visually
" http://usevim.com/2012/05/16/mouse/
set mouse=a
set ttymouse=xterm2

" show the cursor position all the time
set ruler

" show line numbers
set number

" show right margin
set colorcolumn=81

" set the guifont
"set guifont=Consolas
set guifont=Source\ Code\ Pro:h11
set foldmethod=marker

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" smoother redraw assuming fast connection
"set ttyfast
" }}} user interface "

" MacVim-specific {{{ "
if has('gui_macvim')
    autocmd GUIEnter * set vb t_vb=
endif
" }}} MacVim Specific "


" Gnome Terminal-specific {{{ "
" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
" }}} Gnome Terminal-specific "

" tabs and whitespaces {{{ "
" set tab width to 4
set tabstop=4 shiftwidth=4

" tabs = spaces
set expandtab

set autoindent
set smartindent

"set wrap

"set smarttab

"set lbr
"set tw=500
" }}} tabs and whitespaces "

" key bindings {{{ "
set pastetoggle=<leader>p
" Disable F1
noremap <silent> <f1> <nop>
" Clear search expression
noremap <silent> <leader>/ :let @/=""<cr>
"" CTags
"nnoremap <silent> <f12> :!ctags -R<cr>
" Gundo Tree Visualizer
noremap <silent> <leader>h :GundoToggle<cr>
" NERDTree
noremap <silent> <f3> :NERDTreeToggle<cr>
" Tagbar
noremap <silent> <f4> :TagbarToggle<cr>
" taglist
noremap <silent> <f5> :TlistToggle<cr>
" MiniBufferExplorer
noremap <silent> <f2> :MBEToggle<cr>
" Cut
nnoremap <leader>x "*dd
vnoremap <leader>x "*d
" Copy
nnoremap <leader>y "*yy
vnoremap <leader>y "*y
" Paste
nnoremap <leader>v "*P
vnoremap <leader>v "_d<esc>"*P
nnoremap <leader>V "*p
vnoremap <leader>V "_d<esc>"*p
" Save
noremap <leader>w :w<cr>
" Folds
"noremap <leader>sfm :set foldmethod=marker<cr>
" Deletion
noremap <leader>d "_d

autocmd FileType python noremap <leader>r :silent !python % &<cr>
" }}} key bindings "

" YouCompleteMe {{{ "
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_server_use_vim_stdout = 0
let g:ycm_server_keep_logfiles = 1
let g:ycm_python_binary_path = '/usr/local/bin/python3.5'
let g:gist_use_password_in_gitconfig = 1
" }}} YouCompleteMe "

" UltiSnups {{{ "
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsListSnippets="<leader>l"
let g:UltiSnipsJumpForwardTrigger="<leader>j"
let g:UltiSnipsJumpBackwardTrigger="<leader>k"
let g:UltiSnipsEditSplit="vertical"
" }}} UltiSnups "

" io {{{ "
" number of lines of command line history
set history=900

"" auto-switch to each buffer's cwd
set autochdir

"" watch for file changes by other programs
"set autoread

"" auto write files on exit
"set autowrite autowriteall

" persistent undo
set undodir=~/.vim/undo_files
set undofile
" number of undo levels
set undolevels=1000
set undoreload=1000

" disable backup
"set nobackup
"set nowb
"set noswapfile

set backup
set backupdir=~/.vim/backup_files
" change swp file locations
set directory=~/.vim/swap_files

" allow buffer switching without saves
set hidden

"set exrc
"set secure

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"" Use Unix as the standard file type
"set ffs=unix,dos,mac

augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
" }}} io "

" macros {{{ "
" Don't redraw while executing macros (good performance config)
set lazyredraw
" }}} macros "

" search/search and replace {{{ "
" highlight searches
set hlsearch

" case-insensitive search
set ignorecase

set smartcase

" Makes search act like search in modern browsers
set incsearch 

xnoremap * :<c-u>call <SID>VSetSearch()<cr>/<c-r>=@<cr><cr>
xnoremap # :<c-u>call <SID>VSetSearch()<cr>?<c-r>=@<cr><cr>


function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

set gdefault
" }}} search and replace "

" spell-checker {{{ "
set spelllang=en_us

" toggle spell checking
command! -nargs=0 Spl
\ setlocal spell!
" }}} spell-checker "

" commands {{{ "
command! Ww execute "set buftype= | silent w"
command! WriteSudo execute "w !sudo cat >%"

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

function! GlCToPython()
  exe ":%s/;\ze\(\ *#.*\)\?$//e"
  exe ":%s/\/\/\ /# /e"
  exe ":%s/\/\*\ \(.\+\)\ \*\//# \1/e"
  exe ":%s/\V ) {/):/e"
  exe ":%s/}\n//e"
  exe ":%s/\V)\zs {/:/e"
  exe ":%s/void\ze\ /def/e"
  exe ":%s/,\ze[^ ]/, /e"
endfunction

" toggle tab width between 2 and 4 "
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

" toggle what the tab key inserts (e.g. tabs or spaces) "
function! ToggleTabKey()
  if &expandtab
    echo "Disabling expandtab"
    set noexpandtab
  else
    echo "Enabling expandtab"
    set expandtab
  endif
endfunction

function! DeleteTrailingWhiteSpace()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

command! -nargs=0 Tk call ToggleTabKey()

command! -nargs=0 RemoteExtraWhitespace
\ exec ":%s/\s\+$//"

command! -nargs=0 EnablePrintLineNumbers
\ exec ":set printoptions=number:y"

command! -nargs=0 GithubColorScheme
\ exec "noremap <leader>g :colorscheme github<cr>"

command! -nargs=0 CleanCMake
\ exec ":!find\ -iname\ '*cmake*'\ -not\ -name\ CMakeLists.txt\ -exec\ rm\ -rf\ {}\ \\+"

" insert a C++-style UUID identifier at the cursor "
command! -nargs=0 UUID
\ exe ":put! ='" .
\     matchstr(system("uuidgen"), "[^\n\r]*") .
\     "'"

" insert a C++-style UUID identifier at the cursor "
command! -nargs=0 UUname
\ exe ":put! ='uuid_" .
\     substitute(matchstr(system("uuidgen"), "[^\n\r]*"), "-", "_", "ge") .
\     "'"

" insert a C++-style UUID string at the cursor "
command! -nargs=0 UUstr
\ exe ":put! ='\\\"" .
\     matchstr(system("uuidgen"), "[^\n\r]*") .
\     "\\\"'"

" replace %%UUID%% with a UUID "
command! -nargs=0 UUrep
\ exe ":%s/%%UUID%%/" .
\     toupper
\       (substitute(matchstr(system("uuidgen"), "[^\n\r]*"), "-", "_", "ge")) .
\     "/ge"

" auto-replace %%UUID%% with a UUID in C++ and C headers "
au! BufWrite *.ipp,*.hpp,*.hxx,*.hh,*.H,*.h
\ exe ":%s/%%UUID%%/" .
\     toupper
\       (substitute(matchstr(system("uuidgen"), "[^\n\r]*"), "-", "_", "ge")) .
\     "/ge"
" }}} commands "

" filters {{{ "
" AStyle Installation:
" wget --content-disposition http://downloads.sf.net/project/astyle/astyle/astyle%202.05.1/astyle_2.05.1_linux.tar.gz
" tar xf astyle_2.05.1_linux.tar.gz && cd astyle/build/gcc && make && cp bin/astyle ~/.local/bin
" set equalprg=astyle\ --style=linux\ --indent=spaces\ --indent-namespaces\ --indent-labels\ --indent-col1-comments\ --break-blocks=all\ --pad-oper\ --pad-header\ --unpad-paren\ --delete-empty-lines\ --align-pointer=type\ --align-reference=type\ --remove-brackets
autocmd FileType cpp,c,cuda setlocal equalprg=astyle\ --style=linux\ --indent=spaces\ --indent-namespaces\ --indent-labels\ --indent-col1-comments\ --pad-oper\ --pad-header\ --unpad-paren\ --align-pointer=type\ --align-reference=type
autocmd FileType cpp,c,cuda setlocal path+=/usr/local/include,/Library/Developer/CommandLineTools/usr/bin/../lib/clang/6.0/include,/Library/Developer/CommandLineTools/usr/include,/Library/Developer/CommandLineTools/usr/include/c++/v1/,/usr/include,/System/Library/Frameworks,/Library/Frameworks,

autocmd FileType python setlocal equalprg=yapf\ --style='{\ ALIGN_CLOSING_BRACKET_WITH_VISUAL_INDENT:\ True,\ ALLOW_MULTILINE_LAMBDAS:\ True,\ BLANK_LINE_BEFORE_NESTED_CLASS_OR_DEF:\ True,\ COALESCE_BRACKETS:\ True,\ DEDENT_CLOSING_BRACKETS:\ True,\ COLUMN_LIMIT:\ 79,\ DEDENT_CLOSING_BRACKETS:\ True,\ INDENT_DICTIONARY_VALUE:\ True,\ INDENT_WIDTH:\ 4,\ SPACES_AROUND_POWER_OPERATOR:\ True,\ SPACES_AROUND_DEFAULT_OR_NAMED_ASSIGN:\ True,\ SPACES_BEFORE_COMMENT:\ 1,\ SPACE_BETWEEN_ENDING_COMMA_AND_CLOSING_BRACKET:\ True\ }'
" }}} filters "

" vim:ft=vim:
