# 🚀 Hyper + Starship + eza: Professional Terminal Setup Guide

A fully customized and minimal developer terminal featuring:

* 🖤 **Hyper Terminal** with Catppuccin Mocha theme
* ⚡ **Starship Prompt** (fast & modern)
* 📁 **eza** (modern `ls` replacement)
* ✨ **Zsh Plugins** for syntax highlighting & autosuggestions

---

## 🧱 1. Install Required Tools

### 🧩 1.1 Install Homebrew (if not installed)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 📦 1.2 Install Hyper, Starship, eza, and plugins

```bash
brew install hyper starship eza zsh-autosuggestions zsh-syntax-highlighting
```

---

## 🎨 2. Configure Hyper Terminal

### ⚙️ 2.1 Open Hyper config file

```bash
nano ~/.hyper.js
```

### 🧾 2.2 Paste this configuration

```js
"use strict";

module.exports = {
  config: {
    updateChannel: "stable",
    fontSize: 16,
    fontFamily: '"JetBrainsMono Nerd Font", Menlo, "DejaVu Sans Mono", monospace',
    fontWeight: "normal",
    fontWeightBold: "bold",
    cursorColor: "rgba(248,28,229,0.8)",
    cursorShape: "BLOCK",
    cursorBlink: false,
    foregroundColor: "#CDD6F4",
    backgroundColor: "#1E1E2E",
    selectionColor: "rgba(245,194,231,0.3)",
    borderColor: "rgba(255,255,255,0.1)",
    padding: "12px 14px",

    css: `
      ::-webkit-scrollbar {
        width: 0px !important;
        background: transparent !important;
      }
    `,

    opacity: { focus: 0.97, blur: 0.90 },
    vibrancy: "ultra-dark",
    theme: "catppuccin-mocha",

    hyperBorder: {
      borderColors: ["#CBA6F7", "#89B4FA", "#A6E3A1"],
      borderWidth: "2px",
    },
  },

  plugins: [
    "hyper-statusline",
    "hyper-tabs-enhanced",
    "hyperborder",
    "hypercwd",
    "hyper-opacity",
    "hyper-tab-icons",
    "hyper-search",
    "hyper-font-ligatures",
    "@catppuccin/hyper#1.0.8"
  ],
};
```

### 🔁 Reload Hyper

```bash
hyper reload
```

---

## 🧠 3. Configure Zsh Shell

### ⚙️ 3.1 Edit your `.zshrc`

```bash
nano ~/.zshrc
```

### 🧾 3.2 Paste the following configuration

```bash
# ===== PATH =====
export PATH="/opt/homebrew/bin:$PATH"

# ===== Aliases (eza replaces ls) =====
alias ls='eza --icons --group-directories-first --git -F -1'
alias ll='eza -lh --icons --git'
alias la='eza -lha --icons --git'

# ===== Plugins =====
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ===== Starship Prompt =====
eval "$(starship init zsh)"
```

### 🔁 Reload your shell

```bash
source ~/.zshrc
```

---

## 💎 4. Configure Starship Prompt

### ⚙️ 4.1 Create the config file

```bash
mkdir -p ~/.config
nano ~/.config/starship.toml
```

### 🧾 4.2 Paste this configuration

```toml
# ~/.config/starship.toml
"$schema" = 'https://starship.rs/config-schema.json'

add_newline = false
palette = "catppuccin_mocha"

[palettes.catppuccin_mocha]
rosewater = "#f5e0dc"
flamingo = "#f2cdcd"
pink = "#f5c2e7"
mauve = "#cba6f7"
red = "#f38ba8"
maroon = "#eba0ac"
peach = "#fab387"
yellow = "#f9e2af"
green = "#a6e3a1"
teal = "#94e2d5"
sky = "#89dceb"
sapphire = "#74c7ec"
blue = "#89b4fa"
lavender = "#b4befe"
text = "#cdd6f4"
subtext1 = "#bac2de"
base = "#1e1e2e"
surface0 = "#313244"

# ===== Prompt Layout =====
format = """
$directory$git_branch$git_status$nodejs$python$rust
$character
"""

[directory]
style = "bold lavender"
truncation_length = 3
truncate_to_repo = true
read_only = " "

[git_branch]
symbol = " "
style = "mauve"
format = "[$symbol$branch]($style) "

[git_status]
style = "red"
format = '([\[$all_status$ahead_behind\]]($style)) '

[nodejs]
symbol = " "
style = "green"
format = "[$symbol($version )]($style)"

[python]
symbol = " "
style = "yellow"
format = "[$symbol($version )]($style)"

[rust]
symbol = " "
style = "red"
format = "[$symbol($version )]($style)"

[character]
success_symbol = "[❯](bold green)"
error_symbol = "[❯](bold red)"
vicmd_symbol = "[❮](bold yellow)"
```

### 🔁 Reload Starship

```bash
exec zsh
```

---

## 🧰 5. Optional Enhancements

### 🪄 5.1 Install Nerd Font

```bash
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

Then in Hyper:

```
Preferences → Font Family → "JetBrainsMono Nerd Font"
```

### 🌈 5.2 Enable true color

Add this to your `.zshrc` if missing:

```bash
export COLORTERM=truecolor
```

---

## ✅ Final Result

* ✨ Clean, minimal prompt with icons
* 🌈 Catppuccin Mocha colors
* ⚡ Fast Zsh startup
* 📁 eza with git integration
* 💬 Syntax highlighting & autosuggestions

---

## 💾 Backup / Reuse on Another Machine

```bash
git clone https://github.com/<yourusername>/<your-repo>.git
cp .hyper.js ~/.hyper.js
cp .zshrc ~/.zshrc
cp -r .config/starship.toml ~/.config/starship.toml
```

Then reload:

```bash
hyper reload
exec zsh
```

---

## 🧠 Author Notes

* OS: macOS / Linux
* Shell: Zsh
* Font: JetBrains Mono Nerd Font
* Theme: Catppuccin Mocha

💡 Designed for developers who prefer **speed, clarity, and elegance** in their terminal workflow.
