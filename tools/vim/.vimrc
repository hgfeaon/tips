" 不启用vi兼容模式
set nocompatible
filetype off

" ****************************************************************
"
" vim四个编码参数，enc(encoding), termencoding, fenc(fileencoding), fencs(fileencodings)
" enc(encoding)是vim内部使用的编码，与vim内部所有的buffer，寄存器，脚本中的字符串等相关，作用基本只是显示，不管最后文件是什么编码，vim都会将其转换为当前系统编码来处理，正常的显示出来
set encoding=utf-8
" termencoding 是vim用于屏幕显示的编码，vim会把内部编码转换为屏幕编码再用于输出，如果termencoding没有设置则直接使用encoding，不转码
" 对于gVim，不依赖于term，所以此项无意义
" fenc(fileencoding)当前文件的编码，可以将已经显示的文件保存为不同的编码，在于保存时的编码
set fenc=utf-8
" fencs(fileencodings)打开文件的时候进行解码猜测，有顺序
set fencs=utf-8,gb18030,gb2312,gbk,utf-16,big5,cp936
" 避免windows下菜单和系统提示出现乱码
" set encoding=utf-8
" set langmenu=zh_CN.UTF-8
" language message zh_CN.UTF-8
lang messages zh_CN.UTF-8
" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
" source $VIMRUNTIME/delmenu.vim
" source $VIMRUNTIME/menu.vim
"
" ****************************************************************
"behave mswin

"set diffexpr=MyDiff()
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

"*****************************************************************
" basic settings
"set 行号 number
set nu
"set line & column
set lines=30
set columns=80
"文本编辑设置 
set sw=4 "自动缩进尺寸为4个空格 shiftwidth 当前行交错时使用4个空格
set ts=4 "Tab宽度为4个字符 tabstop
set et "编辑时将所有Tab替换为空格 

"断行设置 
set lbr "不在单词中间断行 
set fo+=mB "打开断行模块对亚洲语言支持 

"C/C++编码设置 
set sm "显示括号配对 showmatch
set cin "打开C/C++风格的自动缩进 cindent
set cino=:0g0t0(sus "设定C/C++风格自动缩进的选项 cinoptions
set ai "打开普通文件类型的自动缩进 autoindent

" 语法高亮
syntax enable
syntax on

"其他设置 
set selectmode= "不使用 selectmode 
set mousemodel=popup "当右键单击窗口的时候，弹出快捷菜单 
set keymodel= "不使用“Shift+方向键”选择文本 
set selection=inclusive "指定在选择文本时，光标所在位置也属于被选中的范围 

" 把jj当做Esc使用
inoremap jj <Esc>

"设置leader
let mapleader = ","

"editing vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

"无备份
set nobackup
"***********************************************************************

"设置fold
"set foldmethod=indent
"alias
"nnoremap <space> za

"******************************************************************
" Ctags settings
"设置常用工程的tags 第一个命令让vim在当前目录下查找tags文件，没找到则递归父目录
"第二个命令让vim修改当前目录。分号必不可少
"查找用<C-]>
"返回用<C-t>或者<C-o>
"局部变量gd
set tags=tags;
set autochdir
"******************************************************************

"***************************************************************
" set Vundle
set rtp+=$HOME/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" original repos on github
" github上的用户写的插件，使用这种用户名+repo名称的方式
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'

" vim-scripts repos
" vimscripts的repo使用下面的格式，直接是插件名称
Bundle 'taglist.vim'
Bundle 'winmanager'
Bundle 'OmniCppComplete'
Bundle 'SuperTab'
Bundle 'pythoncomplete'
Bundle 'Pydiction'
"Bundle 'minibufexplorerpp'
Bundle 'EasyMotion'
"Bundle 'pydoc.vim'
" Bundle 'vimwiki'

" non github reposo
" 非github的插件，可以直接使用其git地址
" Bundle 'git://git.wincent.com/command-t.git'
" ...

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" vundle主要就是上面这个四个命令，例如BundleInstall是全部重新安装，BundleInstall!则是更新
" 一般安装插件的流程为，先BundleSearch一个插件，然后在列表中选中，按i安装
" 安装完之后，在vimrc中，添加Bundle 'XXX'，使得bundle能够加载，这个插件，同时如果
" 需要配置这个插件，也是在vimrc中设置即可
" see :h vundle for more details or wiki for FAQ
"********************************************************************

"*************************************************
" Taglist
"设置F3来开关Taglist窗口 
map <F3> :TlistToggle<cr> 
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
" 空格，显示tag的原型定义
" u，更新taglist中的tag
" o，在新的窗口打开
" t，或者回车，跳到相应位置
" p, 预览位置，不会跳
" s，排序
" +，展开
" -，折叠
" *，全部展开
" =，全部折叠
" q，退出
"*************************************************

"**************************************************
" winmanager
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap <F4> :WMToggle<cr>
"**************************************************

"**************************************************
" OmniCppComplete
filetype plugin indent on
"**************************************************

"**************************************************
" SuperTab
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
"**************************************************

"**************************************************
" STLTags
set tags+=~/.vim/stl_tags
"**************************************************

"**************************************************
" pythoncomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
"**************************************************

"**************************************************
" Pydiction
let g:pydiction_location='~/.vim/bundle/Pydiction/complete-dict'
"**************************************************

"**************************************************
" bufexplorer.zip
"nmap <F6> :BufExplorerHorizontalSplit<cr>
"**************************************************

"**************************************************
" miniBufExpl
"let g:miniBufExplMapWindowNavVim = 1 
"let g:miniBufExplMapWindowNavArrows = 1 
"let g:miniBufExplMapCTabSwitchBufs = 1 
"let g:miniBufExplModSelTarget = 1 
"**************************************************

"**************************************************
" Bundle 'EasyMotion'
let g:EasyMotion_leader_key = "<leader>"
"*****************************************************

"*****************************************************
"设置折行、水平滚动条、配色方案 
if (has("gui_running")) 
" 图形界面下的设置 
    set guioptions+=b 
    colo desert "colorscheme
    set wrap 
else 
" 字符界面下的设置 
    set wrap 
    colo ron 
endif 

"============================================================================= 
" Platform dependent settings 
"============================================================================= 
if (has("win32")) 
    "------------------------------------------------------------------------- 
    " Win32 
    "------------------------------------------------------------------------- 
    if (has("gui_running")) 
        set guifont=Consolas:h12:cANSI 
        set guifontwide="Microsoft YaHei":h10:cGB2312 
    endif 
else 
    if (has("gui_running")) 
        set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
    endif 
endif 
"*******************************************************

"*************************************************
"编译运行函数
func Compile()
exec "w"
"C程序
if &filetype == 'c'
exec "!gcc -Wall % -g -o %<"
"c++程序
elseif &filetype == 'cpp'
exec "!g++ -Wall % -g -o %<"
endif
endfunc
"结束定义CompileRun
"定义Run函数
func Run()
if &filetype == 'c' || &filetype == 'cpp'
exec "!./%<"
endif
endfunc
"结束定义Run

"定义Debug函数，用来调试程序
func Debug()
exec "w"
"C程序
if &filetype == 'c'
exec "!gcc % -g -o %<"
exec "!gdb ./%<"
elseif &filetype == 'cpp'
exec "!g++ % -g -o %<"
exec "!gdb ./%<"
endif
endfunc
"结束定义Debug

"设置编译的快捷键
nnoremap <C-F5> :call Compile()
nnoremap <F5>   :call Run()
nnoremap <F9>   :call Debug()
"***********************************************

"python支持
"set filetype=python
"au BufNewFile,BufRead *.py,*.pyw setf python
