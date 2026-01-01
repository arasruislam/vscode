# ==================================
# FONT REQUIRED: Nerd Font Installed
# ==================================

# ---------- OH MY POSH ----------
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\json.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config json | Invoke-Expression


# ---------- ICONS ----------
Import-Module Terminal-Icons

# ---------- PSREADLINE (ZSH STYLE) ----------
Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -ShowToolTips

# ZSH-like key bindings
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key Ctrl+p -Function PreviousHistory
Set-PSReadLineKeyHandler -Key Ctrl+n -Function NextHistory
Set-PSReadLineKeyHandler -Key Ctrl+a -Function BeginningOfLine
Set-PSReadLineKeyHandler -Key Ctrl+e -Function EndOfLine

# ---------- FZF (ZSH-LIKE FUZZY MAGIC) ----------

# Ctrl+R → Fuzzy command history (ZSH style)
Set-PSReadLineKeyHandler -Key Ctrl+r -ScriptBlock {
    Get-Content (Get-PSReadLineOption).HistorySavePath |
        fzf --tac --no-sort |
        ForEach-Object {
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert($_)
        }
}

# Ctrl+T → Fuzzy file & folder picker (insert path)
Set-PSReadLineKeyHandler -Key Ctrl+t -ScriptBlock {
    Get-ChildItem -Recurse -Force -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty FullName |
        fzf |
        ForEach-Object {
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert($_)
        }
}

# ---------- ZOXIDE (SMART CD) ----------
zoxide init powershell | Out-String | Invoke-Expression

# ===============================
# LS = EZA (DEFAULT TREE + ICONS)
# ===============================
# function ls {
#     eza --tree --icons --group-directories-first --level=2
# }

function ls($level = 2) {
    eza --tree --icons --level=$level --group-directories-first --git
}

function ll {
    eza -la --icons --group-directories-first
}

function la {
    eza -a --icons
}

# ---------- DEV ALIASES ----------
Set-Alias g git
Set-Alias v nvim
Set-Alias pn pnpm
Set-Alias nr npm-run
Set-Alias py python

# Minimal profile: UTF‑8 + Oh My Posh (if installed) + Fastfetch with explicit config path
try {
    [Console]::InputEncoding  = [System.Text.Encoding]::UTF8
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
    $OutputEncoding = [System.Text.UTF8Encoding]::new($false)
    chcp 65001 > $null
} catch {}

Clear-Host

# Force Fastfetch to use YOUR config every time (bypass path confusion)
if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
    fastfetch -c "C:/Users/ashra/.config/fastfetch/config.jsonc"
}

# ---------- FAST NAV ----------
function .. { cd .. }
function ... { cd ../.. }
function .... { cd ../../.. }

# =================================
# REMOVE POWERSHELL DEFAULT ALIASES
# =================================
Remove-Item Alias:ls -ErrorAction SilentlyContinue
Remove-Item Alias:ll -ErrorAction SilentlyContinue
Remove-Item Alias:la -ErrorAction SilentlyContinue
