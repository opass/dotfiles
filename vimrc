set nocompatible              " be iMproved, required
filetype off                  "required

call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plug 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plug 'chriskempson/base16-vim'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do':'./install --all'}
Plug 'junegunn/fzf.vim'

Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
" Plug 'majutsushi/tagbar'
Plug 'ramitos/jsctags'
Plug 'jiangmiao/auto-pairs'
" for auto detect indentation
Plug 'tpope/vim-sleuth'

Plug 'mkitt/tabline.vim'

call plug#end()

" All of your Plugins must be added before the following line
"
"
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set tabstop=4
set shiftwidth=4  " when pressing enter in {|}, it will indent 4
set expandtab
set nu

" set vim to support 256 color schme
set t_Co=256
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" 顯示空白和tab
" set list會用下方字元顯示tab和空白
" set nolist恢復正常
set listchars=tab:>-,space:.

set hlsearch  " Search highlight

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhiteSpace /\s\+$/ " Show trailing white space
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()


let g:airline#extensions#tabline#tab_nr_type = 1  "for tab no.
let g:airline_powerline_fonts = 1
" --------------------below is by thought-bot-----------------------
"  Leader
"let mapleader = " "
"
"set backspace=2   " Backspace deletes like most programs in insert mode "set nobackup "set nowritebackup "set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
"set history=50
"set ruler         " show the cursor position all the time
"set showcmd       " display incomplete commands
"set incsearch     " do incremental searching
"set laststatus=2  " Always display the status line
"set autowrite     " Automatically :write before running commands
"
"" Switch syntax highlighting on, when the terminal has colors
"" Also switch on highlighting the last used search pattern.
"if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
"  syntax on
"endif
"
"if filereadable(expand("~/.vimrc.bundles"))
"  source ~/.vimrc.bundles
"endif
"
"" Load matchit.vim, but only if the user hasn't installed a newer version.
"if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
"  runtime! macros/matchit.vim
"endif
"
"filetype plugin indent on
"
"augroup vimrcEx
"  autocmd!
"
"  " When editing a file, always jump to the last known cursor position.
"  " Don't do it for commit messages, when the position is invalid, or when
"  " inside an event handler (happens when dropping a file on gvim).
"  autocmd BufReadPost *
"    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
"    \   exe "normal g`\"" |
"    \ endif
"
"  " Set syntax highlighting for specific file types
"  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
"  autocmd BufRead,BufNewFile *.md set filetype=markdown
"  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
"
"  " ALE linting events
"  if g:has_async
"    set updatetime=1000
"    let g:ale_lint_on_text_changed = 0
"    autocmd CursorHold * call ale#Lint()
"    autocmd CursorHoldI * call ale#Lint()
"    autocmd InsertEnter * call ale#Lint()
"    autocmd InsertLeave * call ale#Lint()
"  else
"    echoerr "The thoughtbot dotfiles require NeoVim or Vim 8"
"  endif
"augroup END
"
"" When the type of shell script is /bin/sh, assume a POSIX-compatible
"" shell for syntax highlighting purposes.
"let g:is_posix = 1
"
"" Softtabs, 2 spaces
"set tabstop=2
"set shiftwidth=2
"set shiftround
"set expandtab
"
"" Display extra whitespace
"set list listchars=tab:»·,trail:·,nbsp:·
"
"" Use one space, not two, after punctuation.
"set nojoinspaces
"
"" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
"if executable('ag')
"  " Use Ag over Grep
"  set grepprg=ag\ --nogroup\ --nocolor
"
"  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'
"
"  " ag is fast enough that CtrlP doesn't need to cache
"  let g:ctrlp_use_caching = 0
"
"  if !exists(":Ag")
"    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
"    nnoremap \ :Ag<SPACE>
"  endif
"endif
"
"" Make it obvious where 80 characters is
"set textwidth=80
"set colorcolumn=+1
"
"" Numbers
"set number
"set numberwidth=5
"
"" Tab completion
"" will insert tab at beginning of line,
"" will use completion if not at beginning
"set wildmode=list:longest,list:full
"function! InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"    else
"        return "\<c-p>"
"    endif
"endfunction
"inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <S-Tab> <c-n>
"
"" Switch between the last two files
"nnoremap <Leader><Leader> <c-^>
"
"" Get off my lawn
"nnoremap <Left> :echoe "Use h"<CR>
"nnoremap <Right> :echoe "Use l"<CR>
"nnoremap <Up> :echoe "Use k"<CR>
"nnoremap <Down> :echoe "Use j"<CR>
"
"" vim-test mappings
"nnoremap <silent> <Leader>t :TestFile<CR>
"nnoremap <silent> <Leader>s :TestNearest<CR>
"nnoremap <silent> <Leader>l :TestLast<CR>
"nnoremap <silent> <Leader>a :TestSuite<CR>
"nnoremap <silent> <Leader>gt :TestVisit<CR>
"
"" Run commands that require an interactive shell
"nnoremap <Leader>r :RunInInteractiveShell<space>
"
"" Treat <li> and <p> tags like the block tags they are
"let g:html_indent_tags = 'li\|p'
"
"" Open new split panes to right and bottom, which feels more natural
"set splitbelow
"set splitright
"
"" Quicker window movement
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l
"
"" Move between linting errors
"nnoremap ]r :ALENextWrap<CR>
"nnoremap [r :ALEPreviousWrap<CR>
"
"" Set spellfile to location that is guaranteed to exist, can be symlinked to
"" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
"set spellfile=$HOME/.vim-spell-en.utf-8.add
"
"" Autocomplete with dictionary words when spell check is on
"set complete+=kspell
"
"" Always use vertical diffs
"set diffopt+=vertical

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
