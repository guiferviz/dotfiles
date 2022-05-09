" Disabling Python 2.
let g:loaded_python_provider = 0
let g:python_host_prog = ""
" Set Python version to a version with neovim Python package installed.
let g:python3_host_prog = "/usr/local/bin/python3"

" Set <leader> key to ','.
let mapleader = ","

" List of VIM plugins.
" To remove any pluggin delete the Plug line from this function, reload your
" init.vim (`:source %` while editing the file or restart VIM) and call
" `:PlugClean`.
call plug#begin("~/.config/nvim/pluggins")
    " Add an status bar.
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Download better colorschemes.
    " Sublime text monokai.
    Plug 'crusoexia/vim-monokai'
    " Solarized (dark and light).
    Plug 'lifepillar/vim-solarized8'

    " File system browser.
    Plug 'scrooloose/nerdtree'
    " Nerdtree git support!
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " Allows you to run git commands from vim.
    Plug 'tpope/vim-fugitive'

    " A very nice git commit explorer.
    Plug 'junegunn/gv.vim'

    " Mark tabulations to a better visual experience.
    Plug 'Yggdroot/indentLine'

    " Repeat last command.
    Plug 'tpope/vim-repeat'

    " Easy work with CSV and similar separated value files.
    Plug 'mechatroner/rainbow_csv'

    " Snippet manager.
    Plug 'sirver/ultisnips'

    " Markdown Preview.
    " If you have nodejs and yarn.
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

    " Tons of syntax highlight with Polyglot.
    " Avoid polyglot in CSV files, I prefer to use rainbow_csv.
    " This configuration should be before `Plug polyglot` or it will be
    " ignored.
    let g:polyglot_disabled = ["csv"]
    Plug 'sheerun/vim-polyglot'

    " Easy search over multiple files.
    " Make sure you have ack, ag, pt or rg installed.
    Plug 'dyng/ctrlsf.vim'
    " Some other config variables are set down.

    " Install fzf for fuzy search. I think you need to install the tool first.
    Plug 'junegunn/fzf'

    " COC autocomplete.
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Run :CocInstall coc-pyright once you open nvim to install Python
    " linter + types checker.
    " Run :CocInstall coc-snippets to autocomplete with snippet names and show
    " descriptions before executing.
    " Run :CocInstall coc-json for a JSON linter.

    " Add a vim motion based on indents.
    " ai: The current indentation level and the line above
    " ii: The current indentation level excluding the line above
    Plug 'michaeljsmith/vim-indent-object'

    " A vim plugin to improve the project search experience.
    Plug 'jesseleite/vim-agriculture'

    " Black Python formatter.
    Plug 'psf/black', { 'branch': 'stable' }
" End the list of vim plugins
call plug#end()


" Add a mapping for the NERDTree command, so you can just type :T to open
command! T NERDTree
nnoremap <leader>t :NERDTree<cr>
" Same for FZF
command! F FZF
nnoremap <leader>f :FZF<cr>

" Allow clicks with mouse to move the cursor.
" Don't use the mouse too much!!
set mouse=a

" Show line numbers.
set number
" Show row numbers relative to the current line.
set relativenumber

" Add a bar on the side which indicates the maximum row length.
set colorcolumn=80

" Change between dark and light colorschemes easily.
function! Dark()
    set background=dark
    let g:airline_solarized_bg='dark'
    colorscheme solarized8
endfunction
function! Light()
    set background=light
    let g:airline_solarized_bg='light'
    colorscheme solarized8
endfunction
command! Dark call Dark()
command! Light call Light()

" Set default theme.
" Uncomment next line to select monokai as default colorscheme.
"colorscheme monokai
" Uncomment next lines to select solarized. Background can be dark or light.
set termguicolors  " Use GUI colors inside of a terminal.
syntax enable
" Set light theme.
set background=dark
let g:airline_solarized_bg='dark'
" When installing plugins with "nvim +PlugInstall +qall" this file, the
" init.vim file, is loaded but the colorscheme is not still installed, so it
" fails. That's why I'm using here a try-catch, to avoid the error message.
" That's why we cannot use here 'call Light()' or 'call Dark()'.
try
    colorscheme solarized8
catch
endtry
" Set Airline status bar theme.
let g:airline_theme='solarized'
" Flag to render symbols in powerline font.
" If icons are not working on Mac check you have selected `Use built-in
" Powerline glyphs`. More info: https://github.com/powerline/fonts/issues/248
let g:airline_powerline_fonts = 1

" Tab with 4 spaces.
set expandtab
set tabstop=4
set shiftwidth=4

" Tab character indicator.
" Any of these are good options: '|', '¦', '┆', '┊'
let g:indentLine_char = "¦"

" Ignore __pycache__ dirs in NERDTree.
let NERDTreeIgnore = ["__pycache__", ".pytest_cache"]
" Show hidden files by default.
let NERDTreeShowHidden=1

" Avoid hidden characters in markdown and JSONs, like the quotes or the *.
set conceallevel=0
" The plugin indentLine requires conceallevel=0 so it changes it
" automatically. Avoid the execution of this pluging in json and markdown
" filetypes.
" More info in: https://vi.stackexchange.com/questions/12520/markdown-in-neovim-which-plugin-sets-conceallevel-2
let g:indentLine_fileTypeExclude = ['markdown', 'json', 'cards']

" Allow find commands to find files in subdirectories.
" If you are using a fuzzy matching plugin (like fzf) this is not needed.
"set path+=**

" MarkdownPreview plugin can be used in any filetype, not only markdown.
" Interested in execute the plugin in *.cards filetype.
let g:mkdp_command_for_global = 1

" Spell check in English by default.
set spell
" Autocorrect the last misspelled word in insert mode.
inoremap <C-S> <C-G>u<Esc>[s1z=`]a<C-G>u
" Autocorrect the last misspelled word and move cursor to that word.
nnoremap <C-S> l[s1z=

" Autoreload files when modified from an external process.
set autoread

" CtrlSF configuration.
" Install your favourite ack-like program to use in search.
" Read CtrlSF documentation for more information.
let g:ctrlsf_ackprg = 'rg'

" Useful key maps.
" Delete text without copying.
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP
" Copy to clipboard.
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Set folding method to a unique value with the next lines:
set foldmethod=syntax
set foldlevelstart=20

" Execute current selection in a Python interpreter.
vnoremap <leader>e :w !python<CR>
" Execute current selection in a Python interpreter replacing output.
vnoremap <F5> :!python<CR>

" Config vim-markdown included in polyglot.
let g:vim_markdown_math = 1

" Delete all extra spaces at the end of each line.
" `-range=%` visual ranges are allowed; default is the whole file.
" `keeppattern` after running this command, keeps the current search pattern
" instead of using `\s\+`.
" `normal <C-o>` moves cursor back to current position. If not, the cursor will
" be in the latest changed line.
command! -range=% TrimEndOfLine :keeppattern <line1>,<line2>s/\s\+$// | normal <C-o>

" Remove everything from the line except the strings.
" ExtractStringContent extracts the string without quotes.
" ExtractString extracts the string with quotes.
" NOTE: It doesn't work with escaped quotes.
command! -range=% ExtractStringContent :keeppattern <line1>,<line2>s/^.\{-}['"]\([^"]\{-}\)['"].\{-}$/\1/ | normal <C-o>
command! -range=% ExtractString :keeppattern <line1>,<line2>s/^.\{-}\(['"][^"]\{-}['"]\).\{-}$/\1/ | normal <C-o>

" Coc configuration.
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:OrganizeImports` command for organize imports of the current buffer.
command! -nargs=0 SortImports :call CocAction('runCommand', 'editor.action.organizeImport')
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Status airline.
let g:airline#extensions#coc#enabled = 1
" Navigate completion list with tab and shift-tab.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Settings for snippet manager coc-snippets (relies on UltiSnips).
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
"let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
"let g:coc_snippet_prev = '<c-k>'
" Use <C-y> to trigger auto-import.
"inoremap <expr> <C-j> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
"vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for both expand and jump (make expand higher priority.)
"imap <C-j> <Plug>(coc-snippets-expand-jump)

" Easy way to edit and source this file.
nnoremap <leader>econf :tabfind $MYVIMRC<cr>
nnoremap <leader>sconf :source $MYVIMRC<cr>
