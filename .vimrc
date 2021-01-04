" basic configuration
set nocompatible
set number relativenumber
set nowrap
set showcmd
map q :quit<CR>
set incsearch
set wildmenu
set laststatus=2
set title
syntax on 
filetype plugin indent on

" space and indentation
set autoindent
set shiftwidth=4
set tabstop=4
set smartindent
set expandtab

" CoC
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=number

" nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree | wincmd p

noremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'vim-syntastic/syntastic'
Plug 'editorconfig/editorconfig-vim'
Plug 'preservim/nerdtree'

" Colorschemes
Plug 'https://gitlab.com/rj-white/waterfall.vim'
Plug 't184256/vim-boring'
Plug 'andreasvc/vim-256noir'
Plug 'cseelus/vim-colors-lucid'
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'nightsense/carbonized'

" language specific
Plug 'udalov/kotlin-vim'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
call plug#end()

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" colors and themes
colorscheme iceberg
set background=dark
