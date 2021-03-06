" MAPS NEOVIM MACR

" CTRL-x to cut
vnoremap <c-x> "+x

" Open a new tab in the directory
" nmap te :tabedit
" nmap <silent><S-Tab> :tabnext<Return>

" Ctrl + h and ctrl + l uses word skip
" nnoremap <c-h> b
" nnoremap <c-l> w
" vnoremap <c-h> b
" vnoremap <c-l> w

" Remap C-c to <esc> (already default)
nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>

" Delete without yank
nnoremap <leader>d "_d
vnoremap <leader>d "_d
onoremap <leader>d "_d
nnoremap x "_x
nnoremap X "_X

" Paste the last thing yanked, not deleted
nnoremap <leader>p "0p
nnoremap <leader>P "0P
" nnoremap <S-C-p> "0p
" nnoremap <S-C-v> "0p
" nmap ,P "0P

" Paste in insert mode
" inoremap <c-v> <Esc>pa

" Select everything ggVG
nnoremap <c-a> ggVG

" Copy with ctrl+c
" vnoremap <C-c> y

" Remap go to end of line ($) and go to start of line (^)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" Use f3 to search (Not working)
" set hlsearch!
nnoremap <silent><Leader>hl :set hlsearch!<CR>

" c-s to save in normal mode
nnoremap <c-s> :w<Enter>

" Press s to add an extra line
" The o<Esc>^Da is for deleting comments on the start of the line
nnoremap s o<Esc>^"_D
nnoremap S O<Esc>^"_D
noremap <Leader>s o<space><esc>
noremap <Leader>S O<space><esc>

" Backspace in visual mode deletes selection
vnoremap <BS> d

" Map F8 to Tagbar
" nmap <F8> :TagbarToggle<CR>

" Use ctrl-[ijkl] to select the active split
nmap <silent> <c-up> :wincmd k<CR>
nmap <silent> <c-down> :wincmd j<CR>
nmap <silent> <c-left> :wincmd h<CR>
nmap <silent> <c-right> :wincmd l<CR>

" Remap replace to ctrl + r
nmap <F2> <Plug>(coc-rename)

" active c-backspace and alt-basckspace to delete
inoremap <C-H> <C-W>
inoremap <C-Del> <C-o>dw

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <silent><leader>bq :bp <BAR> bd #<CR>
" Force quit
nmap <silent><leader>bQ :bp <BAR> bd! #<CR>

if exists('g:vscode')
    " VSCode extension
    " Create default mappings for commenting lines
    nmap F <Plug>VSCodeCommentaryLine
    xmap F <Plug>VSCodeCommentary

    " Change buffers with c-n and c-p on normal mode
    nnoremap <C-P> :bnext<CR>
    nnoremap <C-N> :bprev<CR>
else
    " Ordinary neovim

    " These commands will navigate through buffers in order regardless of which mode you are using
    " e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
    nnoremap <silent><C-P> :BufferLineCycleNext<CR>
    nnoremap <silent><C-N> :BufferLineCyclePrev<CR>

    " These commands will move the current buffer backwards or forwards in the bufferline
    nnoremap <silent><leader>bp :BufferLineMoveNext<CR>
    nnoremap <silent><leader>bn :BufferLineMovePrev<CR>

    " Create default mappings for commenting lines
    nmap <silent>F :Commentary<Enter>
    xmap <silent>F :Commentary<Enter>

    " Undo with c-u (c-r is the default)
    " nmap <c-U> :later<CR>

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()
    " Run maps for plugins
    runtime ./plugmaps.vim
endif


