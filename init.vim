set hlsearch
set ignorecase
set smartcase

" Вкл/выкл подсветку слова под курсором по Esc
nnoremap <expr> <Esc> v:hlsearch && @/ == '\<' . expand('<cword>') . '\>' ? ':noh<CR>' : '*N'


set undofile
set undodir=~/.local/state/nvim/undo//

" --- Навигация и интерфейс ---
set number              " Показывать номера строк
set cursorline          " Подсвечивать текущую строку
set scrolloff=1         " Оставлять 5 строк сверху/снизу при прокрутке
set wrap                " Переносить длинные строки визуально
set mouse=a             " Включить поддержку мыши/тапов (выделение, прокрутка)

" --- Табуляция и отступы ---
set tabstop=4           " Ширина табуляции в пробелах
set shiftwidth=4        " Размер отступа при нажатии > или <
set expandtab           " Преобразовывать Tab в пробелы
set autoindent          " Сохранять отступ предыдущей строки

" --- Поиск ---
set incsearch           " Искать по мере ввода символов

" --- Горячие клавиши ---
" --- Быстрое сохранение и выход ---
" Сохранить файл на Ctrl+S (работает в Normal и Insert режимах)
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Выйти из файла на Ctrl+Q
nnoremap <C-q> :q<CR>

" Сохранить и выйти на Ctrl+X
nnoremap <C-x> :wq<CR>

" --- Навигация по длинным (перенесенным) строкам ---
nnoremap j gj
nnoremap k gk

" --- Буфер обмена ---
" Быстрый копипаст через системный буфер (если нужно)
vmap <C-c> "+y
" Быстрое снятие подсветки поиска по нажатию Esc в нормальном режиме
nnoremap <expr> <Esc> v:hlsearch ? ':noh<CR>' : ':set hlsearch<CR>'


autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

