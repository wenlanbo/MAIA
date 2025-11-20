# Git Authentication Setup Script
Write-Host "=== Git Authentication Setup ===" -ForegroundColor Cyan
Write-Host ""

# Check current status
Write-Host "Current Git Configuration:" -ForegroundColor Yellow
git config --global user.name
git config --global user.email
Write-Host ""

# Test authentication
Write-Host "Testing authentication..." -ForegroundColor Cyan
$testResult = git ls-remote origin 2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Authentication is working!" -ForegroundColor Green
    Write-Host ""
    Write-Host "You can now push/pull from GitHub." -ForegroundColor Green
} else {
    Write-Host "✗ Authentication failed" -ForegroundColor Red
    Write-Host ""
    Write-Host "You need to set up authentication. Choose an option:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Option 1: Personal Access Token (Recommended)" -ForegroundColor Cyan
    Write-Host "  1. Go to: https://github.com/settings/tokens" -ForegroundColor White
    Write-Host "  2. Generate new token (classic) with 'repo' scope" -ForegroundColor White
    Write-Host "  3. Copy the token" -ForegroundColor White
    Write-Host "  4. Run: git push" -ForegroundColor White
    Write-Host "  5. When prompted:" -ForegroundColor White
    Write-Host "     Username: wenlanbo" -ForegroundColor White
    Write-Host "     Password: [paste your token]" -ForegroundColor White
    Write-Host ""
    Write-Host "Option 2: Switch to SSH" -ForegroundColor Cyan
    Write-Host "  Run this script with -SSH parameter to set up SSH" -ForegroundColor White
    Write-Host ""
}

# SSH setup option
if ($args -contains "-SSH") {
    Write-Host "Setting up SSH authentication..." -ForegroundColor Cyan
    
    # Check if SSH key exists
    if (-not (Test-Path "$env:USERPROFILE\.ssh\id_ed25519")) {
        Write-Host "Generating SSH key..." -ForegroundColor Yellow
        ssh-keygen -t ed25519 -C "wenlanbo@users.noreply.github.com" -f "$env:USERPROFILE\.ssh\id_ed25519" -N '""'
    }
    
    Write-Host ""
    Write-Host "Your public SSH key:" -ForegroundColor Yellow
    Get-Content "$env:USERPROFILE\.ssh\id_ed25519.pub"
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "1. Copy the key above" -ForegroundColor White
    Write-Host "2. Go to: https://github.com/settings/keys" -ForegroundColor White
    Write-Host "3. Click 'New SSH key' and paste it" -ForegroundColor White
    Write-Host "4. Then run: git remote set-url origin git@github.com:wenlanbo/MAIA.git" -ForegroundColor White
}

Write-Host ""
Write-Host "For more help, see GIT_AUTHENTICATION.md" -ForegroundColor Gray

