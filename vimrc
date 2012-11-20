" General {
	set nocompatible "use VIM settings
	call pathogen#infect("~/.vim/bundle")
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
		set foldlevelstart=99 " no folds closed on start
	endif
" }

" Mappings {
	nnoremap ,r :call RangerChooser()<CR>
	" toggle fold under cursor
	nnoremap <Space> za
	" replace all occurences of visual selection
	vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
	" new line on return
	nnoremap <CR> o<ESC>
	" switch between buffers
	nnoremap <PageUp> :bp<CR>
	nnoremap <PageDown> :bn<CR>
	nnoremap <Home> :bf<CR>
	nnoremap <End> :bl<CR>
	" copy, paste and cut
	vnoremap <F2> "+y
	nnoremap <F3> "+gP
	vnoremap <F4> "+x
	" remove whitespaces at line endings
	nnoremap <F7> :%s/ \+$//ge\|%s/\t\+$//ge<CR>
	" show errors (requires syntastic)
	nnoremap <F8> :Errors<CR>
	" switch list setting
	nnoremap <F9> :call Toggle_tabs()<CR>
	" plugins
	nnoremap <F10> :NERDTreeToggle<CR>
	nnoremap <F11> :CommandT<CR>
	nnoremap <F12> :TagbarToggle<CR>
" }

" Autocommands {
	if has("autocmd")
		au FileType python setlocal ts=4 sts=4 sw=4 et
		au FileType ruby setlocal ts=2 sts=2 sw=2 et
		au FileType eruby setlocal ts=2 sts=2 sw=2 et
		" augroup perl
		" 	au!
		" 	au BufNewFile *.pl 0r ~/.vim/skeleton.pl
		" 	au BufNewFile *.pl exe "normal 9G"
		" augroup END
		" augroup python
		" 	au!
		" 	au BufNewFile *.py 0r ~/.vim/skeleton.py
		" 	au BufNewFile *.py exe "normal 19G"
		" augroup END
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
		set guifont=DejaVu\ Sans\ Mono\ 9
	endif
" }

:function Toggle_tabs()
	if &listchars == "tab:▸\ ,eol:¬"
		set listchars=tab:\ \  "mind the whitespace
	else
		set listchars=tab:▸\ ,eol:¬
	endif
endfunction

:function RangerChooser()
	exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
	if filereadable('/tmp/chosenfile')
		exec 'edit ' . system('cat /tmp/chosenfile')
		call system('rm /tmp/chosenfile')
	endif
	redraw!
endfun

" vim: syn=vim:
