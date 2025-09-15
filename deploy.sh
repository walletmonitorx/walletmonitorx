#!/bin/zsh

# -----------------------------
# ⚡ Project Directory
# -----------------------------
PROJECT_DIR="$HOME/Downloads/dropship-final-demo"
cd "$PROJECT_DIR" || { echo "Directory not found"; exit 1; }

# -----------------------------
# ⚡ Update .gitignore
# -----------------------------
echo "node_modules/
.next/
.vercel/
*.log" > .gitignore

# -----------------------------
# ⚡ Git operations
# -----------------------------
git rm -r --cached . 2>/dev/null || echo "No cached files"
git add .
git commit -m "♻️ Update site" 2>/dev/null || echo "No changes to commit"
git push origin main --force

# -----------------------------
# ⚡ Deploy to Vercel
# -----------------------------
VERCEL_OUTPUT=$(vercel --prod --confirm)
echo "🌐 Your live site URL is:"
echo "$VERCEL_OUTPUT" | grep -Eo "https://[a-zA-Z0-9.-]+\.vercel\.app"

