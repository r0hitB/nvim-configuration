" Automatically install Vim-Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'kepano/flexoki'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/edge'
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
Plug 'sjl/badwolf'



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

" Language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml', {'branch': 'main'}
Plug 'stephpy/vim-yaml'
Plug 'rhysd/vim-clang-format'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Snippets
Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
Plug 'hrsh7th/vim-vsnip'


" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'nvim-telescope/telescope-fzf-writer.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'nvim-telescope/telescope-packer.nvim'
Plug 'nvim-telescope/telescope-github.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-packer.nvim'


" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


" GitHub Copilot
Plug 'github/copilot.vim'

call plug#end()


" Set the font
set autoindent expandtab tabstop=4 shiftwidth=4 smarttab softtabstop=4

" General settings
set nocompatible
filetype off
set rtp+=~/.config/nvim/plugged/vim-plug
filetype plugin indent on
syntax enable
set hidden
set encoding=utf-8
set fileencoding=utf-8
set termguicolors
set backspace=indent,eol,start
set history=1000
set undolevels=1000
set undofile
set incsearch
set hlsearch
set ignorecase
set smartcase
set scrolloff=8
set sidescrolloff=8
set wildmenu
set wildmode=list:longest
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*.sqlite3,*.pdf
set clipboard=unnamedplus
set lazyredraw
set relativenumber
set number
set showcmd
set mouse=a
set shortmess+=c
set listchars=nbsp:¬,extends:»,precedes:«,trail:•
"set autoindent expandtab tabstop=4 shiftwidth=4 smarttab softtabstop=4

" GUI settings
set vb t_vb= " No more beeps
set ttyfast " Faster redrawing
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
set completefunc=emoji#complete " For emoji

set guifont=Bitstream\ Vera\ Sans\ Mono:h12

colorscheme badwolf
"colorscheme gruvbox
"colorscheme gruvbox-material
"colorscheme gruvbox-material-light
"colorscheme gruvbox-material-darker
"colorscheme gruvbox-material-hard
"colorscheme gruvbox-material-soft
"colorscheme edge
"colorscheme everforest
"colorscheme everforest-hard
"colorscheme everforest-dark
"colorscheme everforest-light
"colorscheme sonokai
"colorscheme sonokai-light
"colorscheme sonokai-spectrum
"colorscheme sonokai-soft
"colorscheme sonokai-compact
"colorscheme sonokai-compact-light
"colorscheme sonokai-compact-spectrum
"colorscheme sonokai-compact-soft
"colorscheme sonokai-compact-mirage
"colorscheme sonokai-compact-dark




" COC settings

" Enable coc.nvim
let g:coc_global_extensions = ['coc-snippets', 'coc-rust-analyzer', 'coc-json', 'coc-tsserver']

" Use <Tab> for trigger completion and navigate through documentation
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use K to show documentation in preview window
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

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

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" Append Emoji list to current buffer
for e in emoji#list()
  call append(line('$'), printf('%s (%s)', emoji#for(e), e))
endfor


" NERDTree
" Open NERDTree automatically when vim starts up on opening a directory if no files were specified.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-n> :NERDTreeToggle<CR>

" File finder
nmap <C-f> :Files<CR>

" Quick-save
nmap <leader>w :w<CR>
" Terminal shortcuts
nnoremap <leader>h :split \| terminal<CR> " Split horizontally and open terminal
nnoremap <leader>v :vsplit \| terminal<CR> " Split vertically and open terminal
tnoremap <Esc> <C-\><C-n> " Exit terminal with <Esc>

" Buffer navigation
nnoremap <Space><Left> :bp<CR> " Switch to previous buffer
nnoremap <Space><Right> :bn<CR> " Switch to next buffer
nnoremap <Space><Up> :bp<CR> " Switch to previous buffer
nnoremap <Space><Down> :bn<CR> " Switch to next buffer

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

" Vimscript LSP
augroup lsp_vimscript
  autocmd!
  autocmd FileType vim lua require('lspconfig').vimls.setup({
    \ on_attach = function(client, bufnr)
    \   s:on_attach(client, bufnr)
    \ end,
    \ capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    \ })
augroup END

" Lua LSP
augroup lsp_lua
  autocmd!
  autocmd FileType lua lua require('lspconfig').sumneko_lua.setup({
    \ cmd = { 'lua-language-server' },
    \ on_attach = function(client, bufnr)
    \   s:on_attach(client, bufnr)
    \ end,
    \ settings = {
      \ Lua = {
        \ diagnostics = {
          \ globals = { 'vim' },
        \ },
      \ },
    \ },
    \ capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    \ })

augroup END

" Github
augroup lsp_github
  autocmd!
  autocmd FileType github lua require('lspconfig').ghcide.setup({
    \ cmd = { 'ghcide', '--lsp' },
    \ on_attach = function(client, bufnr)
    \   s:on_attach(client, bufnr)
    \ end,
    \ settings = {
      \ ghcide = {
        \ diagnostics = {
          \ hlintOn = true,
        \ },
      \ },
    \ },
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
"
""Lightline
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

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
nnoremap <leader>fm <cmd>Telescope marks<cr>
nnoremap <leader>fr <cmd>Telescope registers<cr>
nnoremap <leader>fs <cmd>Telescope git_status<cr>
nnoremap <leader>ft <cmd>Telescope treesitter<cr>
nnoremap <leader>fd <cmd>Telescope lsp_document_diagnostics<cr>
nnoremap <leader>fw <cmd>Telescope lsp_workspace_diagnostics<cr>
nnoremap <leader>fo <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>fn <cmd>Telescope lsp_dynamic_workspace_symbols<cr>
nnoremap <leader>fp <cmd>Telescope projects<cr>
nnoremap <leader>fq <cmd>Telescope quickfix<cr>
nnoremap <leader>fl <cmd>Telescope loclist<cr>
nnoremap <leader>fe <cmd>Telescope file_browser<cr>
nnoremap <leader>fv <cmd>Telescope vim_options<cr>
nnoremap <leader>fk <cmd>Telescope keymaps<cr>


"Better completion display
set completeopt=menuone,noinsert,noselect
set cmdheight=2
set updatetime=300
set shortmess+=c

" Enable type inlay hints
autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = 1 }

" Better display for diagnostic messages
let g:vim.lsp.handlers["textDocument/publishDiagnostics"] = function('vim.lsp.diagnostic.on_publish_diagnostics', {
  \ 'virtual_text': v:true,
  \ 'signs': v:true,
  \ 'update_in_insert': v:true,
\ })
"


" Ignore .lvimrc
let g:localvimrc_ask = 0
let g:localvimrc_whitelist = ['\.lvimrc$']


" Rust settings
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'
let g:rust_clip_mode = 'unnamedplus'
let g:rustfmt_options = ['--emit=files']


" Go settings
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_bin_path = expand("~/dev/go/bin")
let g:go_def_mapping_enabled = 0
let g:go_info_mode = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_fold_enable = 1
let g:go_highlight_fold_enable_custom = 1
let g:go_highlight_fold_custom_regions = ['^\\s*func\\s*\\w*(']
let g:go_highlight_fold_show_comments = 1

" JavaScript/TypeScript settings
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_jsdoc = 1

" HTML settings
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_script2 = "inc"
let g:html_indent_style2 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_style2 = "inc"
let g:html_indent_style3 = "inc"
let g:html_indent_style4 = "inc"
let g:html_indent_style5 = "inc"
let g:html_indent_style6 = "inc"
let g:html_indent_style7 = "inc"
let g:html_indent_style8 = "inc"
let g:html_indent_style9 = "inc"
let g:html_indent_style10 = "inc"
let g:html_indent_style11 = "inc"
let g:html_indent_style12 = "inc"
let g:html_indent_style13 = "inc"
let g:html_indent_style14 = "inc"
let g:html_indent_style15 = "inc"
let g:html_indent_style16 = "inc"
let g:html_indent_style17 = "inc"   
let g:html_indent_style18 = "inc"
let g:html_indent_style19 = "inc"
let g:html_indent_style20 = "inc"

" CSS settings
let g:css_indent_style = "inc"
let g:css_indent_style1 = "inc"
let g:css_indent_style2 = "inc"
let g:css_indent_style3 = "inc"
let g:css_indent_style4 = "inc"
let g:css_indent_style5 = "inc"
let g:css_indent_style6 = "inc"
let g:css_indent_style7 = "inc"
let g:css_indent_style8 = "inc"
let g:css_indent_style9 = "inc"
let g:css_indent_style10 = "inc"
let g:css_indent_style11 = "inc"
let g:css_indent_style12 = "inc"
let g:css_indent_style13 = "inc"
let g:css_indent_style14 = "inc"
let g:css_indent_style15 = "inc"
let g:css_indent_style16 = "inc"
let g:css_indent_style17 = "inc"
let g:css_indent_style18 = "inc"
let g:css_indent_style19 = "inc"
let g:css_indent_style20 = "inc"

" Python settings
let g:python_highlight_all = 1
let g:python_highlight_builtins = 1
let g:python_highlight_builtin_vars = 1
let g:python_highlight_exceptions = 1
let g:python_highlight_extra_builtin = 1
let g:python_highlight_func_calls = 1
let g:python_highlight_func_args = 1
let g:python_highlight_space_errors = 1

" Julia settings
let g:julia_indent_align_brackets = 1
let g:julia_indent_align_funcargs = 1
let g:julia_indent_align_funcargs_bracket = 1
let g:julia_indent_align_funcargs_comma = 1
let g:julia_indent_align_funcargs_end = 1
let g:julia_indent_align_funcargs_start = 1
let g:julia_indent_align_paren = 1

" Scala settings
let g:scala_indent_align_args = 1
let g:scala_indent_align_parameters = 1
let g:scala_indent_align_with_open_bracket = 1


" Markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
