# ==============================================
# One‑Command Auto Setup Script (Windows)
# ==============================================
# Run PowerShell as NORMAL user (not required Admin)
# Execution Policy may be needed:
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# Move to repo root directory
$RepoRoot = Split-Path $PSScriptRoot -Parent
Set-Location $RepoRoot

Write-Host "\n🚀 Starting terminal auto setup...\n" -ForegroundColor Cyan

# -------------------------------
# 1. Check Winget
# -------------------------------
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Winget not found. Please install App Installer from Microsoft Store." -ForegroundColor Red
    exit 1
}

# -------------------------------
# 2. Install Core Applications
# -------------------------------
$apps = @(
    "Microsoft.PowerShell",
    "Microsoft.WindowsTerminal",
    "Git.Git",
    "JanDeDobbeleer.OhMyPosh",
    "NerdFonts.JetBrainsMono",
    "eza-community.eza",
    "junegunn.fzf",
    "ajeetdsouza.zoxide",
    "fastfetch"
)

Write-Host "📦 Installing applications..." -ForegroundColor Yellow
foreach ($app in $apps) {
    winget install --id $app -e --silent --accept-package-agreements --accept-source-agreements
}

# -------------------------------
# 3. Install PowerShell Modules
# -------------------------------
Write-Host "🔌 Installing PowerShell modules..." -ForegroundColor Yellow

$modules = @(
    "PSReadLine",
    "Terminal-Icons"
)

foreach ($module in $modules) {
    if (-not (Get-Module -ListAvailable -Name $module)) {
        Install-Module $module -Force -SkipPublisherCheck -Scope CurrentUser
    }
}

# -------------------------------
# 4. Setup PowerShell Profile
# -------------------------------
Write-Host "⚙️  Setting up PowerShell profile..." -ForegroundColor Yellow

$profileDir = Split-Path $PROFILE
if (-not (Test-Path $profileDir)) {
    New-Item -ItemType Directory -Force -Path $profileDir
}

Copy-Item "./powershell_profile.ps1" $PROFILE -Force

# -------------------------------
# 5. Setup Windows Terminal Settings
# -------------------------------
Write-Host "🖥️  Applying Windows Terminal settings..." -ForegroundColor Yellow

$wtPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
if (Test-Path $wtPath) {
    Copy-Item "./settings.json" "$wtPath\settings.json" -Force
}

# -------------------------------
# 6. Setup Fastfetch
# -------------------------------
Write-Host "🎨 Setting up Fastfetch..." -ForegroundColor Yellow

$ffPath = "$HOME\.config\fastfetch"
New-Item -ItemType Directory -Force -Path $ffPath
Copy-Item "./fastfetch/*" $ffPath -Recurse -Force

# -------------------------------
# 7. Finish
# -------------------------------
Write-Host "\n✅ Setup completed successfully!" -ForegroundColor Green
Write-Host "👉 Restart Windows Terminal and open PowerShell (pwsh)." -ForegroundColor Green
Write-Host "👉 Set font to: JetBrainsMono Nerd Font Mono" -ForegroundColor Green

Write-Host "\n🎉 Enjoy your terminal!" -ForegroundColor Cyan
