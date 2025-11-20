# Git Setup Instructions

## Prerequisites
1. Install Git for Windows from: https://git-scm.com/download/win
2. Restart your terminal/IDE after installation

## Commands to Run

Once Git is installed, run these commands in your terminal from the MAIA directory:

```bash
# Initialize git repository (if not already initialized)
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: Multi-auth website with Email, Google, Apple, and Microsoft login"

# Add remote repository
git remote add origin https://github.com/wenlanbo/MAIA.git

# Push to GitHub
git push -u origin main
```

If the repository already exists and has content, you may need to pull first:

```bash
git pull origin main --allow-unrelated-histories
```

Then push:

```bash
git push -u origin main
```

## Alternative: Using GitHub Desktop

If you prefer a GUI:
1. Install GitHub Desktop from: https://desktop.github.com/
2. Open GitHub Desktop
3. File → Add Local Repository → Select the MAIA folder
4. Commit all changes
5. Publish repository to GitHub

