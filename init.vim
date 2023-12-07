" Automatically install Vim-Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'sjl/badwolf'
Plug 'kepano/flexoki'

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" File explorer
Plug 'preservim/nerdtree'

" Commentary Plugin
Plug 'preservim/nerdcommenter'

" File icons
Plug 'ryanoasis/vim-devicons'

" Linting
Plug 'dense-analysis/ale'

" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'justinmk/vim-sneak'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'andymass/vim-matchup'

" Semantic language support
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'hrsh7th/cmp-path', {'branch': 'main'}
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'ray-x/lsp_signature.nvim'

" Snippets
Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
Plug 'hrsh7th/vim-vsnip'

" Syntactic language support
Plug 'cespare/vim-toml', {'branch': 'main'}
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" GitHub Copilot
Plug 'github/copilot.vim'

call plug#end()

" Set the color scheme
colorscheme badwolf

" General settings
set nocompatible
filetype off
set rtp+=~/.config/nvim/plugged/vim-plug
filetype plugin indent on

" Autocommands
autocmd FileType rust setlocal omnifunc=v:lua.CocAction("doCodeAction")

" COC settings
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

" GUI settings
set vb t_vb= " No more beeps
set ttyfast
set lazyredraw
set relativenumber " Relative line numbers
set number " Also show current absolute line
set showcmd " Show (partial) command in the status line.
set mouse=a " Enable mouse usage (all modes) in terminals
set shortmess+=c " don't give |ins-completion-menu| messages.
set listchars=nbsp:¬,extends:»,precedes:«,trail:• " Show hidden characters
set autoindent expandtab tabstop=4 shiftwidth=4 smarttab softtabstop=4 " Set indentation settings
set clipboard=unnamedplus " Set clipboard to use system clipboard
noremap <C-c> "+y " Map <Ctrl-c> to copy
noremap <C-v> "+p " Map <Ctrl-v> to paste
let mapleader = "\<Space>" " Set <leader> key to space

" NERDTree
nmap <C-n> :NERDTreeToggle<CR>

" File finder
nmap <C-f> :Files<CR>

" Quick-save
nmap <leader>w :w<CR>

" Terminal shortcuts
nnoremap <leader>h :split \| terminal<CR> " Split horizontally and open terminal
nnoremap <leader>v :vsplit \| terminal<CR> " Split vertically and open terminal

" Buffer navigation
nnoremap <Space><Left> :bp<CR> " Switch to previous buffer
nnoremap <Space><Right> :bn<CR> " Switch to next buffer

" Highlight yank
au TextYankPost * silent! lua vim.highlight.on_yank()

" Enable 'nvim-cmp' plugin
if has('nvim-0.5')
  let g:cmp_snippet = 'expand'
  let g:cmp_mapping = {
    \ '<C-b>': 'cmp.mapping.scroll_docs(-4)',
    \ '<C-f>': 'cmp.mapping.scroll_docs(4)',
    \ '<C-Space>': 'cmp.mapping.complete()',
    \ '<C-e>': 'cmp.mapping.abort()',
    \ '<CR>': 'cmp.mapping.confirm({ select = true })',
  \ }

  call cmp#setup({
    \ 'snippet': {
      \ 'expand': (v:val, v:count, v:expr) -> v:val,
    \ },
    \ 'mapping': g:cmp_mapping,
    \ 'sources': cmp#config#sources(),
  \ })

  call cmp#setup.cmdline({
    \ 'mapping': g:cmp_mapping,
    \ 'sources': cmp#config#sources(),
  \ })
endif

" LSP settings
function! s:on_attach(client, bufnr)
  setlocal omnifunc=v:lua.vim.lsp.omnifunc

  nnoremap <silent> <buffer> gd :lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> <buffer> K :lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> <buffer> gi :lua vim.lsp.buf.implementation()<CR>
  nnoremap <silent> <buffer> <C-k> :lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> <buffer> <Space>D :lua vim.lsp.buf.type_definition()<CR>
  nnoremap <silent> <buffer> <Space>r :lua vim.lsp.buf.rename()<CR>
  nnoremap <silent> <buffer> <Space>a :lua vim.lsp.buf.code_action()<CR>
  nnoremap <silent> <buffer> gr :lua vim.lsp.buf.references()<CR>
  nnoremap <silent> <buffer> <Space>e :lua vim.diagnostic.open_float()<CR>
  nnoremap <silent> <buffer> [d :lua vim.diagnostic.goto_prev()<CR>
  nnoremap <silent> <buffer> ]d :lua vim.diagnostic.goto_next()<CR>
  nnoremap <silent> <buffer> <Space>q :lua vim.diagnostic.set_loclist()<CR>
  nnoremap <silent> <buffer> <Space>f :lua vim.lsp.buf.format()<CR>

  call lsp_signature#on_attach({
    \ 'doc_lines': 0,
    \ 'handler_opts': {
      \ 'border': 'none',
    \ },
  \ })
endfunction

" Rust LSP
augroup lsp_rust
  autocmd!
  autocmd FileType rust lua require('lspconfig').rust_analyzer.setup({
    \ on_attach = function(client, bufnr)
    \   s:on_attach(client, bufnr)
    \ end,
    \ capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    \ })
augroup END

" Go LSP
augroup lsp_go
  autocmd!
  autocmd FileType go lua require('lspconfig').gopls.setup({
    \ on_attach = function(client, bufnr)
    \   s:on_attach(client, bufnr)
    \ end,
    \ capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    \ })
augroup END

" JavaScript/TypeScript LSP
augroup lsp_js_ts
  autocmd!
  autocmd FileType javascript,typescript lua require('lspconfig').tsserver.setup({
    \ on_attach = function(client, bufnr)
    \   s:on_attach(client, bufnr)
    \ end,
    \ capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    \ })
augroup END

" HTML LSP
augroup lsp_html
  autocmd!
  autocmd FileType html lua require('lspconfig').html.setup({
    \ on_attach = function(client, bufnr)
    \   s:on_attach(client, bufnr)
    \ end,
    \ capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    \ })
augroup END

" CSS LSP
augroup lsp_css
  autocmd!
  autocmd FileType css lua require('lspconfig').cssls.setup({
    \ on_attach = function(client, bufnr)
    \   s:on_attach(client, bufnr)
    \ end,
    \ capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    \ })
augroup END

" Python LSP
augroup lsp_python
  autocmd!
  autocmd FileType python lua require('lspconfig').pyright.setup({
    \ on_attach = function(client, bufnr)
    \   s:on_attach(client, bufnr)
    \ end,
    \ capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    \ })
augroup END

" Julia LSP
augroup lsp_julia
  autocmd!
  autocmd FileType julia lua require('lspconfig').julials.setup({
    \ on_attach = function(client, bufnr)
    \   s:on_attach(client, bufnr)
    \ end,
    \ capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    \ })
augroup END

" Scala LSP
augroup lsp_scala
  autocmd!
  autocmd FileType scala lua require('lspconfig').metals.setup({
    \ on_attach = function(client, bufnr)
    \   s:on_attach(client, bufnr)
    \ end,
    \ capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    \ })
augroup END

" Markdown LSP
augroup lsp_markdown
  autocmd!
  autocmd FileType markdown lua require('lspconfig').texlab.setup({
    \ on_attach = function(client, bufnr)
    \   s:on_attach(client, bufnr)
    \ end,
    \ capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    \ })
augroup END

" GitHub Copilot
let g:copilot_enable = 1

" Additional settings
let g:secure_modelines_allowed_items = [
  \ "textwidth",   "tw",
  \ "softtabstop", "sts",
  \ "tabstop",     "ts",
  \ "shiftwidth",  "sw",
  \ "expandtab",   "et",   "noexpandtab", "noet",
  \ "filetype",    "ft",
  \ "foldmethod",  "fdm",
  \ "readonly",    "ro",   "noreadonly", "noro",
  \ "rightleft",   "rl",   "norightleft", "norl",
  \ "colorcolumn"
  \ ]

" Lightline
let g:lightline = {
  \ 'active': {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'readonly', 'filename', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileencoding', 'filetype' ] ],
    \ },
  \ 'component_function': {
    \ 'filename': 'LightlineFilename'
  \ },
\ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" Better completion display
set completeopt=menuone,noinsert,noselect
set cmdheight=2
set updatetime=300

" Enable type inlay hints
autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = 1 }

" Better display for diagnostic messages
let g:vim.lsp.handlers["textDocument/publishDiagnostics"] = function('vim.lsp.diagnostic.on_publish_diagnostics', {
  \ 'virtual_text': v:true,
  \ 'signs': v:true,
  \ 'update_in_insert': v:true,
\ })

" Ignore .lvimrc
let g:localvimrc_ask = 0

" Rust settings
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

" Go settings
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_bin_path = expand("~/dev/go/bin")
