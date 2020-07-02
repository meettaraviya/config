set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}



" My plugins
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'valloric/youcompleteme'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'w0rp/ale'
Plugin 'godlygeek/tabular'
Plugin 'ocaml/vim-ocaml'

" All of your Plugins must be added before the following line
call vundle#end()            " required



autocmd VimEnter * NERDTree
autocmd BufWinEnter * NERDTreeMirror


set showcmd " Show (partial) command in status line.
set showmatch " Show matching brackets.
set ignorecase " Do case insensitive matching
set smartcase " Do smart case matching
set incsearch " Incremental search
set autowrite " Automatically save before commands like :next and :make
set hidden " Hide buffers when they are abandoned
set mouse=a " Enable mouse usage (all modes)


" Set compatibility to Vim only.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on
syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

" For plug-ins to load correctly.
filetype plugin indent on

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap
" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
vnoremap <C-c> :w !pbcopy<CR><CR> noremap <C-v> :r !pbpaste<CR><CR>

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"

set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

set foldmethod=syntax


" PLUGINS

 " Call the .vimrc.plug file
 if filereadable(expand("~/.vimrc.plug"))
     source ~/.vimrc.plug
 endif

set whichwrap+=<,>,[,]






" Turn on the whole plugin.                                            *'g:pymode'*
" >
" let g:pymode = 1

" Turn off plugin's warnings.                                 *'g:pymode_warnings'*
" >
let g:pymode_warnings = 1

" Add paths to `sys.path`                                          *'g:pymode_paths'*
" Value is list of path's strings.
" >
let g:pymode_paths = []

" Trim unused white spaces on save.                   *'g:pymode_trim_whitespaces'*
" >
let g:pymode_trim_whitespaces = 1

" Setup default python options.                                *'g:pymode_options'*
" >
let g:pymode_options = 1

" If this option is set to 1, pymode will enable the following options for
" python buffers: >

"    setlocal complete+=t
"    setlocal formatoptions-=t
"    if v:version > 702 && !&relativenumber
"        setlocal number
"    endif
"    setlocal nowrap
"    setlocal textwidth=79
"    setlocal commentstring=#%s
"    setlocal define=^\s*\\(def\\\\|class\\)

" Setup max line length                        *'g:pymode_options_max_line_length'*
" >
let g:pymode_options_max_line_length = 79

" Enable colorcolumn display at max_line_length.   *'g:pymode_options_colorcolumn'*
" >
let g:pymode_options_colorcolumn = 1

" Setup pymode |quickfix| window.

"                   *'g:pymode_quickfix_maxheight'*  *'g:pymode_quickfix_minheight'*
" >
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6

" Set pymode |preview| window height.                     *'g:pymode_preview_height'*
" Preview window is used to show documentation and ouput from |pymode-run|.
" >
let g:pymode_preview_height = &previewheight

" Set where pymode |preview| window will appear.        *'g:pymode_preview_position'*
" >
let g:pymode_preview_position = 'botright'

" Value is command which can influcece where new window created by `:new` command
" will appear, eg. `:botright`.

" -------------------------------------------------------------------------------
" 2.1. Python version ~
"                                                           *pymode-python-version*

" By default pymode will attempt to use Python 3, if available. However, you can
" also disable all Python features of pymode.

"                                                               *'g:pymode_python'*
" >
let g:pymode_python = 'python'

" Values are `python3`, `disable`. If value set to `disable` most
" python-features of **pymode** will be disabled.

" Set value to `python3` if you are working with python3 projects. You could use
" |exrc|

" -------------------------------------------------------------------------------
" 2.2 Python indentation ~
"                                                                   *pymode-indent*

" Pymode supports PEP8-compatible python indent.
" Enable pymode indentation                                     *'g:pymode_indent'*
" >
let g:pymode_indent = 1

" -------------------------------------------------------------------------------
" 2.3 Python folding ~
"                                                                  *pymode-folding*

" Enable pymode folding                                        *'g:pymode_folding'*
" >
let g:pymode_folding = 1

" Currently folding is considered experimental. There are several issues with
" its implementation.

" -------------------------------------------------------------------------------
" 2.4 Vim motion ~
"                                                                  *pymode-motion*

" Support Vim motion (See |operator|) for python objects (such as functions,
" class and methods).

" `C` — means class
" `M` — means method or function
"                                                              *pymode-motion-keys*

" ====  ============================
" Key   Command
" ====  ============================
" [[    Jump to previous class or function (normal, visual, operator modes)
" ]]    Jump to next class or function  (normal, visual, operator modes)
" [M    Jump to previous class or method (normal, visual, operator modes)
" ]M    Jump to next class or method (normal, visual, operator modes)
" aC    Select a class. Ex: vaC, daC, yaC, caC (normal, operator modes)
" iC    Select inner class. Ex: viC, diC, yiC, ciC (normal, operator modes)
" aM    Select a function or method. Ex: vaM, daM, yaM, caM (normal, operator modes)
" iM    Select inner function or method. Ex: viM, diM, yiM, ciM (normal, operator modes)
" ====  ============================

" Enable pymode-motion                                          *'g:pymode_motion'*
" >
let g:pymode_motion = 1

" -------------------------------------------------------------------------------
" 2.5 Show documentation ~
"                                                            *pymode-documentation*

" Pymode could show documentation for current word by `pydoc`.

" Commands:
" *:PymodeDoc* <args> — show documentation

" Turns on the documentation script                                *'g:pymode_doc'*
" >
let g:pymode_doc = 1

" Bind keys to show documentation for current word (selection)
"                                                             *'g:pymode_doc_bind'*
" >
let g:pymode_doc_bind = 'K'

" -------------------------------------------------------------------------------
" 2.6 Support virtualenv ~
"                                                               *pymode-virtualenv*

" Commands:
" *:PymodeVirtualenv* <path> -- Activate virtualenv (path can be absolute or
" relative to current working directory)

" Enable automatic virtualenv detection                     *'g:pymode_virtualenv'*
" >
let g:pymode_virtualenv = 1

" Set path to virtualenv manually                      *'g:pymode_virtualenv_path'*
" >
let g:pymode_virtualenv_path = $VIRTUAL_ENV

" -------------------------------------------------------------------------------
" 2.7 Run code ~
"                                                                      *pymode-run*

" Commands:
" *:PymodeRun* -- Run current buffer or selection

" Turn on the run code script                                      *'g:pymode_run'*
" >
let g:pymode_run = 1

" Binds keys to run python code                               *'g:pymode_run_bind'*
" >
let g:pymode_run_bind = '<leader>r'

" -------------------------------------------------------------------------------
" 2.8 Breakpoints ~
"                                                              *pymode-breakpoints*

" Pymode automatically detects available debugger (like pdb, ipdb, pudb) and user
" can set/unset breakpoint with one key and without code checking and etc.

" Enable functionality                                      *'g:pymode_breakpoint'*
" >
let g:pymode_breakpoint = 1

" Bind keys
" >
let g:pymode_breakpoint_bind = '<leader>b'

" Manually set breakpoint command (leave empty for automatic detection)
" >
let g:pymode_breakpoint_cmd = ''


" ===============================================================================
" 3. Code checking ~
"                                                                     *pymode-lint*

" Pymode supports `pylint`, `pep257`, `pep8`, `pyflakes`, `mccabe` code
" checkers. You could run several similar checkers.

"        Pymode uses Pylama library for code checking. Many options like skip
"        files, errors and etc could be defined in `pylama.ini` file or modelines.
"        Check Pylama documentation for details.
"
"        Pylint options (ex. disable messages) may be defined in `$HOME/pylint.rc`
"        See pylint documentation.

" Commands:
" *:PymodeLint* -- Check code in current buffer
" *:PymodeLintToggle* -- Toggle code checking
" *:PymodeLintAuto* -- Fix PEP8 errors in current buffer automatically

" Turn on code checking                                           *'g:pymode_lint'*
" >
let g:pymode_lint = 1

" Check code on every save (if file has been modified)   *'g:pymode_lint_on_write'*
" >
let g:pymode_lint_on_write = 1

" Check code on every save (every)                     *'g:pymode_lint_unmodified'*
" >
let g:pymode_lint_unmodified = 0

" Check code when editing (on the fly)                     *'g:pymode_lint_on_fly'*
" >
let g:pymode_lint_on_fly = 0

" Show error message if cursor placed at the error line   *'g:pymode_lint_message'*
" >
let g:pymode_lint_message = 1

" Default code checkers (you could set several)          *'g:pymode_lint_checkers'*
" >
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']

" Values may be chosen from: `pylint`, `pep8`, `mccabe`, `pep257`, `pyflakes`.

" Skip errors and warnings                                 *'g:pymode_lint_ignore'*
" E.g. ["W", "E2"] (Skip all Warnings and the Errors starting with E2) etc.
" >
let g:pymode_lint_ignore = ["E501", "W",]

" Select some error or warnings.                           *'g:pymode_lint_select'*
" By example you disable all warnings starting from 'W', but want to see warning
" 'W0011' and warning 'W430'
" >
let g:pymode_lint_select = ["E501", "W0011", "W430"]

" Sort errors by relevance                                   *'g:pymode_lint_sort'*
" If not empty, errors will be sort by defined relevance
" E.g. let g:pymode_lint_sort = ['E', 'C', 'I']  " Errors first 'E',
" after them 'C' and ...
" >
let g:pymode_lint_sort = []

" Auto open cwindow (quickfix) if any errors have been found
"                                                         *'g:pymode_lint_cwindow'*
" >
let g:pymode_lint_cwindow = 1

" Place error |signs|                                              *'g:pymode_signs'*
" >
let g:pymode_lint_signs = 1

" Definitions for |signs|
" >
let g:pymode_lint_todo_symbol = 'WW'
let g:pymode_lint_comment_symbol = 'CC'
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = 'EE'
let g:pymode_lint_info_symbol = 'II'
let g:pymode_lint_pyflakes_symbol = 'FF'

" -------------------------------------------------------------------------------
" 3.1 Set code checkers options ~
"                                                             *pymode-lint-options*

" Pymode has the ability to set code checkers options from pymode variables:

" Set PEP8 options                                   *'g:pymode_lint_options_pep8'*
" >
let g:pymode_lint_options_pep8 =
        \ {'max_line_length': g:pymode_options_max_line_length}

" See https://pep8.readthedocs.org/en/1.4.6/intro.html#configuration for more
" info.

" Set Pyflakes options                           *'g:pymode_lint_options_pyflakes'*
" >
let g:pymode_lint_options_pyflakes = { 'builtins': '_' }

" Set mccabe options                               *'g:pymode_lint_options_mccabe'*
" >
let g:pymode_lint_options_mccabe = { 'complexity': 12 }

" Set pep257 options                               *'g:pymode_lint_options_pep257'*
" >
let g:pymode_lint_options_pep257 = {}

" Set pylint options                               *'g:pymode_lint_options_pylint'*
" >
let g:pymode_lint_options_pylint =
        \ {'max-line-length': g:pymode_options_max_line_length}

" See http://docs.pylint.org/features.html#options for more info.


" ===============================================================================
" 4. Rope support ~
"                                                                     *pymode-rope*

" Pymode supports Rope refactoring operations, code completion and code assists.

" Commands:
" |:PymodeRopeAutoImport| -- Resolve import for element under cursor
" |:PymodeRopeModuleToPackage| -- Convert current module to package
" |:PymodeRopeNewProject| -- Open new Rope project in current working directory
" |:PymodeRopeRedo| -- Redo changes from last refactoring
" |:PymodeRopeRegenerate| -- Regenerate the project cache
" |:PymodeRopeRenameModule| -- Rename current module
" |:PymodeRopeUndo| -- Undo changes from last refactoring


" Turn on the rope script                                         *'g:pymode_rope'*
" >
let g:pymode_rope = 1

" .ropeproject Folder ~
"                                                                    *.ropeproject*

" *:PymodeRopeNewProject* [<path>] -- Open new Rope project in the given path
" *:PymodeRopeRegenerate* -- Regenerate the project cache

" Rope uses a folder inside projects for holding project configuration and data.
" Its default name is `.ropeproject`. It is recommended that you do not add the
" .ropeproject folder to version control system.

" Currently it is used for things such as:

" * The config.py file in this folder contains project configuration. Have
"    a look at the default config.py file (which is created when it
"    does not exist) for more information.
" * It can be used for saving project history, so that the next time you open the
"    project you can undo past changes.
" * It can be used to save information about object inferences.
" * It can be used to save a global name cache, which is used for auto-import.

" By default, if `.ropeproject` is not found in the current directory, rope will
" look recursively for it in parent folders.

" Warning: If rope finds `.ropeproject` in a parent dir, it will use it with
" all its child directories, which may slow scanning down (because of many,
" possibly unrelated, files)

" Enable searching for |.ropeproject| in parent directories
"                                                  *'g:pymode_rope_lookup_project'*
" >
let g:pymode_rope_lookup_project = 0

" You can also manually set the rope project directory. If not specified rope will
" use the current directory.
"                                                    *'g:pymode_rope_project_root'*
" >
let g:pymode_rope_project_root = ""


" The location of the `.ropeproject` folder may also be overridden if you wish to
" keep it outside of your project root. The rope library treats this folder as a
" project resource, so the path will always be relative to your project root (a
" leading '/' will be ignored). You may use `'..'` path segments to place the
" folder outside of your project root.
"                                                      *'g:pymode_rope_ropefolder'*
" >
let g:pymode_rope_ropefolder='.ropeproject'


" Show documentation for element under cursor ~

" Show documentation for object under cursor.       *'g:pymode_rope_show_doc_bind'*
" Leave empty to disable the key binding.
" >
let g:pymode_rope_show_doc_bind = '<C-c>d'

" Regenerate project cache on every save (if file has been modified)
" >
let g:pymode_rope_regenerate_on_write = 1

" -------------------------------------------------------------------------------
" 4.1 Completion ~
"                                                               *pymode-completion*

" By default you can use <Ctrl-Space> for autocompletion. The first entry will
" be automatically selected and you can press <Return> to insert the entry in
" your code. <C-X><C-O> and <C-P>/<C-N> works too.

" Autocompletion is also called by typing a period in |Insert| mode by default.

" If there's only one complete item, vim may be inserting it automatically
" instead of using a popup menu. If the complete item which inserted is not
" your wanted, you can roll it back use '<c-w>' in |Insert| mode or setup
" 'completeopt' with `menuone` and `noinsert` in your vimrc. .e.g.
" >
    set completeopt=menuone,noinsert

" Turn on code completion support in the plugin        *'g:pymode_rope_completion'*
" >
let g:pymode_rope_completion = 1

" Turn on autocompletion when typing a period
"                                                 *'g:pymode_rope_complete_on_dot'*
" >
let g:pymode_rope_complete_on_dot = 1

" Keymap for autocomplete                         *'g:pymode_rope_completion_bind'*
" >
let g:pymode_rope_completion_bind = '<C-Space>'

" Extended autocompletion (rope could complete objects which have not been
" imported) from project                               *'g:pymode_rope_autoimport'*
" >
let g:pymode_rope_autoimport = 0

" Load modules to autoimport by default        *'g:pymode_rope_autoimport_modules'*
" >
let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime']

" Offer to unresolved import object after completion.
" >
let g:pymode_rope_autoimport_import_after_complete = 0


" -------------------------------------------------------------------------------
" 4.2 Find definition ~
"                                                              *pymode-rope-findit*

" By default when you press *<C-C>g* on any object in your code you will be moved
" to definition.
" Leave empty for disable key binding.       *'g:pymode_rope_goto_definition_bind'*
" >
let g:pymode_rope_goto_definition_bind = '<C-c>g'

" Command for open window when definition has been found
" Values are (`e`, `new`, `vnew`)                   *'g:pymode_rope_goto_definition_cmd'*
" >
let g:pymode_rope_goto_definition_cmd = 'new'

" -------------------------------------------------------------------------------
" 4.3 Refactoring ~
"                                                         *pymode-rope-refactoring*

" Rename method/function/class/variable in the project ~

" Pymode can rename everything: classes, functions, modules, packages, methods,
" variables and keyword arguments.

" Keymap for rename method/function/class/variables under cursor
"                                                     *'g:pymode_rope_rename_bind'*
" >
let g:pymode_rope_rename_bind = '<C-c>rr'


" Rename a current module/package ~

" *:PymodeRopeRenameModule* -- Rename current module

" Keymap for rename current module             *'g:pymode_rope_rename_module_bind'*
" >
let g:pymode_rope_rename_module_bind = '<C-c>r1r'


" Imports ~

" *:PymodeRopeAutoImport* -- Resolve import for element under cursor

" Organize imports sorts imports, too. It does that according to PEP8. Unused
" imports will be dropped.
" Keymap                                    *'g:pymode_rope_organize_imports_bind'*
" >
let g:pymode_rope_organize_imports_bind = '<C-c>ro'

" Insert import for current word under cursor     *'g:pymode_rope_autoimport_bind'*
" Should be enabled |'g:pymode_rope_autoimport'|
" >
let g:pymode_rope_autoimport_bind = '<C-c>ra'


" Convert module to package ~
"                                          *'g:pymode_rope_module_to_package_bind'*

" *:PymodeRopeModuleToPackage* -- convert current module to package

" Keybinding:
" >
let g:pymode_rope_module_to_package_bind = '<C-c>r1p'


" Extract method/variable ~
"                                                             *pymode-rope-extract*

" Extract method/variable from selected lines.

"                                            *'g:pymode_rope_extract_method_bind'*
"                                          *'g:pymode_rope_extract_variable_bind'*
" >
let g:pymode_rope_extract_method_bind = '<C-c>rm'
let g:pymode_rope_extract_variable_bind = '<C-c>rl'


" Use function ~
"                                                                 *pymode-rope-use*

" It tries to find the places in which a function can be used and changes the
" code to call it instead.
" >
let g:pymode_rope_use_function_bind = '<C-c>ru'


" Move method/fields ~
"                                                                *pymode-rope-move*

" It happens when you perform move refactoring on a method of a class. In this
" refactoring, a method of a class is moved to the class of one of its
" attributes. The old method will call the new method. If you want to change all
" of the occurrences of the old method to use the new method you can inline it
" afterwards.
" >
let g:pymode_rope_move_bind = '<C-c>rv'

" Change function signature ~
" >
let g:pymode_rope_change_signature_bind = '<C-c>rs'


" -------------------------------------------------------------------------------
" 4.4 Undo/Redo changes ~
"                                                                *pymode-rope-undo*
"                                                                *pymode-rope-redo*

" Commands:

" *:PymodeRopeUndo* -- Undo last changes in the project
" *:PymodeRopeRedo* -- Redo last changes in the project


" ===============================================================================
" 5. Syntax ~
"                                                                   *pymode-syntax*

" Turn on pymode syntax                                         *'g:pymode_syntax'*
" >
let g:pymode_syntax = 1

" Slower syntax synchronization that is better at handling code blocks in
" docstrings. Consider disabling this on slower hardware.
"                                                     *'g:pymode_syntax_slow_sync'*
" >
let g:pymode_syntax_slow_sync = 1

" Enable all python highlights                              *'g:pymode_syntax_all'*
" >
let g:pymode_syntax_all = 1

" Highlight "print" as a function             *'g:pymode_syntax_print_as_function'*
" >
let g:pymode_syntax_print_as_function = 0

" Highlight "async/await" keywords        *'g:pymode_syntax_highlight_async_await'*
" >
let g:pymode_syntax_highlight_async_await = g:pymode_syntax_all

" Highlight '=' operator               *'g:pymode_syntax_highlight_equal_operator'*
" >
let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all

" Highlight '*' operator               *'g:pymode_syntax_highlight_stars_operator'*
" >
let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all

" Highlight 'self' keyword                       *'g:pymode_syntax_highlight_self'*
" >
let g:pymode_syntax_highlight_self = g:pymode_syntax_all

" Highlight indent's errors                       *'g:pymode_syntax_indent_errors'*
" >
let g:pymode_syntax_indent_errors = g:pymode_syntax_all

" Highlight space's errors                         *'g:pymode_syntax_space_errors'*
" >
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Highlight string formatting                 *'g:pymode_syntax_string_formatting'*
"                                                 *'g:pymode_syntax_string_format'*
"                                              *'g:pymode_syntax_string_templates'*
"                                                      *'g:pymode_syntax_doctests'*
" >
let g:pymode_syntax_string_formatting = g:pymode_syntax_all
let g:pymode_syntax_string_format = g:pymode_syntax_all
let g:pymode_syntax_string_templates = g:pymode_syntax_all
let g:pymode_syntax_doctests = g:pymode_syntax_all

" Highlight builtin objects (True, False, ...)     *'g:pymode_syntax_builtin_objs'*
" >
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all

" Highlight builtin types (str, list, ...)        *'g:pymode_syntax_builtin_types'*
" >
let g:pymode_syntax_builtin_types = g:pymode_syntax_all

" Highlight exceptions (TypeError, ValueError, ...)
"                                          *'g:pymode_syntax_highlight_exceptions'*
" >
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all

" Highlight docstrings as pythonDocstring (otherwise as pythonString)
"                                                    *'g:pymode_syntax_docstrings'*
" >
let g:pymode_syntax_docstrings = g:pymode_syntax_all

