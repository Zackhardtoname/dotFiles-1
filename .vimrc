set timeoutlen=500 ttimeoutlen=0
noremap <Leader>s :update<CR>

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
  
" Some basics:
	set nocompatible
	syntax on

  map <space> <leader>
  
	filetype plugin indent on
  filetype indent on      " load filetype-specific indent files
	filetype plugin on
	set encoding=utf-8
	set number relativenumber
  let g:gruvbox_contrast_dark = 'hard'
  let g:gruvbox_contrast_light = 'hard'
  colorscheme gruvbox
  set background=dark
  set cursorline
  hi Error None

"Uncomment to override defaults:
" let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0

" Write to read only file
cmap w!! w !sudo tee % > /dev/null


" sets wrap with :Gdiff ing
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

nmap <C-t> :TagbarToggle<CR>

  set scrolloff=3

  set clipboard=unnamedplus


	set incsearch
	set hlsearch

  " avoid whitespace comparison
  set diffopt+=iwhite

  " Nerd Tree
  map <C-n> :NERDTreeToggle<CR>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
  let NERDTreeQuitOnOpen = 1
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1

  " changing tabs with vim keys
  " map  <C-l> :tabn<CR>
  " map  <C-h> :tabp<CR>
  nmap <C-l> :bnext<CR>
  nmap <C-h> :bprevious<CR>
  nmap <leader>q :bd<CR>
  nmap <leader>ba :ls<CR>

  " vim fugitive
  set diffopt+=vertical


  " airline theme
  let g:airline_theme='gruvbox'

  " air-line
  " let g:airline_powerline_fonts = 1
  let g:airline_symbols_ascii = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamemod = ':t'

  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''

  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
  let g:airline_symbols.maxlinenr = ''
  let g:airline_left_sep=''
  let g:airline_left_alt_sep=''
  let g:airline_right_sep=''
  let g:airline_right_alt_sep=''
  let g:airline_symbols.readonly='RO'
  let g:airline_symbols.whitespace='!'
  let g:airline_symbols.linenr='ln'
  let g:airline_symbols.maxlinenr=''
  let g:airline_symbols.branch=''
  let g:airline_symbols.notexists=''
  let g:airline_symbols.crypt='cr'
"

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_complete_in_comments = 1 
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_collect_identifiers_from_comments_and_strings = 1 
let g:ycm_use_ultisnips_completer = 1


" COC Stuff

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" let g:ycm_filetype_blacklist = {
"       \ 'tagbar': 1,
"       \ 'notes': 1,
"       \ 'markdown': 1,
"       \ 'netrw': 1,
"       \ 'unite': 1,
"       \ 'text': 1,
"       \ 'vimwiki': 1,
"       \ 'pandoc': 1,
"       \ 'infolog': 1,
"       \ 'mail': 1,
"       \ 'tex': 1,
"       \ 'plainex': 1
"       \}

" Disable Ex mode and vim history mode
map q: <Nop>
nnoremap Q <nop>

let g:vimwiki_list = [{'path': '~/.vimwiki/'}]

au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map d :VimwikiMakeDiaryNote
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction
:autocmd FileType vimwiki map c :call ToggleCalendar()

let g:md_pdf_viewer="zathura"
let g:md_args = "--pdf-engine=xelatex"
" --template eisvogel --listings

let python_highlight_all=1

" call togglebg#map("<F5>")

au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 | 
	" \ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |

" au BufNewFile,BufRead *.js, *.html, *.css
"     \ set tabstop=2 |
"     \ set softtabstop=2 |
"     \ set shiftwidth=2 |

au BufNewFile,BufRead *.md
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |


function! DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction

" sets up mappings to function

com! DiffSaved call DiffWithSaved()
map <Leader>ds :DiffSaved<CR>

let g:autopep8_ignore="E501"
let g:flake8_show_in_gutter=0  " don't show (default)
let g:flake8_show_quickfix=0  " don't show

" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
  "set laststatus=2
  "
  "nnoremap <m-,> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
  "nnoremap <m-.> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>


" First define a function
function! MoveFunction(newname)
    " get the current file name
    let a:oldname = expand("%:p")
    " save under the new name
    exec "saveas " . a:newname 
    " delete the old file
    call delete(a:oldname) 
endfunction
" Next define a command
command! -nargs=1 MoveTo call MoveFunction(<f-args>)

  " Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" lowerlevel (bool): true: Go to line with lower indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>


cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
function! Save()
  :w !sudo tee %
endfunction


 set wildmenu
 set wildmode=longest:list,full

"Paste without indentation
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>
nnoremap p p=`]


nmap <Cr> o<Esc>
" Escape Search Highlight
" nmap <C-_> /qwertyuiop<Cr>
" nnoremap <silent> <C-_> :nohl<CR><C-l>
nnoremap <silent> <C-_> :nohlsearch<CR>

" Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" nnoremap <space> za
set foldmethod=indent   " fold based on indent level

" highlight last inserted text
nnoremap gV `[v`]

" nnoremap <silent><C-B>f :RangerOpenProjectRootDir<CR>

" netrw configuration
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_winsize = 15



" Splits open at the bottom and right:
	set splitbelow splitright

set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_tex_checkers = ['chktex']
" let g:syntastic_quiet_messages = {
"   \ "type":    "style"}


" fzf shortcut
map ' :Files<CR>

" todo.txt vim
" https://gitlab.com/dbeniamine/todo.txt-vim

" " Use todo#Complete as the omni complete function for todo files
" au filetype todo setlocal omnifunc=todo#Complete

" " Auto complete projects
" au filetype todo imap <buffer> + +<C-X><C-O>
" 
" " Auto complete contexts
" au filetype todo imap <buffer> @ @<C-X><C-O>
" 
" " Always open preview window
" au filetype todo setlocal completeopt+=menuone

" Don't open preview window when performing completion
au filetype todo setlocal completeopt-=preview

" lervag/vimtex settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_quickfix_latexlog = {'default' : 0}
set conceallevel=1
let g:vimtex_imaps_disabled = ['K']
let g:tex_conceal=''
" let g:tex_conceal='abdmg'
    let g:vimtex_mappings_disable = {
        \ 'n': ['K'],
        \}

let g:vimtex_compiler_latexmk = {
      \ 'continuous' : 0,
      \ }

" autocmd TextChanged,TextChangedI <buffer> silent write

" Plug 'sirver/ultisnips'
" let g:UltiSnipsExpandTrigger = '<tab>'
" let g:UltiSnipsJumpForwardTrigger = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetsDir        = $HOME.'/.vim/UltiSnips/'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-tab>"


" setlocal spell
" set spelllang=en_us
" correct spelling
" inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

let g:prettier#exec_cmd_async = 1



call plug#begin('~/.vim/plugged')
  Plug 'morhetz/gruvbox'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'majutsushi/tagbar'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'xolox/vim-misc',
  Plug 'vim-scripts/Align',
  Plug 'dbeniamine/todo.txt-vim'
  Plug 'lervag/vimtex'
  Plug 'sirver/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'vimwiki/vimwiki'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'conornewton/vim-pandoc-markdown-preview'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' } " 10-28
  Plug 'https://github.com/adelarsq/vim-matchit'
  Plug 'tpope/vim-eunuch'
  Plug 'mattn/calendar-vim'

  " Plug 'godlygeek/tabular',
  " Plug 'plasticboy/vim-markdown'
  " Plug 'vim-scripts/indentpython.vim'
  " Plug 'nvie/vim-flake8'
  " Plug 'tell-k/vim-autopep8'
  " Plug 'akarzim/vim-decode-qp', { 'for': 'asc' }
  " Plug 'xolox/vim-notes',
  " Plug 'dhruvasagar/vim-zoom'
  " Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
call plug#end()
  nmap <C-J> gj
  nmap <C-K> gk




if has('persistend_undo')
	set undofile
	set undodir=$HOME/.vim/undo
	endif


" execute pathogen#infect()

" So that esc triggers immediately
set noesckeys
