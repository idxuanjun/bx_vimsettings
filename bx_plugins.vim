"-------------------------------------------------------------------------
" @Author  : Xuan Jun (idxuanjun@qq.com)
" @Link    : http://blog.csdn.net/idxuanjun
" @Date    : 2013-04-21
" @Version : 0.1.0
" @Desc    : VIM 插件管理器
"-------------------------------------------------------------------------

"-------------------------------------------------------------------------
" Vundle 插件管理器
"-------------------------------------------------------------------------
" :PluginList     列出已经安装的插件
" :PluginInstall  安装所有配置文件中的插件
" :PluginInstall! 更新所有插件
" :PluginUpdate   更新所有插件
" :PluginSearch   搜索插件
" :PluginClean!   根据配置文件删除插件
"
" set the runtime path to include Vundle and initialize
call vundle#rc(g:plugin_bundle_path)
" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

"-------------------------------------------------------------------------
" Theme 主题
"-------------------------------------------------------------------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'

if v:version > 601
    colorscheme solarized
    "colorscheme molokai
endif

"-------------------------------------------------------------------------
" PowerLine 状态栏
"-------------------------------------------------------------------------
Plugin 'Lokaltog/vim-powerline'

"-------------------------------------------------------------------------
" Indent-Guides 缩进
"-------------------------------------------------------------------------
Plugin 'nathanaelkane/vim-indent-guides'

"-------------------------------------------------------------------------
" FencView 自动识别文件的编码格式
"-------------------------------------------------------------------------
Plugin 'FencView.vim'
"let g:fencview_autodetect=1 " fencview 自动检测每个文件
"
"-------------------------------------------------------------------------
" VimIM_Dict 字典输入
"-------------------------------------------------------------------------
Plugin 'idxuanjun/vimim_dict'

"-------------------------------------------------------------------------
" CtrlP 文件，缓冲区，最近文件管理

"-------------------------------------------------------------------------
Plugin 'ctrlp.vim'

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename = 1

nnoremap <Leader>,f :CtrlP<CR>
nnoremap <Leader>,b :CtrlPBuffer<CR>
nnoremap <Leader>,m :CtrlPMRU<CR>

"-------------------------------------------------------------------------
" Buffer Explorer 缓冲区管理
"-------------------------------------------------------------------------
Plugin 'bufexplorer.zip'

noremap <silent><F3>   <ESC>:BufExplorer<CR>                   " 打开BufExplorer窗口，全屏
"noremap <silent><M-F7> <ESC>:BufExplorerHorizontalSplit<CR>   " 打开BufExplorer窗口，上下分割
"noremap <silent><C-F7> <ESC>:BufExplorerVerticalSplit<CR>     " 打开BufExplorer窗口，左右分割

"-------------------------------------------------------------------------
" NerdTree 文件管理
"-------------------------------------------------------------------------
Plugin 'scrooloose/nerdtree'

" <F4>打开NERDTree窗口，在左侧栏显示  [非插入模式]
noremap <silent> <F4> :NERDTreeToggle<CR>
"设置NERDTree子窗口宽度
let g:NERDTreeWinSize = 30

"-------------------------------------------------------------------------
" FavEx 目录和文件收藏
"-------------------------------------------------------------------------
Plugin 'FavEx'

"-------------------------------------------------------------------------
" NerdCommenter 注释
"-------------------------------------------------------------------------
Plugin 'scrooloose/nerdcommenter'

" Ctrl+E 一步加载语法模板和作者、时间信息
noremap <C-E> <ESC>:LoadTemplate<CR><ESC>:AuthorInfoDetect<CR><ESC>i
inoremap <C-E> <ESC>:LoadTemplate<CR><ESC>:AuthorInfoDetect<CR><ESC>i

"-------------------------------------------------------------------------
" load_template 加载文件模板
"-------------------------------------------------------------------------
Plugin 'load_template'

"-------------------------------------------------------------------------
" AuthorInfo 自动生成/更新文件的作者信息
"-------------------------------------------------------------------------
Plugin 'AuthorInfo'

" Vundle 无法装载 AuthorInfo，手工载入
if !exists('g:loaded_authorinfo')
    let plugin_auth_file = g:plugin_bundle_path . 'AuthorInfo/ftplugin/authorinfo.vim'
    if filereadable(plugin_auth_file)
        exec 'source ' . plugin_auth_file
    endif
    unlet plugin_auth_file
endif

"-------------------------------------------------------------------------
" snipMate 自动补全
"-------------------------------------------------------------------------
Plugin 'snipMate'

"-------------------------------------------------------------------------
" Tagbar 标签函数
"-------------------------------------------------------------------------
Plugin 'Tagbar'

" <F8> 打开关闭Tagbar窗口，在右侧栏显示   [非插入模式]
nnoremap <silent><F2> :TagbarToggle<CR>

"设置宽度，默认为30
let g:tagbar_width = 30
" Tagbar窗口放在右侧
let g:tagbar_right = 1
" Tagbar打开后自动获得焦点
let g:tagbar_autofocus = 1

"增加tagbar对golang的支持
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
"增加tagbar对markdown的支持
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }
"增加tagbar对markdown的支持
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

"-------------------------------------------------------------------------
" Markdown
"-------------------------------------------------------------------------
Plugin 'plasticboy/vim-markdown'

nnoremap <Leader>,mc :execute '! ' . EncToChs(s:markdown_py . ' -e chinese -o xhtml1 ' . expand('%') . ' -f ' . expand('%:t:r') . '.html')<CR>
nnoremap <Leader>,mu :execute '! ' . EncToChs(s:markdown_py . ' -e utf-8 -o xhtml1 ' . expand('%') . ' -f ' . expand('%:t:r') . '.html')<CR>
nnoremap <Leader>,mv :execute '! ' . EncToChs('start ./' . expand('%:t:r') . '.html')<CR>

"-------------------------------------------------------------------------
" GoLang
"-------------------------------------------------------------------------
Plugin 'jnwhiteh/vim-golang'
if exists($GOROOT)
    set runtimepath+=$GOROOT/misc/vim
endif

"-------------------------------------------------------------------------
" ruby
"-------------------------------------------------------------------------
Plugin 'vim-ruby/vim-ruby'
