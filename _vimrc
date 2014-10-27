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
"--------��������--------------
execute pathogen#infect()
colorscheme Molokai "������ɫ����
let g:molokai_original = 1

filetype on
set smartindent "������������
set shortmess=atI "ȥ����ӭ����
"colorscheme monokai "sublime����ɫ����
set guifont=YaHei\ Consolas\ Hybrid:h12 "�������ֺ�
"set guifont=Consolas:h14
set tabstop=4 " ����tab���Ŀ��
set shiftwidth=4 " ����ʱ�м佻��ʹ��4���ո�
set autoindent " �Զ�����
set backspace=2 " �����˸������
set cindent shiftwidth=4 " �Զ�����4�ո�
set smartindent " �����Զ�����
set ai! " �����Զ�����
set nu! " ��ʾ�к�
set mouse=a " �������
set ruler " ���½���ʾ���λ�õ�״̬��
set incsearch " ����bookʱ��������/bʱ���Զ��ҵ�
set hlsearch " ����������ʾ���
set incsearch " ����ʵʱ��������
set nowrapscan " �������ļ�����ʱ����������
set nocompatible " �رռ���ģʽ
set vb t_vb= " �ر���ʾ��
set hidden " ��������δ������޸�ʱ�л�������
set noswapfile
"set list " ��ʾTab����ʹ��һ�������ߴ���
"set listchars=tab:|\,
"set listchars=tab:>-,trail:-
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
syntax enable " ���﷨����
syntax on " �����ļ��������
filetype indent on " ��Բ�ͬ���ļ����Ͳ��ò�ͬ��������ʽ
filetype plugin on " ��Բ�ͬ���ļ����ͼ��ض�Ӧ�Ĳ��
filetype plugin indent on " �����Զ���ȫ
set nobackup "�����ɱ����ļ�
" �ҵ�״̬����ʾ�����ݣ������ļ����ͺͽ��룩
"set statusline=[FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

set directory=.,$TEMP
"gvim �汾Ϊ7.3.46
set encoding=utf-8
set fileencodings=utf-8,gbk,gb18030,gk2312
"����˵�����
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"���consle�������
language messages zh_CN.utf-8

"�Զ����ÿ��д��.vimrc�󣬶���ִ������Զ����sourceһ��~/.vimrc
"autocmd! bufwritepost .vimrc source ~/.vimrc

" �� vim ������ʱ��Ĭ�Ͽ��� NERDTree��autocmd ������дΪ au��
"autocmd VimEnter * NERDTree

" ���� F2 ����/���� NERDTree
"nmap <F2>:silent! NERDTreeToggle

" �� NERDTree �Ĵ��������� vim ���ڵ��ҲࣨĬ��Ϊ��ࣩ
"let NERDTreeWinPos="right"

" ���� NERDTree ����ʱ���Զ���ʾ Bookmarks
let NERDTreeShowBookmarks=1

nmap <F9> <Esc>:!ctags -R *<CR>

"����Taglist
" ��������趨���������,����taglist��ctags·��
let Tlist_Ctags_Cmd = 'D:\ctags58\ctags.exe'
 
" ��ͬʱ��ʾ����ļ��� tag ��ֻ��ʾ��ǰ�ļ���
let Tlist_Show_One_File=1

"��� taglist ���������һ�����ڣ����˳� vim
let Tlist_Exit_OnlyWindow=1

"�õ�ǰ�����༭���ļ��ķ����б��Զ��۵�����
let Tlist_File_Fold_Auto_Close=1

"��taglist���ڷ�����Ļ���Ҳ࣬ȱʡ����� 
let Tlist_Use_Right_Window=1 

"��ʾtaglist�˵�
let Tlist_Show_Menu=1

"����vim�Զ���taglist
"let Tlist_Auto_Open=1

filetype plugin on                                             
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
