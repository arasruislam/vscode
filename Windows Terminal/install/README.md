## 🚀 One-Command Auto Setup (Recommended)

This repository includes an `install.ps1` script that automatically installs
all required tools and applies all configurations in one command.

This is the fastest way to restore the full terminal setup on a new device.

---

What this script does:
✔ Checks if Winget is available
✔ Installs PowerShell 7 and Windows Terminal
✔ Installs all required CLI tools (Oh My Posh, eza, fzf, zoxide, fastfetch)
✔ Installs Nerd Font (JetBrainsMono Nerd Font)
✔ Installs required PowerShell modules
✔ Applies the custom PowerShell profile (powershell_profile.ps1)
✔ Applies Windows Terminal settings (settings.json)
✔ Sets up Fastfetch configuration (config + ASCII art)

---

### 🧾 What This Script Installs

**Applications**
- PowerShell 7
- Windows Terminal
- Git
- Oh My Posh
- JetBrainsMono Nerd Font
- eza
- fzf
- zoxide
- fastfetch

**PowerShell Modules**
- PSReadLine
- Terminal-Icons

**Configurations**
- PowerShell profile (`powershell_profile.ps1`)
- Windows Terminal settings (`settings.json`)
- Fastfetch config & ASCII art

---

### 📋 Prerequisites

- Windows 10 / 11
- Internet connection
- Winget available (default on modern Windows)
- Git installed (or install manually)

---

### ⚙️ Setup Steps

Open **PowerShell** and run:

```powershell
git clone <your-repo-url>
cd <repo-folder>

# Allow running local scripts (current user only)
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# Run auto installer
.\install\install.ps1
```

## After Installation

Restart Windows Terminal
Open PowerShell (pwsh)
Go to Terminal Settings → Font
Select JetBrainsMono Nerd Font Mono
Your terminal environment is now fully restored 🎉

## 🛠 Troubleshooting
If icons are broken → Make sure Nerd Font is selected
If ls does not work → Restart terminal
If execution policy fails → Run PowerShell as normal user (not admin)

## 📁 Folder structure
Windows Terminal/
├── fastfetch/
├── install/
│   └── install.ps1
├── powershell_profile.ps1
├── settings.json


## 🧠 Architecture Overview
install/install.ps1
        |
        +--> winget installs
        |       - PowerShell 7
        |       - Windows Terminal
        |       - oh-my-posh
        |       - eza / fzf / zoxide
        |       - fastfetch
        |       - Nerd Font
        |
        +--> Install PowerShell Modules
        |       - PSReadLine
        |       - Terminal-Icons
        |
        +--> Apply Config Files
                |
                +--> powershell_profile.ps1
                |       -> $PROFILE
                |
                +--> settings.json
                |       -> Windows Terminal LocalState
                |
                +--> fastfetch/
                        -> ~/.config/fastfetch/
