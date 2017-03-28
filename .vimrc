#v0.9
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/a.vim'

Plug 'https://github.com/bling/vim-airline.git'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

Plug 'junegunn/vim-easy-align'
" Plugin options
Plug 'nsf/gocode', { 'rtp': 'vim' }

Plug 'https://github.com/luofei614/vim-plug', { 'dir':'~/.vim/my'}

Plug 'AutoComplPop'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" king add
Plug 'Tagbar'

Plug 'L9'


Plug 'mhinz/vim-signify'

"bookmark  mm 添加书签,  mn 移动书签  mp 移动到前一个书签  ma 删除所有书签
Plug 'MattesGroeger/vim-bookmarks'


Plug 'Mark'

"snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'https://github.com/bonsaiben/bootstrap-snippets.git'


"快速跳转到字符
Plug 'EasyMotion'

" 快速搜索
Plug 'ctrlpvim/ctrlp.vim'

" 模糊搜索当前文件中所有函数
Plug 'tacahiroy/ctrlp-funky'


"检查程序语法错误
Plug 'https://github.com/scrooloose/syntastic.git'

let g:gruvbox_contrast_dark='hard'
Plug 'morhetz/gruvbox'

Plug 'aceofall/gtags.vim'

Plug 'tranngocthachs/gtags-cscope-vim-plugin'

" Code Sreach 
Plug 'rking/ag.vim'
call plug#end()

" 基本设置
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
" 配色
set t_Co=256
let g:solarized_termcolors=16
colorscheme gruvbox
set background=dark


"autocomplpop 设置
let g:AutoComplPop_IgnoreCaseOption=1
set ignorecase
let g:acp_behaviorKeywordCommand="\<C-n>"

"搜索高亮
set hlsearch

"设置NERDTreetagbar的宽度
let g:NERDTreeWinSize = 30
let g:NERDTreeShowBookmarks=1
let g:tagbar_width=30

" 设置<leader> 为空格键
let mapleader=" "

" 设置<localleader> 为 '-' key
let maplocalleader="-"

" 打开NERDTree和Tagbar
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>e :NERDTreeToggle<CR> 
"快速生成tag文件
nnoremap <leader>g :! gtags <CR>

set cscopetag                  " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope'   " 使用 gtags-cscope 代替 cscope


" gtags
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1


nnoremap <leader><Right> <C-w>l
nnoremap <leader><Left> <C-w>h
nnoremap <leader><Up> <C-w>k
nnoremap <leader><Down> <C-w>j
map <leader>fs :Ag <CR>
map <leader>a :A <CR>

" GTAGS
nnoremap <leader>i <C-]>
nnoremap <leader>o <C-t>

"快速关闭
nnoremap <leader>q :qa<CR>

"删除不剪切, rd
nnoremap r "_d
vnoremap r "_d

map <C-V> "+pa<Esc>
map! <C-V> <Esc>"+pa

map <C-C> "+y
map <C-X> "+x

" 映射全选 ctrl+a

map <C-A> ggVG
map! <C-A> <Esc>ggVG

"ctrl+s为保存
map <C-S> :w<CR>
inoremap <C-S> <C-O>:w<CR>

"ctrl+z撤销
map <C-Z> :u<CR>
map! <C-Z> <C-O>:u<CR>

"双击时高亮
map <2-leftmouse> \m
inoremap <2-leftmouse> <Esc>\m

"ctrl+鼠标左键跳转

"--------------------
" Function: Open tag under cursor in new tab
" Source:   http://stackoverflow.com/questions/563616/vimctags-tips-and-tricks
"--------------------
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"--------------------
" Function: Remap keys to make it more similar to firefox tab functionality
" Purpose:  Because I am familiar with firefox tab functionality
" 切换tab页 用gt
"--------------------


function! InsertTabWrapper()
    let col=col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<TAB>"
    else
        return "\<C-x>\<C-o>"
    endif
endfunction
"按tab键，全能提示，
"注意要用inoremap，不能用map！，如果用map！在命令模式下tab键没有提示功能。
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>
"shift+tab 展开代码片段
imap <S-TAB> <Plug>snipMateNextOrTrigger

"支持鼠标
set mouse=a
" 多行缩进
vnoremap <Tab> >
vnoremap <S-Tab> <

"语法高亮
syntax enable
syntax on
set autoindent
set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
"加快速度
"set synmaxcol=200
set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
set scrolljump=5

"删除键
set backspace=eol,start,indent

"设置airline
let g:airline_theme="gruvbox"
let g:airline_powerline_fonts = 1
" tmuxline
let g:airline#extensions#tmuxline#enabled = 0

" 用数字切换buffer页面 使用vim-airline，主要是设置tabline扩展
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1

" let g:bufferline_show_bufnr = 0
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


" 关闭状态显示空白符号计数
" let g:airline#extensions#whitespace#enabled = 0
" let g:airline#extensions#whitespace#symbol = '!'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''



" 配置CtrlP 
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
" nnoremap <leader>f :CtrlPMRU<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
            \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
            \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


nnoremap <Leader>f :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fu :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']

" EasyMotion 配置
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>s <Plug>(easymotion-s)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)
