# Git Authentication Setup Guide

## Current Status
Your Git is configured and authentication appears to be working. However, if you're experiencing login issues, here are solutions:

## Option 1: Personal Access Token (Recommended for HTTPS)

GitHub no longer accepts passwords for HTTPS authentication. You need a Personal Access Token:

### Steps:
1. Go to GitHub: https://github.com/settings/tokens
2. Click "Generate new token" → "Generate new token (classic)"
3. Give it a name (e.g., "MAIA Project")
4. Select scopes: Check **"repo"** (this gives full repository access)
5. Click "Generate token"
6. **Copy the token immediately** (you won't see it again!)

### Using the Token:
When you push/pull, Git will prompt for credentials:
- **Username**: Your GitHub username (`wenlanbo`)
- **Password**: Paste your Personal Access Token (NOT your GitHub password)

The credential manager will save it for future use.

## Option 2: Switch to SSH (More Secure)

### Generate SSH Key:
```powershell
ssh-keygen -t ed25519 -C "wenlanbo@users.noreply.github.com"
```
Press Enter to accept default location, then set a passphrase (optional).

### Add SSH Key to GitHub:
1. Copy your public key:
   ```powershell
   cat ~/.ssh/id_ed25519.pub
   ```
2. Go to: https://github.com/settings/keys
3. Click "New SSH key"
4. Paste the key and save

### Switch Remote to SSH:
```powershell
git remote set-url origin git@github.com:wenlanbo/MAIA.git
```

## Option 3: Clear and Reconfigure Credentials

If credentials are stuck:

```powershell
# Clear stored credentials
git credential-manager-core erase
# Or for Windows Credential Manager:
cmdkey /list | Select-String "git"
# Then delete: cmdkey /delete:git:https://github.com
```

Then try pushing again - it will prompt for new credentials.

## Option 4: Use GitHub CLI

Install GitHub CLI for easier authentication:

```powershell
winget install --id GitHub.cli
gh auth login
```

Then you can use `gh` commands or Git will use the CLI authentication.

## Quick Test

Test your authentication:
```powershell
git fetch origin
```

If this works, authentication is set up correctly!

## Troubleshooting

### "Authentication failed" error:
- Make sure you're using a Personal Access Token, not password
- Check token hasn't expired
- Verify token has "repo" scope

### "Permission denied" error:
- Verify you have push access to the repository
- Check if repository exists and you're a collaborator

### Credential Manager issues:
```powershell
# Reset credential helper
git config --global --unset credential.helper
git config --global credential.helper manager-core
```

## Current Configuration

Your current Git config:
- User: wenlanbo
- Email: wenlanbo@users.noreply.github.com
- Remote: https://github.com/wenlanbo/MAIA.git
- Credential Helper: manager-core

If you need to change any of these, let me know!

