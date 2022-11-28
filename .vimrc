nnoremap <SPACE> <Nop>
:let mapleader = " "

"OPEN .VIMRC
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"QUIT
:nnoremap <leader>q :q<cr>

"WRITE
:nnoremap <leader>w :w<cr>

set scrolloff=6

"NO SEARCH HL ON SPACE
nnoremap <space> :nohl<CR>,

"INSERT SPACE
nnoremap <S-space> i<space><Esc>l

"APPEND NL
nnoremap <S-cr> o<esc>
inoremap <S-cr> <esc>o

"Break Line
nnoremap <cr> s<cr><esc>

"Insert TAB
nnoremap <tab> i<tab><esc>l

"APPEND SEMICOLON
inoremap <·> <esc>A;
nnoremap <·> A;<esc>

"DELETE BEFORE EOL
inoremap <«> $h<bs>
nnoremap <«> $hx

"INSERT BEFORE EOL
inoremap <æ> <esc>$i
nnoremap <æ> $i

"SEARCH & REPLACE W/ CONFIRMATION
nnoremap <leader>gc :%s//gc<left><left><left>

"UPPERCASE WORD
inoremap <C-U> <Esc>vbUea

"Switch Letter's case
nnoremap U v~<esc>

"MOVE LINE/BLOCK
nnoremap <C-S-J> :m+<CR>==
nnoremap <C-S-K> :m-2<CR>==
inoremap <C-S-J> <Esc>:m+<CR>==gi
inoremap <C-S-K> <Esc>:m-2<CR>==gi
vnoremap <C-S-J> :m'>+<CR>gv=gv
vnoremap <C-S-K> :m-2<CR>gv=gv

"COPY LINE/BLOCK
nnoremap <c-j> yyp
nnoremap <c-k> yyP
inoremap <c-j> <esc>yypi
inoremap <c-k> <esc>yypi
"vnoremap <A-J> :m'>+<CR>gv=gv
"vnoremap <A-K> :m-2<CR>gv=gv
