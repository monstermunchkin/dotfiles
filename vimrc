" General {
	set nocompatible "use VIM settings
	if has("gui_running")
		colorscheme wombat2562
		set background=dark
	else
		colorscheme wombat2562
		set background=dark "syntax colors for dark background
	endif
	if has("syntax")
		syntax enable "enable syntax
	endif
	set mouse=a "use mouse everywhere
	if exists("+autochdir")
		set autochdir "change to directory of file in buffer
	endif
	set whichwrap+=[,] "allow <Left> and <Right> to wrap in Insert Mode
	set directory=/tmp "directory for swap files
	set nobackup "create no backup files
	set nowritebackup
	"set backupdir=~/.vim/backup "backup directory
	set hidden "change buffers without saving
	if has("wildmenu")
		set wildmenu "command line completion in enhanced mode
	endif
	set wildmode=list:longest,full "only start completion after seconds <TAB>
	filetype plugin indent on
	set backspace=indent,eol,start
" }

" VIM UI {
	set number "set line numbers
	if has("linebreak")
		set numberwidth=5 "allow room for lots of lines
	endif
	if has("extra_search")
		set incsearch "highlight as you type
	endif
	set nowrapscan "stop searching at the end or beginning of the file
	set scrolloff=2 "keep 2 lines around the cursor
	if has("cmdline_info")
		set showcmd "display incomplete commands
	endif
	set list "show tabs and eols
	set listchars=tab:\ \  "do not show tabs and eols
	set laststatus=2 "always show status line
	if has("statusline")
		set statusline=%F%r%h%w[%{&ff}]%y%=%m[%04L][%03p%%][%04l,%04v]
		"              | | | |  |      | | |  |     |       |    |
		"              | | | |  |      | | |  |     |       |    + current 
		"              | | | |  |      | | |  |     |       |      column
		"              | | | |  |      | | |  |     |       + current line
		"              | | | |  |      | | |  |     + current % into file
		"              | | | |  |      | | |  + number of lines
		"              | | | |  |      | | + modified flag
		"              | | | |  |      | + switch alignment to right
		"              | | | |  |      + filetype / syntax
		"              | | | |  + fileformat (unix|dos|mac)
		"              | | | + preview flag
		"              | | + help flag
		"              | + readonly flag
		"              + filename
	endif
" }

" Layout/Formatting {
	set ts=4 "set tabstop
	set sts=4 "set softtabstop (takes precedence over tabstop)
	set sw=4 "set shiftwidth
	set noexpandtab "use tabs by default
	set autoindent "use the indent of the previous line for a new one
	set formatoptions=r "insert comment on return
	set modeline "activate modelines
" }

" Folding {
	if has("folding")
		set foldenable "turn on folding
		set foldmethod=indent "foldmethod
		set foldlevel=100 "foldlevel
	endif
" }

" Mappings {
	" copy, paste and cut
	map <F2> "+y
	map <F3> "+gP
	map <F4> "+x
	" switch between buffers
	nmap <PageUp> <ESC>:bp<RETURN>
	nmap <PageDown> <ESC>:bn<RETURN>
	nmap <Home> <ESC>:bf<RETURN>
	nmap <End> <ESC>:bl<RETURN> 
	" show errors (needs syntastic)
	map <F8> <ESC>:Errors<RETURN>
	" switch list setting
	map <F9> <ESC>:call Toggle_tabs()<RETURN>
	imap <F9> <ESC>:call Toggle_tabs()<RETURN>
	" switch between tabs
	" if has("windows")
	" 	map <F5> <ESC>:tabfirst<RETURN>
	" 	map <F6> <ESC>:tabprevious<RETURN>
	" 	map <F7> <ESC>:tabnext<RETURN>
	" 	map <F8> <ESC>:tablast<RETURN>
	" endif
" }

" Autocommands {
	if has("autocmd")
		au FileType python setlocal ts=4 sts=4 sw=4 et
		augroup perl
			au!
			au BufNewFile *.pl 0r ~/.vim/skeleton.pl
			au BufNewFile *.pl exe "normal 9G"
		augroup END
		augroup python
			au!
			au BufNewFile *.py 0r ~/.vim/skeleton.py
			au BufNewFile *.py exe "normal 19G"
		augroup END
		augroup filtypedetect
			au BufNewFile,BufRead *.h set filetype=c
			au BufNewFile,BufRead *.scala set filetype=java
		augroup END
	endif
" }

" GVIM settings {
	if has("gui_running")
		set columns=87
		set guioptions-=m "remove menu bar
		set guioptions-=T "remove toolbar
		set guioptions-=r "remove right-hand scroll bar
		set guifont=Monospace\ 9
	endif
" }

:function Toggle_tabs()
	if &listchars == "tab:▸\ ,eol:¬"
		set listchars=tab:\ \ 
	else
		set listchars=tab:▸\ ,eol:¬
	endif
endfunction

" vim: syn=vim:
