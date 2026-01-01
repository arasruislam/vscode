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

## 🧠 Architecture Overview
flowchart TD
    A[install/install.ps1<br/>One-Command Installer]

    A --> B[Winget]
    B --> B1[PowerShell 7]
    B --> B2[Windows Terminal]
    B --> B3[CLI Tools<br/>oh-my-posh, eza, fzf,<br/>zoxide, fastfetch]
    B --> B4[JetBrainsMono Nerd Font]

    A --> C[PowerShell Modules]
    C --> C1[PSReadLine]
    C --> C2[Terminal-Icons]

    A --> D[powershell_profile.ps1]
    D --> D1[PowerShell Profile Path<br/>$PROFILE]

    A --> E[settings.json]
    E --> E1[Windows Terminal<br/>LocalState/settings.json]

    A --> F[fastfetch config]
    F --> F1[~/.config/fastfetch/config.jsonc]
    F --> F2[~/.config/fastfetch/ascii.txt]

    D1 --> G[PowerShell Startup]
    E1 --> H[Windows Terminal UI]
    F1 --> G
