" General {
	set nocompatible "use VIM settings
	set rtp+=/usr/local/share/vim/bundle/vundle
	call vundle#rc()
	set background=dark
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
	set autoread "automatically reload a file if its file mode has changed
" }

" Plugin settings {
	let g:bundle_dir="/usr/local/share/vim/bundle"
	let g:tagbar_autoclose=1
	let g:tagbar_autofocus=1
	let g:NumberToggleTrigger="<F5>"
	let g:relativemode=0 "turn relative numbering off by default
	let g:airline_powerline_fonts=1
	let g:airline_enable_syntastic=0
	let g:airline_enable_tagbar=0
	let g:airline#extensions#tabline#enabled=1
	let g:airline_detect_whitespace=0
	let g:airline_section_c="%F%m"
	let g:airline_section_y="%{strlen(&ff)>0?&ff:''}"
	let g:airline_section_z="%4L %{g:airline_symbols.linenr}%4l:%4v (%3p%%)"
	let g:airline_theme='molokai'
	let g:gitgutter_realtime=0
	let g:gitgutter_eager=0
" }

" Vundle {
	Bundle 'gmarik/vundle'
	Bundle 'scrooloose/nerdtree'
	Bundle 'wincent/Command-T'
	Bundle 'vim-scripts/ctagloader'
	Bundle 'scrooloose/syntastic'
	Bundle 'majutsushi/tagbar'
	Bundle 'thinca/vim-visualstar'
	Bundle 'nvie/vim-flake8'
	Bundle 'vim-scripts/bufkill.vim'
	Bundle 'tomasr/molokai'
	Bundle 'tpope/vim-unimpaired'
	Bundle 'monstermunchkin/vim-numbertoggle'
	Bundle 'bling/vim-airline'
	Bundle 'tpope/vim-fugitive'
	Bundle 'airblade/vim-gitgutter'
	Bundle 'tpope/vim-surround'
	Bundle 'scrooloose/nerdcommenter'
" }

" VIM UI {
	colorscheme molokai "theme has to be set after the Bundle
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
	if exists('+colorcolumn')
		set colorcolumn=80 "display vertical line in column 80
	endif
" }

" Layout/Formatting {
	set ts=8 "set tabstop
	set sts=8 "set softtabstop (takes precedence over tabstop)
	set sw=8 "set shiftwidth
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
	let mapleader = ','
	if !has("gui_running")
		nnoremap <Leader>r :call RangerChooser()<CR>
	endif
	" enclose visual selection
	vnoremap <Leader>" c"<C-r>""<ESC>
	vnoremap <Leader>' c'<C-r>"'<ESC>
	vnoremap <Leader>{ c{ <C-r>" }<ESC>
	vnoremap <Leader>} c{<C-r>"}<ESC>
	vnoremap <Leader>[ c[ <C-r>" ]<ESC>
	vnoremap <Leader>] c[<C-r>"]<ESC>
	vnoremap <Leader>( c( <C-r>" )<ESC>
	vnoremap <Leader>) c(<C-r>")<ESC>
	" toggle fold under cursor
	nnoremap <Space> za
	" Start the find and replace command across the entire file
	vnoremap <C-r> <ESC>:%s/<C-r>=GetVisual()<CR>//gc<left><left><left>
	" new line on return
	nnoremap <CR> o<ESC>
	" switch between buffers
	nnoremap <PageUp> :bp<CR>
	nnoremap <PageDown> :bn<CR>
	nnoremap <Home> :bf<CR>
	nnoremap <End> :bl<CR>
	" spell checking
	nnoremap <silent> <Leader>s :set spell!<CR>
	" copy, paste and cut
	vnoremap <F2> "+y
	nnoremap <F3> "+gP
	vnoremap <F4> "+x
	" show errors (requires syntastic)
	nnoremap <F6> :Errors<CR>
	" remove trailing whitespace
	nnoremap <F8> :call Preserve("%s/\\( \\\|\t\\)\\+$//e")<CR>
	" switch list setting
	nnoremap <F9> :call Toggle_tabs()<CR>
	" plugins
	nnoremap <F10> :NERDTreeToggle<CR>
	nnoremap <F11> :CommandT<CR>
	nnoremap <F12> :TagbarToggle<CR>
	" bubbling text
	nmap <C-Up> [e
	nmap <C-Down> ]e
	vmap <C-Up> [egv
	vmap <C-Down> ]egv
" }

" Autocommands {
	if has("autocmd")
		au FileType python setlocal ts=4 sts=4 sw=4 et
		au FileType ruby,eruby,javascript,yaml,tex,plaintex setlocal ts=2 sts=2 sw=2 et
		" remove trailing whitespace on save
		au BufWrite * call Preserve("%s/\\( \\\|\t\\)\\+$//e")
		" augroup perl
		"	au!
		"	au BufNewFile *.pl 0r ~/.vim/skeleton.pl
		"	au BufNewFile *.pl exe "normal 9G"
		" augroup END
		" augroup python
		"	au!
		"	au BufNewFile *.py 0r ~/.vim/skeleton.py
		"	au BufNewFile *.py exe "normal 19G"
		" augroup END
		augroup filetypedetect
			au BufNewFile,BufRead *.h set filetype=c
			au BufNewFile,BufRead *.scala set filetype=java
			au BufNewFile,BufRead CMakeLists set filetype=cmake
		augroup END
	endif
" }

" GVIM settings {
	if has("gui_running")
		set columns=87
		" set guioptions-=m "remove menu bar
		set guioptions-=T "remove toolbar
		" set guioptions-=r "remove right-hand scroll bar
		set guifont=Source\ Code\ Pro\ 11
		set guitablabel=%t\ %m
		if has("balloon_eval")
			set noballooneval "disable popup messages
		endif
	endif
" }

function! Toggle_tabs()
	if &listchars == "tab:▸\ ,eol:¬"
		set listchars=tab:\ \  "mind the whitespace
	else
		set listchars=tab:▸\ ,eol:¬
	endif
endfunction

function! RangerChooser()
	exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
	if filereadable('/tmp/chosenfile')
		exec 'edit ' . system('cat /tmp/chosenfile')
		call system('rm /tmp/chosenfile')
	endif
	redraw!
endfunction

" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
	let string=a:string
	" Escape regex characters
	let string = escape(string, '^$.*\/~[]')
	" Escape the line endings
	let string = substitute(string, '\n', '\\n', 'g')
	return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
	" Save the current register and clipboard
	let reg_save = getreg('"')
	let regtype_save = getregtype('"')
	let cb_save = &clipboard
	set clipboard&

	" Put the current visual selection in the " register
	normal! ""gvy
	let selection = getreg('"')

	" Put the saved registers and clipboards back
	call setreg('"', reg_save, regtype_save)
	let &clipboard = cb_save

	"Escape any special characters in the selection
	let escaped_selection = EscapeString(selection)

	return escaped_selection
endfunction

function! Preserve(command)
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	execute a:command
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction

set exrc "read vimrc in current directory
set secure "prevent local vimrc from doing nasty things

" vim: set syn=vim:
