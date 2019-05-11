" vimrc file
"
" Windowsでは、$HOME/vimfiles/vimfiles
" Unixでは、$HOME/.vim/vimfiles
" に配置されるようにgit cloneする。
" :h vimrc

scriptencoding utf-8

" パス設定

if has("win32")
	let s:cygpath = ""
	let s:cygpath_list = [
				\'D:/cygwin',
				\'C:/cygwin',
				\'D:/cygwin64',
				\'C:/cygwin64',
				\]
	for path in s:cygpath_list
		if isdirectory(path)
			let s:cygpath = path
			break
		endif
	endfor
	if s:cygpath != ""
		let $PATH = $PATH . ";" . s:cygpath . '/bin' . ";"
	endif
	if isdirectory($HOME . '/vimfiles')
		let $VIMFILES = $HOME . '/vimfiles'
	else
		let $VIMFILES = $VIM . '/vimfiles'
	endif
else
	let $VIMFILES = $HOME . '/.vim'
endif
"set path=.,include,,


if has("gui_running")
	gui
	set title
	set columns=120 lines=70
	set cmdheight=1

	if has("win32")
		set guifont=MS_Gothic:h10
		set guifontwide=MS_Gothic:h10
		set printfont=MS_Gothic:h10:cSHIFTJIS
		set shellslash
	endif
endif
syntax on


" カラー設定

if isdirectory($VIMFILES . "/colors") && has("gui_running")
	silent! colorscheme mycolor
	" 全角スペースを色を変えて表示させる
	hi ZenkakuSpace ctermbg=darkBlue guibg=darkBlue
	autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
else
	" silent! colorscheme peachpuff
	hi NonText    ctermfg=gray guifg=gray guibg=NONE gui=NONE
	hi SpecialKey ctermfg=gray guifg=gray guibg=NONE gui=NONE
endif


" オプション設定

set nocompatible
set textwidth=0 " 自動改行無効
set tabstop=4 " タブ幅
set shiftwidth=4 " インデントのシフト幅
set softtabstop=0 " タブ入力時、スペースと組み合わせない
set noexpandtab
set listchars=tab:^\ ,eol:↲
set list
set ruler
set number
set laststatus=2
set showmode
set showcmd
set showmatch
set visualbell t_vb= " ビープ音を鳴らさない(画面フラッシュもしない)
set backspace=indent,eol,start " 挿入開始以前の文字や改行も削除
set nobackup
set hidden " バッファを切り替えても、 undo の効力を失わないようにする
set confirm " ファイルを上書きするのにダイアログを出す
set nowrapscan " 検索で巡回する機能をオフにする
set statusline=%n:\ %<%f%y\ %m%r[%{has('multi_byte')&&\ &fileencoding!=''?&fileencoding:&encoding}][%{&fileformat}]\ 0x%B=%b%=%l,%c\ %P
set noautoindent
set smartindent
set cinoptions=:0,g0 " caseやpublicなどのインデントの設定
set whichwrap=h,l,b,s " 左右カーソル移動で行を越えて移動できる
set incsearch
set hlsearch
set history=500
set wrap
set ignorecase
set completeopt=menuone,longest " 挿入モードの補完で最長の共通部分までを挿入
set guioptions=aerL " メニューバー、ツールバー非表示。ビジュアルモード選択部分をクリップボードに自動コピー。タブをGUI表示。
set foldcolumn=2
set tags=./tags; " タグファイルをカレントディレクトリから遡って検索する
set nrformats-=octal " <C-A>で8進数の計算をさせない
set formatoptions+=M " formatで行連結時、行末か行頭のどちらか片方がマルチバイト文字ならばスペースは挿入しない
set formatoptions-=tc " 自動整形をしない
set diffopt+=vertical
set sessionoptions=buffers,curdir,slash,unix " Session.vimにはバッファとカレントディレクトリのみ含める
set mousemodel=popup " マウスの右クリックでポップアップメニューを表示する
set noswapfile
set noundofile
set directory=$VIMFILES " swapファイル作成ディレクトリ
set undodir=$VIMFILES " undofile作成ディレクトリ
set scrolloff=0
if has("win32")
	" set renderoptions=type:directx,renmode:5
	if s:cygpath != ""
		" set shell=bash\ --rcfile\ $HOME/.bash_profile
		set grepprg=grep\ -n\ -I " grepでバイナリファイルを無視する。Windowsでfindstrを使わない
	endif
endif


" 印刷関連

set printoptions+=left:20pt,right:20pt
set printoptions+=wrap:y
set printoptions+=number:y
set printoptions+=syntax:n


" 文字エンコーディング・改行関連
" 'encoding'はutf-8であること
" KaoriYa版では、$VIM/switches/catalog/utf-8.vim を  $VIM/switches/enabled/ に置く。

if has("win32")
	set fileencoding=cp932
	set fileencodings=ucs-bom,utf-8,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
else
	set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
endif



" キーマッピング

nnoremap <C-H> <ESC>:bp<CR>
nnoremap <C-L> <ESC>:bn<CR>
nnoremap <C-LEFT> <ESC>:bp<CR>
nnoremap <C-RIGHT> <ESC>:bn<CR>
nnoremap <HOME> <ESC>:bp<CR>
nnoremap <END> <ESC>:bn<CR>
nnoremap <C-UP> <C-Y>
nnoremap <C-DOWN> <C-E>
nnoremap <C-]> g<C-]>
nnoremap <C-C> <C-W>c
nnoremap <C-N> :cn<CR>
nnoremap <C-P> :cp<CR>
nnoremap <ESC> <ESC>:noh<CR>
" 全角スペースを入力しない
inoremap 　 <Space>

" 選択したテキストを検索に使用する
vnoremap / y/<C-R>"<CR>
" 直前にヤンクした単語とカーソル上の単語を入れ替える(バッファはそのまま)
nnoremap \sw Pldebye

" 選択したテキストを/*...*/で囲む
vnoremap \a <ESC>`>a*/<ESC>`<i/*<ESC>
" 選択したテキスト内の/*...*/を全て解除
vnoremap \d :s/\/\*<SPACE>\\|<SPACE>\*\/\\|\/\*\\|\*\///g<CR>`<:noh<CR>
" 挿入モードでカーソル位置に/*  */を挿入
inoremap <C-C> /*<SPACE><SPACE>*/<LEFT><LEFT><LEFT>

" 挿入モードでカーソル位置に//を挿入
inoremap <C-U> //!<SPACE>
inoremap <C-O> //<SPACE>

inoremap <C-T> _T("")<ESC>hi


if !has('kaoriya')
	" :CdCurrent
	"   Change current directory to current file's one.
	command! -nargs=0 CdCurrent cd %:p:h
	" :Undiff
	"   Turn off diff mode for current buffer.
	command! -nargs=0 Undiff set nodiff noscrollbind wrap
endif


" 右クリックメニューにタグジャンプから戻るを追加。
menu .8 PopUp.Pop\ Tag\ Stack\ <C-T>	<C-T>
menu .9 PopUp.-SEP3-	<Nop>


" ファイルタイプの追加

autocmd FileType text setl sts=2 sw=2 et tw=0

autocmd FileType mail setl sts=2 sw=2 et tw=0

autocmd FileType vim setl iskeyword-=:,#

au BufNewFile,BufRead *.mot	setf mot

au! BufNewFile,BufRead *.inf,*.INF
au BufNewFile,BufRead *.inf,*.INF		setf dosini

au! BufNewFile,BufRead *.src,*.SRC
au BufNewFile,BufRead *.src,*.SRC		setf asm

au! BufNewFile,BufRead *.scr,*.SCR
au BufNewFile,BufRead *.scr,*.SCR		setf ld

au! BufNewFile,BufRead *.xaml,*.XAML
au BufNewFile,BufRead *.xaml,*.XAML		setf xml
au BufNewFile,BufRead *.xaml,*.XAML		setl et

au! BufNewFile,BufRead *.cs
au BufNewFile,BufRead *.cs		setl et


" CppUTest用テンプレート
function! s:cpputest_template()
	let name = expand("%:t:r")
	let str = "#include \"CppUTest/TestHarness.h\"\n" .
			 \"#include \"CppUTestExt/MockSupport.h\"\n" .
			 \"\n" .
			 \"\n" .
			 \"TEST_GROUP(" . name . ")\n" .
			 \"{\n" .
			 \"void setup()\n" .
			 \"{\n" .
			 \"}\n" .
			 \"void teardown()\n" .
			 \"{\n" .
			 \"mock().checkExpectations();\n" .
			 \"mock().clear();\n" .
			 \"}\n" .
			 \"};\n" .
			 \"\n" .
			 \"TEST(" . name . ", )\n" .
			 \"{\n" .
			 \"}\n" .
			 \"\n" 
	exe "normal i" . str
endfunction
command! -nargs=0 CppUTestTemplate call s:cpputest_template()

" バッファ内の関数定義等をQuickFixで開く
function! s:Qdef()
	if &ft ==? "c" || &ft ==? "cpp"
		vimgrep /^[^ \t#/\\*]\+[0-9A-Za-z_ :\t\\*]\+([^;]*$/j %
	elseif &ft ==? "go"
		vimgrep /^\(func\|type\)[ \t]\+[^{]*{$/j %
	elseif &ft ==? "lua"
		vimgrep /function[ \t]\+.*$/j %
	elseif &ft ==? "ruby"
		vimgrep /^[ \t]*\(class\|module\|def\|alias\)[ \t]\+.*$/j %
	elseif &ft ==? "python"
		vimgrep /^[ \t]*\(class\|def\)[ \t]\+[^:]*:$/j %
	endif
	cw
endfunction
command! -nargs=0 Qdef call s:Qdef()



" プラグインの設定

" プラグイン管理の参考元:
" https://github.com/daisuzu/dotvim
" https://vimconf.org/2018/slides/Migrating_plugins_to_standard_features.pdf
"
" 新しいVim環境を作ったら、:call InstallPackPlugins() を実行する。
" optのプラグインを使う時は、:packadd プラグイン名 を実行する。
let s:pack_path = $VIMFILES . '/pack/bundle'
let s:plugins = {'start': [], 'opt': []}
let s:github_com = 'https://github.com/'

" call add(s:plugins.start, s:github_com.'vim-scripts/taglist.vim') " GitHubのリポジトリが古いので、直接vim.orgの最新を追加している。
call add(s:plugins.start, s:github_com.'vim-scripts/minibufexpl.vim')
call add(s:plugins.start, s:github_com.'vim-scripts/a.vim')
call add(s:plugins.start, s:github_com.'vim-scripts/camelcasemotion')
call add(s:plugins.start, s:github_com.'vim-scripts/DirDiff.vim')
call add(s:plugins.start, s:github_com.'vim-scripts/DoxygenToolkit.vim')
call add(s:plugins.start, s:github_com.'vim-scripts/grep.vim')
call add(s:plugins.start, s:github_com.'qpkorr/vim-renamer')
call add(s:plugins.start, s:github_com.'vim-scripts/SrcExpl')
call add(s:plugins.start, s:github_com.'junegunn/vim-easy-align')
call add(s:plugins.start, s:github_com.'jlanzarotta/bufexplorer')
call add(s:plugins.start, s:github_com.'vim-scripts/CRefVim')
call add(s:plugins.start, s:github_com.'deton/eblook.vim')
call add(s:plugins.start, s:github_com.'hrp/EnhancedCommentify')
call add(s:plugins.start, s:github_com.'vim-scripts/OmniCppComplete')
call add(s:plugins.start, s:github_com.'thinca/vim-qfreplace')
call add(s:plugins.start, s:github_com.'thinca/vim-quickrun')
call add(s:plugins.start, s:github_com.'thinca/vim-ref')
call add(s:plugins.start, s:github_com.'tpope/vim-markdown')
call add(s:plugins.start, s:github_com.'tpope/vim-repeat')
call add(s:plugins.start, s:github_com.'tpope/vim-surround')
call add(s:plugins.start, s:github_com.'tpope/vim-fugitive')
call add(s:plugins.start, s:github_com.'tpope/vim-endwise')
call add(s:plugins.start, s:github_com.'vim-scripts/vis')
call add(s:plugins.start, s:github_com.'vim-scripts/VisIncr')
call add(s:plugins.start, s:github_com.'vim-scripts/winmanager--Fox')
call add(s:plugins.start, s:github_com.'scrooloose/nerdtree')
call add(s:plugins.start, s:github_com.'fatih/vim-go')
call add(s:plugins.opt, s:github_com.'vim-scripts/sokoban.vim')
call add(s:plugins.opt, s:github_com.'vim-scripts/TeTrIs.vim')
call add(s:plugins.opt, s:github_com.'katono/rogue.vim')


function! s:has_plugin(name)
    return globpath(&runtimepath, 'plugin/' . a:name . '.vim') !=# ''
                \ || globpath(&runtimepath, 'autoload/' . a:name . '.vim') !=# ''
endfunction

function! s:mkdir_if_not_exists(path)
    if !isdirectory(a:path)
        call mkdir(a:path, 'p')
    endif
endfunction

function! s:create_helptags(path)
    if isdirectory(a:path)
        execute 'helptags ' . a:path
    endif
endfunction

function! InstallPackPlugins()
    for key in keys(s:plugins)
        let dir = expand(s:pack_path . '/' . key)
        call s:mkdir_if_not_exists(dir)

        for url in s:plugins[key]
            let dst = expand(dir . '/' . split(url, '/')[-1])
            if isdirectory(dst)
                " plugin is already installed
                continue
            endif

            echo 'installing: ' . dst
            let cmd = printf('git clone --recursive %s %s', url, dst)
            call system(cmd)
            call s:create_helptags(expand(dst . '/doc/'))
        endfor
    endfor
endfunction

function! UpdatePackPlugins()
    for key in keys(s:plugins)
        let dir = expand(s:pack_path . '/' . key)

        for url in s:plugins[key]
            let dst = expand(dir . '/' . split(url, '/')[-1])
            if !isdirectory(dst)
                " plugin is not installed
                continue
            endif

            echo 'update: ' . dst
            let cmd = printf('git -C %s pull --ff --ff-only', dst)
            call system(cmd)
            call s:create_helptags(expand(dst . '/doc/'))
        endfor
    endfor
endfunction


" matchit
source $VIMRUNTIME/macros/matchit.vim

" MiniBufExplorer
let g:miniBufExplVSplit = 0
nnoremap <Leader>t :TMiniBufExplorer<cr>
hi link		MBENormal			Normal
hi link		MBEChanged			PreProc
if has("gui_running")
	hi link		MBEVisibleNormal	Search
else
	hi link		MBEVisibleNormal	StatusLine
endif
hi link		MBEVisibleChanged	WildMenu

" BufExplorer
cab bue BufExplorer

" winmanager
cab wma WManager
cab wmc WMClose
let g:winManagerWindowLayout = "FileExplorer,TagsExplorer"
cab wml let g:winManagerWindowLayout = "FileExplorer,TagsExplorer"
cab wmlb let g:winManagerWindowLayout = "FileExplorer,TagsExplorer\|BufExplorer"
let s:favStr = ""
let s:LF_str = "\n"
if has("win32")
	let s:favStr = s:favStr . 'C:/' . s:LF_str
	let s:favStr = s:favStr . 'D:/' . s:LF_str
else
	let s:favStr = s:favStr . '/' . s:LF_str
	let s:favStr = s:favStr . '~/' . s:LF_str
endif
let g:favDirs = s:favStr
unlet s:favStr
unlet s:LF_str

" taglist
cab tls Tlist
cab tlc TlistClose
cab tge TagExplorer
hi link TagListFileName Normal

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)

" DoxygenToolkit
let g:DoxygenToolkit_briefTag_pre = '@brief '
let g:DoxygenToolkit_paramTag_pre = '@param '
let g:DoxygenToolkit_returnTag = '@return '
let g:DoxygenToolkit_fileTag = '@file '
let g:DoxygenToolkit_authorTag = '@author '
let g:DoxygenToolkit_dateTag = '@date '
let g:DoxygenToolkit_versionTag = '@version '
let g:DoxygenToolkit_blockTag = '@name '
let g:DoxygenToolkit_classTag = '@class '
let g:DoxygenToolkit_startCommentTag = '/*! '
let g:DoxygenToolkit_interCommentTag = '* '
let g:DoxygenToolkit_endCommentTag = '*/'
let g:DoxygenToolkit_startCommentBlock = '/* '
let g:DoxygenToolkit_interCommentBlock = '* '
let g:DoxygenToolkit_endCommentBlock = '*/'
let g:DoxygenToolkit_compactDoc = 'yes'
let g:DoxygenToolkit_versionString = ''
let g:DoxygenToolkit_authorName = ''
if $USER != ''
	let s:mail = $MAIL == '' ? '' : ' <' . $MAIL . '>'
	let g:DoxygenToolkit_authorName = $USER . s:mail
	unlet s:mail
endif

" C/Migemo
if has("win32")
	if isdirectory($VIM . "/cmigemo")
		if $PATH !~ "cmigemo"
			let $PATH = $PATH . ";" . $VIM . '\cmigemo' . ";"
		endif
		set runtimepath+=$VIM/cmigemo
		set runtimepath+=$VIM/cmigemo/runtime
	endif
endif


" copycppdectoimp

" virtual をどう表示するか (1:コメント   0:除去)
let g:ghph_ShowVirtual = 0
" static をどう表示するか (1:コメント   0:除去)
let g:ghph_ShowStatic = 0
" デフォルト引数をどう表示するか(1:除去   2: /* = 5*/   3 : /*5*/)
let g:ghph_ShowDefaultParams = 2
" :GHPH を定義するか
let g:ghph_useGHPH = 1
" :GH と :PH を定義するか
let g:ghph_useGHandPH = 0
" ヘッダーファイルの関数プロトタイプにカーソルを置いて:Gした後、
" ソースファイルで:Gすると関数定義を貼り付け
cab G GHPH


" KaoriYa版付属のautodateを無効にする
let plugin_autodate_disable = 1


" srcexpl.vim

" 自動でプレビューを表示しない
let g:SrcExpl_RefreshTime   = 0
" プレビューウインドウの高さ
let g:SrcExpl_WinHeight     = 9
" tagsは自動で作成しない
let g:SrcExpl_UpdateTags    = 0
" マッピング
let g:SrcExpl_RefreshMapKey = "<Space>"
let g:SrcExpl_GoBackMapKey  = "<C-b>"
nnoremap <F8> :SrcExplToggle<CR>


" omnicppcomplete

nnoremap <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" プレビューウィンドウを出さない
set completeopt-=preview
" 自動的にプレビューウィンドウを閉じる
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


" eblook.vim
if $DICT_HOME != ""
	let eblookenc = 'cp932'
	let s:dict_home = $DICT_HOME
	let eblook_dictlist1 = [
	 \{ 'title': 'ロングマン現代英英辞典  ５訂版',
		\'book': s:dict_home . '/LDOCE5_vim',
		\'name': 'ldoce5',
		\'appendix': s:dict_home . '/appendix/ldoce5',
	 \},
	 \{ 'title': '研究社 新英和・和英中辞典',
		\'book': s:dict_home . '/KENKYUSHA_CHUJITEN',
		\'name': 'chujiten',
		\'appendix': s:dict_home . '/appendix/chujiten64',
	 \},
	 \{ 'title': '広辞苑第五版',
		\'book': s:dict_home . '/SPTG99V1',
		\'name': 'kojien',
		\'appendix': s:dict_home . '/appendix/kojien5',
	 \},
	 \{ 'title': 'ロイヤル英文法改訂新版',
		\'book': s:dict_home . '/ROYALEGR',
		\'name': 'royalegr',
		\'appendix': s:dict_home . '/appendix/royalegr',
	 \},
	\]
endif

" gtags用タグスタック
let g:GtagsStackFile = []
let g:GtagsStackLine = []
function! GtagsStackPush()
	call add(g:GtagsStackFile, expand('%'))
	call add(g:GtagsStackLine, line('.'))
endfunction
function! GtagsStackPop()
	if len(g:GtagsStackFile) != 0
		let file = remove(g:GtagsStackFile, -1)
		let line = remove(g:GtagsStackLine, -1)
		if expand('%') != file
			silent! execute "e " . file
		endif
		silent! execute line
		silent! execute "cclose"
	endif
endfunction
nnoremap <C-j> :<C-u>call GtagsStackPush()<CR>:Gtags -r <C-r><C-w><CR>
autocmd FileType cpp,c nnoremap <silent> <buffer> <C-s> :<C-u>call GtagsStackPop()<CR>

let g:Gtags_No_Auto_Jump = 1


" EnhancedCommentify
let g:EnhCommentifyPretty = 'Yes'
let g:EnhCommentifyRespectIndent = 'Yes'
"let g:EnhCommentifyUseBlockIndent = 'Yes'
"let g:EnhCommentifyMultiPartBlocks = 'Yes'


" rogue.vim
hi rogueFloor	ctermfg=blue	guifg=brown

" sokoban.vim
let $VIMSOKOBANDIR = s:pack_path . '/opt/sokoban.vim/'


" vim: ts=4 sw=4:
