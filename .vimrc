set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'jeaye/color_coded'
" Plugin 'rdnetto/YCM-Generator'
Plugin 'altercation/vim-colors-solarized'
Plugin 'junegunn/goyo.vim'
Plugin 'amix/vim-zenroom2'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'ervandew/supertab'
Plugin 'Yggdroot/indentLine'

" for vim snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on

set encoding=utf-8
set fileencoding=utf-8

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" fix weird XFCE terminal errors with solarized
set nu
syntax enable
set background=dark
colorscheme solarized
set t_Co=256

" define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred

" weird hacky fix for Backspace 
func Backspace()
	if col('.') == 1
		if line('.') == 1
			return "\<ESC>kA\<Del>"
		else
			return ""
		endif
	else
		return "\<Left>\<Del>"
	endif
endfunc	
		
inoremap <BS> <c-r>=Backspace()<CR>

" set default tabsize to 4
set tabstop=4
set softtabstop=4
set shiftwidth=4

" PEP8 Indentation
au! BufNewFile,BufRead *.py,*.c,*.h
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |

" Flag extra white space python & C
au! BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Proper indention for full stack
au! BufNewFile,BufRead *.js,*.html,*.css
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2 |

" You Complete me
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf='/home/zander/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_enable_diagnostic_signs=0

" Color coded
" let g:color_coded_filetypes=['c', 'cpp']

" Make code look nice
let python_highlight_all=1

" Hide .pyc files from NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" fix airline
set laststatus=2

" for goyo zenmode
nnoremap <silent> <leader>z :Goyo<CR> " \z

" syntatic config
" Don't like interference with goyo disabling for now
"
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_check_on_open=1
" let g:syntastic_check_on_wq=0

" vim expand region mapping
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink) 

" make ultisnips play nice with ycm
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType='<C-n>'

" better key bindings for ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" python execution short cut
nnoremap <silent> <F5> :!clear;python %<CR>

" indentLine customization
let g:indetLine_char='¦'
