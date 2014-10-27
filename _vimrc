set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
"--------个人配置--------------
execute pathogen#infect()
colorscheme Molokai "设置配色方案
let g:molokai_original = 1

filetype on
set smartindent "设置智能缩进
set shortmess=atI "去掉欢迎界面
"colorscheme monokai "sublime的配色方案
set guifont=YaHei\ Consolas\ Hybrid:h12 "字体与字号
"set guifont=Consolas:h14
set tabstop=4 " 设置tab键的宽度
set shiftwidth=4 " 换行时行间交错使用4个空格
set autoindent " 自动对齐
set backspace=2 " 设置退格键可用
set cindent shiftwidth=4 " 自动缩进4空格
set smartindent " 智能自动缩进
set ai! " 设置自动缩进
set nu! " 显示行号
set mouse=a " 启用鼠标
set ruler " 右下角显示光标位置的状态行
set incsearch " 查找book时，当输入/b时会自动找到
set hlsearch " 开启高亮显示结果
set incsearch " 开启实时搜索功能
set nowrapscan " 搜索到文件两端时不重新搜索
set nocompatible " 关闭兼容模式
set vb t_vb= " 关闭提示音
set hidden " 允许在有未保存的修改时切换缓冲区
set noswapfile
"set list " 显示Tab符，使用一高亮竖线代替
"set listchars=tab:|\,
"set listchars=tab:>-,trail:-
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
syntax enable " 打开语法高亮
syntax on " 开启文件类型侦测
filetype indent on " 针对不同的文件类型采用不同的缩进格式
filetype plugin on " 针对不同的文件类型加载对应的插件
filetype plugin indent on " 启用自动补全
set nobackup "不生成备份文件
" 我的状态行显示的内容（包括文件类型和解码）
"set statusline=[FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

set directory=.,$TEMP
"gvim 版本为7.3.46
set encoding=utf-8
set fileencodings=utf-8,gbk,gb18030,gk2312
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8

"自动命令，每次写入.vimrc后，都会执行这个自动命令，source一次~/.vimrc
"autocmd! bufwritepost .vimrc source ~/.vimrc

" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
"autocmd VimEnter * NERDTree

" 按下 F2 调出/隐藏 NERDTree
"nmap <F2>:silent! NERDTreeToggle

" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
"let NERDTreeWinPos="right"

" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1

nmap <F9> <Esc>:!ctags -R *<CR>

"设置Taglist
" 这项必须设定，否则出错,配置taglist的ctags路径
let Tlist_Ctags_Cmd = 'D:\ctags58\ctags.exe'
 
" 不同时显示多个文件的 tag ，只显示当前文件的
let Tlist_Show_One_File=1

"如果 taglist 窗口是最后一个窗口，则退出 vim
let Tlist_Exit_OnlyWindow=1

"让当前不被编辑的文件的方法列表自动折叠起来
let Tlist_File_Fold_Auto_Close=1

"把taglist窗口放在屏幕的右侧，缺省在左侧 
let Tlist_Use_Right_Window=1 

"显示taglist菜单
let Tlist_Show_Menu=1

"启动vim自动打开taglist
"let Tlist_Auto_Open=1

filetype plugin on                                             
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
