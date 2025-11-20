# PowerShell script to push MAIA project to GitHub
# Make sure Git is installed before running this script

Write-Host "Checking Git installation..." -ForegroundColor Cyan

# Check if git is available
try {
    $gitVersion = git --version
    Write-Host "Git found: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Git is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Git from: https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

Write-Host "`nInitializing repository..." -ForegroundColor Cyan

# Initialize git if not already initialized
if (-not (Test-Path .git)) {
    git init
    Write-Host "Git repository initialized" -ForegroundColor Green
} else {
    Write-Host "Git repository already initialized" -ForegroundColor Yellow
}

Write-Host "`nAdding files..." -ForegroundColor Cyan
git add .

Write-Host "`nCreating commit..." -ForegroundColor Cyan
git commit -m "Initial commit: Multi-auth website with Email, Google, Apple, and Microsoft login"

Write-Host "`nChecking remote..." -ForegroundColor Cyan
$remoteExists = git remote get-url origin 2>$null

if ($LASTEXITCODE -ne 0) {
    Write-Host "Adding remote repository..." -ForegroundColor Cyan
    git remote add origin https://github.com/wenlanbo/MAIA.git
} else {
    Write-Host "Remote already exists: $remoteExists" -ForegroundColor Yellow
    Write-Host "Updating remote URL..." -ForegroundColor Cyan
    git remote set-url origin https://github.com/wenlanbo/MAIA.git
}

Write-Host "`nPushing to GitHub..." -ForegroundColor Cyan
Write-Host "Note: You may be prompted for GitHub credentials" -ForegroundColor Yellow

# Try to push to main branch
git branch -M main
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nSuccessfully pushed to GitHub!" -ForegroundColor Green
    Write-Host "Repository: https://github.com/wenlanbo/MAIA.git" -ForegroundColor Cyan
} else {
    Write-Host "`nPush failed. You may need to:" -ForegroundColor Red
    Write-Host "1. Set up GitHub authentication (Personal Access Token)" -ForegroundColor Yellow
    Write-Host "2. Or pull first if repository has existing content:" -ForegroundColor Yellow
    Write-Host "   git pull origin main --allow-unrelated-histories" -ForegroundColor Yellow
    Write-Host "   Then run: git push -u origin main" -ForegroundColor Yellow
}

