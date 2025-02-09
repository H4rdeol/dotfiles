vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set fixeol")
vim.g.mapleader = " "
vim.keymap.set("n", "<C-s>", ":wa<CR>", {})
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', {})
vim.keymap.set({ 'n', 'v' }, '<A-Up>', ':m .-2<CR>', {})
vim.keymap.set({ 'n', 'v' }, '<A-Down>', ':m .+1<CR>', {})
vim.keymap.set('i', '<A-Up>', '<ESC>:m .-2<CR>i', {})
vim.keymap.set('i', '<A-Down>', '<ESC>:m .+1<CR>i', {})
vim.keymap.set('i', '<C-d>', '<ESC>yypi', {})

-- Empêcher le chargement multiple du plugin
if vim.g.loaded_vim_epitech then
    return
end
vim.g.loaded_vim_epitech = true

-- Considérer un fichier .h comme un fichier C
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.h",
    command = "set filetype=c"
})

-- Configurer les commentaires pour C et C++
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"c", "cpp"},
    command = "setlocal comments=s:/*,m:**,ex:*/"
})

-- Table des commentaires pour différents types de fichiers
local filetypeMap = {
    c        = {b = "/*", m = "**", e = "*/"},
    cpp      = {b = "/*", m = "**", e = "*/"},
    make     = {b = "##", m = "##", e = "##"},
    haskell  = {b = "{-", m = "--", e = "-}"},
}

-- Fonction pour récupérer l'année actuelle
local function Epiyear()
    return os.date("%Y")
end

-- Fonction pour insérer le header Epitech
local function Epi_header()
    local ft = vim.bo.filetype
    if filetypeMap[ft] then
        local bcom = filetypeMap[ft].b
        local mcom = filetypeMap[ft].m
        local ecom = filetypeMap[ft].e

        local lines = {
            bcom,
            mcom .. " EPITECH PROJECT, " .. Epiyear(),
            mcom .. " __",
            mcom .. " File description:",
            mcom .. " _",
            ecom
        }

        vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
    end
end

-- Créer une commande pour insérer le header
vim.api.nvim_create_user_command("EpiHeader", Epi_header, {})

-- Mapper Ctrl+C Ctrl+H pour insérer le header
vim.api.nvim_set_keymap("n", "<C-c><C-h>", ":EpiHeader<CR>", { noremap = true, silent = true })
