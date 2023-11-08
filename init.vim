" ~/.config/nvim/init.vim

" Automatically install Vim-Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Automatically install plugins on Vim-Plug load

"Plugins go here!
call plug#begin('~/.config/nvim/plugged')

"Themes go here!
Plug 'sjl/badwolf'
Plug 'kepano/flexoki'


Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletion
Plug 'preservim/nerdtree'                       " File explorer
Plug 'preservim/nerdcommenter'                  " Commentary Plugin
Plug 'ryanoasis/vim-devicons'                   " File icons
Plug 'dense-analysis/ale'                       " Linting

" Load plugins
" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'


" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'andymass/vim-matchup'


" Semantic language support
"Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/lsp_extensions.nvim'
"Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
"Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
"Plug 'hrsh7th/cmp-path', {'branch': 'main'}
"Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
"Plug 'ray-x/lsp_signature.nvim'

" Only because nvim-cmp _requires_ snippets
"Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
"Plug 'hrsh7th/vim-vsnip'

" Syntactic language support
Plug 'cespare/vim-toml', {'branch': 'main'}
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
"Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'



call plug#end()

" Set the color schemes
colorscheme badwolf
"colorscheme flexoki


set nocompatible
filetype off
set rtp+=~/.config/nvim/plugged/vim-plug
filetype plugin indent on

autocmd FileType rust setlocal omnifunc=v:lua.CocAction("doCodeAction")
let g:coc_global_extensions = [
    \ 'coc-marketplace',
    \ 'coc-snippets',
    \ 'coc-rust-analyzer',
    \ ]

let g:coc_config = {
  \ 'rust-analyzer': {
  \   'proactiveInlayHints': 1,
  \   'diagnostics': {
  \     'disabled': ['unresolved-import'],
  \   },
  \   'checkOnSave': {
  \     'command': 'clippy',
  \     'all_targets': 1,
  \   },
  \ },
  \ }



autocmd FileType rust setlocal omnifunc=v:lua.CocAction("doCodeAction")
let g:coc_global_extensions = [
    \ 'coc-marketplace',
    \ 'coc-snippets',
    \ 'coc-rust-analyzer',
    \ ]

let g:coc_config = {
  \ 'rust-analyzer': {
  \   'proactiveInlayHints': 1,
  \   'diagnostics': {
  \     'disabled': ['unresolved-import'],
  \   },
  \   'checkOnSave': {
  \     'command': 'clippy',
  \     'all_targets': 1,
  \   },
  \ },
  \ }





" =============================================================================
" # GUI settings
" =============================================================================
"set guioptions-=T " Remove toolbar

set vb t_vb= " No more beeps

"set backspace=2 " Backspace over newlines

"set nofoldenable

set ttyfast
" https://github.com/vim/vim/issues/1735#issuecomment-383353563

set lazyredraw

"set synmaxcol=500

"set laststatus=2

set relativenumber " Relative line numbers

set number " Also show current absolute line

"set diffopt+=iwhite " No whitespace in vimdiff

 "Make diffing better: https://vimways.org/2018/the-power-of-diff/

set diffopt+=algorithm:patience

set diffopt+=indent-heuristic

"set colorcolumn=80 " and give me a colored column

set showcmd " Show (partial) command in the status line.

set mouse=a " Enable mouse usage (all modes) in terminals

set shortmess+=c " don't give |ins-completion-menu| messages.

au TextYankPost * silent! lua vim.highlight.on_yank() " Highlight yank


" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

" Set indentation settings
set autoindent expandtab tabstop=4 shiftwidth=4 smarttab softtabstop=4

" For emoji
set guifont=YourEmojiFontName:h12

nmap <C-n> :NERDTreeToggle<CR>

" Remap file finder to <Space>f
nmap <C-f> :Files<CR>

" Quick-save
nmap <leader>w :w<CR>

" Set clipboard to use system clipboard
set clipboard=unnamedplus

" Map <Ctrl-c> and <Ctrl-v> for copy and paste
noremap <C-c> "+y
noremap <C-v> "+p

" Set <leader> key to space
let mapleader = "\<Space>"

" Use <leader>h to split the window horizontally and open a terminal
nnoremap <leader>h :split \| terminal<CR>

" Use <leader>v to split the window vertically and open a terminal
nnoremap <leader>v :vsplit \| terminal<CR>

" Map space + left arrow to switch to the previous buffer (:bp)
nnoremap <Space><Left> :bp<CR>

" Map space + right arrow to switch to the next buffer (:bn)
nnoremap <Space><Right> :bn<CR>

" Customize the highlight a bit.
" Make comments more prominent -- they are important.
lua << END
local bools = vim.api.nvim_get_hl(0, { name = 'Boolean' })
vim.api.nvim_set_hl(0, 'Comment', bools)
END

" Make it clearly visible which argument we're at.
lua << END
local marked = vim.api.nvim_get_hl(0, { name = 'PMenu' })
vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = marked.fg, bg = marked.bg, ctermfg = marked.ctermfg, ctermbg = marked.ctermbg, bold = true })
END









" =============================================================================
" # Autocommands
" =============================================================================
" Prevent accidental writes to buffers that shouldn't be edited
autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly

" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Follow Rust code style rules
au Filetype rust source ~/.config/nvim/scripts/spacetab.vim
au Filetype rust set colorcolumn=100

" Help filetype detection
autocmd BufRead *.plot set filetype=gnuplot
autocmd BufRead *.md set filetype=markdown
autocmd BufRead *.lds set filetype=ld
autocmd BufRead *.tex set filetype=tex
autocmd BufRead *.trm set filetype=c
autocmd BufRead *.xlsx.axlsx set filetype=ruby

" Script plugins
autocmd Filetype html,xml,xsl,php source ~/.config/nvim/scripts/closetag.vim






" =============================================================================
" # Footer
" =============================================================================

" nvim
if has('nvim')
  runtime! plugin/python_setup.vim
endif




" =============================================================================
" # Keyboard shortcuts
" =============================================================================

" Jump to start and end of line using the home row keys
map H ^
map L $





" Enable 'nvim-cmp' plugin
"if has('nvim-0.5')
  " Set up 'cmp'
 " let g:cmp_snippet = 'expand'
  "let g:cmp_mapping = {
   " \ '<C-b>': 'cmp.mapping.scroll_docs(-4)',
    "\ '<C-f>': 'cmp.mapping.scroll_docs(4)',
    "\ '<C-Space>': 'cmp.mapping.complete()',
    "\ '<C-e>': 'cmp.mapping.abort()',
    "\ '<CR>': 'cmp.mapping.confirm({ select = true })',
    "\ }

 " Set up 'cmp' sources
"call cmp#setup({
  \ 'snippet': {
  "\   'expand': (v:val, v:count, v:expr) -> v:val,  " Customize snippet behavior here
  \ },
  "\ 'mapping': g:cmp_mapping,
  "\ 'sources': cmp#config#sources(),  " This should work if nvim-cmp is correctly installed
  "\ })

" Enable 'nvim-cmp' for cmdline mode
"call cmp#setup.cmdline({
 " \ 'mapping': g:cmp_mapping,
  "\ 'sources': cmp#config#sources(),  " This should work if nvim-cmp is correctly installed
  "\ })
 "endif

  "" Setup 'lspconfig'
  "function! s:on_attach(client, bufnr)
    " Enable completion triggered by <C-x><C-o>
   " setlocal omnifunc=v:lua.vim.lsp.omnifunc

    " Mappings
   " nnoremap <silent> <buffer> gD :lua vim.lsp.buf.declaration()<CR>
    "nnoremap <silent> <buffer> gd :lua vim.lsp.buf.definition()<CR>
    "nnoremap <silent> <buffer> K :lua vim.lsp.buf.hover()<CR>
    "nnoremap <silent> <buffer> gi :lua vim.lsp.buf.implementation()<CR>
    "nnoremap <silent> <buffer> <C-k> :lua vim.lsp.buf.signature_help()<CR>
    "nnoremap <silent> <buffer> <Space>D :lua vim.lsp.buf.type_definition()<CR>
    "nnoremap <silent> <buffer> <Space>r :lua vim.lsp.buf.rename()<CR>
    "nnoremap <silent> <buffer> <Space>a :lua vim.lsp.buf.code_action()<CR>
    "nnoremap <silent> <buffer> gr :lua vim.lsp.buf.references()<CR>
    "nnoremap <silent> <buffer> <Space>e :lua vim.diagnostic.open_float()<CR>
    "nnoremap <silent> <buffer> [d :lua vim.diagnostic.goto_prev()<CR>
    "nnoremap <silent> <buffer> ]d :lua vim.diagnostic.goto_next()<CR>
    "nnoremap <silent> <buffer> <Space>q :lua vim.diagnostic.set_loclist()<CR>
    "nnoremap <silent> <buffer> <Space>f :lua vim.lsp.buf.format()<CR>

    " Disable semanticTokensProvider
    "let client.server_capabilities.semanticTokensProvider = 0

    " Get signatures (and _only_ signatures) when in argument lists
    "call lsp_signature#on_attach({
     "   \ 'doc_lines': 0,
      "  \ 'handler_opts': {
       " \ 'border': 'none',
        "\ },
        "\ })
  "endfunction

  " Set up capabilities
  "let capabilities = g:cmp_nvim_lsp#default_capabilities()

  " Configure 'rust_analyzer' LSP
  "call lspconfig#rust_analyzer#setup({
   "     \ 'on_attach': function('s:on_attach'),
        "\ 'flags': {
       "\ 'debounce_text_changes': 150,
        "\ },
        "\ 'settings': {
        "\ 'rust-analyzer': {
        "\ 'cargo': {
        "\ 'allFeatures': v:true,
        "\ },
        "\ 'completion': {
        "\ 'postfix': {
       " \ 'enable': v:false,
        "\ },
        "\ },
        "\ },
        "\ 'capabilities': capabilities,
        "\ })

  " Set up diagnostics display
  "let g:vim.lsp.handlers["textDocument/publishDiagnostics"] = function('vim.lsp.diagnostic.on_publish_diagnostics', {
  "      \ 'virtual_text': v:true,
    "    \ 'signs': v:true,
     "   \ 'update_in_insert': v:true,
        "  \ })
" endif


" Enable type inlay hints
"autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = 1 }

" Plugin settings
"let g:secure_modelines_allowed_items = [
 "               \ "textwidth",   "tw",
  "              \ "softtabstop", "sts",
  "             "\ "tabstop",     "ts",
                "\ "shiftwidth",  "sw",
                "\ "expandtab",   "et",   "noexpandtab", "noet",
                "\ "filetype",    "ft",
                "\ "foldmethod",  "fdm",
                "\ "readonly",    "ro",   "noreadonly", "noro",
                "\ "rightleft",   "rl",   "norightleft", "norl",
                "\ "colorcolumn"
                "\ ]

" Lightline
"let g:lightline = {
 "     \ 'active': {
  "    \   'left': [ [ 'mode', 'paste' ],
      "\             [ 'readonly', 'filename', 'modified' ] ],
     " \   'right': [ [ 'lineinfo' ],
      "\              [ 'percent' ],
      "\              [ 'fileencoding', 'filetype' ] ],
      "\ },
      "\ 'component_function': {
     " \   'filename': 'LightlineFilename'
    "  \ },
   "   \ }
"function! LightlineFilename()
 " return expand('%:t') !=# '' ? @% : '[No Name]'
"endfunction

" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
"if executable('ag')
"	set grepprg=ag\ --nogroup\ --nocolor
"endif
"if executable('rg')
"	set grepprg=rg\ --no-heading\ --vimgrep
"	set grepformat=%f:%l:%c:%m
"endif



" Javascript
let javaScript_fold=0

" Java
let java_ignore_javadoc=1

" Latex
let g:latex_indent_enabled = 1
let g:latex_fold_envs = 0
let g:latex_fold_sections = []



" Don't confirm .lvimrc
let g:localvimrc_ask = 0

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

" Completion
" Better completion
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Golang
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_bin_path = expand("~/dev/go/bin")
