
call pathogen#infect()

" (mt) Recommended
syntax on
set ruler

" solarized scheme
syntax enable
set background=dark
" 256 for 256 color terms
let g:solarized_termcolors=256
" for transparent backgrouns, if there are display issues
"let g:solarized_termtrans=1
colorscheme solarized


" From Perl Best Practices
set autoindent
"set textwidth=78
set backspace=indent,eol,start

set tabstop=4
set expandtab
set shiftwidth=4
set shiftround

" lower case search = case insensitive
" search string with uppercase = case sensitive
set ignorecase
set smartcase

" hides buffers instead of closing, so you can :e a new file from a buffer w/unsaved changes w/o being forced to save changes
set hidden

" this might solve the :W problems, since now it's ;w - no more SHIFT key!
noremap ; :


" scroll page up/down when cursor gets close to edge of screen
set scrolloff=3

"I keep hitting Q and F1 by accident
map <F1> <ESC>
imap <F1> <ESC>
map Q <ESC>

set matchpairs+=<:>



"""
""" Custom Commands
"""

" press F2 when pasting in text to avoid autoformatting problems
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O><F2>
set pastetoggle=<F2>

" for when you forget to sudo vi a file
cmap w!! w !sudo tee % >/dev/null

" use ,w or ,W ,b ,B ,e  ,E to jump around easily
let g:EasyMotion_leader_key = '\' 

" perl tidy
map ,pt :%!perltidy -pbp -q -l=100<CR>

map ,tp :!perltidy -pbp -q -l=100<CR>

" check syntax of a perl file
map ,pc :! clear; perl -cw %<CR>

" open directory listing for current buffer
map ,dl :e %:p:h<CR>

" open/close the tag bar
nmap <F8> :TagbarToggle<CR>


"""
""" End Custom Commmands
"""

" perl block folder (optionally uncomment the following lines)
"let perl_fold = 1
"set foldmethod=marker
"set foldlevel=1
"highlight Folded ctermbg=cyan ctermfg=black

" prevent fat-fingering the SHIFT key from causing problems
:command WQ wq
:command Wq wq
:command W w
:command Q q

" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" syntastic stuff
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
" don't run syntastic on vimdiffs
if &diff
    " silence syntastic
    let g:loaded_syntastic_plugin = 1
endif


" Python
source ~/.vim/python.vim

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Reduces delay when entering/exiting insert mode
" Required for vim airline plugin
set ttimeoutlen=50

" Fixes issue with vim-airline status bar not showing up
set laststatus=2

let g:airline_theme='solarized'


let g:syntastic_perl_lib_path = ['.', '..', '../lib', './lib' ]
