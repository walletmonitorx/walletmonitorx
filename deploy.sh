#!/bin/zsh

# -----------------------------
# 1️⃣ Project Directory Setup
# -----------------------------
cd ~/Downloads/dropship-final-demo || { echo "❌ Directory not found"; exit 1; }
echo "✅ Current directory: $(pwd)"

# -----------------------------
# 2️⃣ Backup (optional)
# -----------------------------
cp -r . ../dropship-final-demo-backup
echo "💾 Backup created at ~/Downloads/dropship-final-demo-backup"

# -----------------------------
# 3️⃣ Install Dependencies
# -----------------------------
echo "📦 Installing dependencies..."
rm -rf node_modules package-lock.json
npm install

# -----------------------------
# 4️⃣ Local Dev Server Test
# -----------------------------
echo "🚀 Starting local dev server for test..."
npm run dev &
DEV_PID=$!
sleep 5  # wait 5 seconds
echo "🌐 Local server test complete at http://localhost:3000"
kill $DEV_PID
echo "🛑 Local server stopped after test"

# -----------------------------
# 5️⃣ Setup .gitignore
# -----------------------------
echo "🧹 Setting up .gitignore..."
echo "node_modules/
.next/
.vercel/
*.log" > .gitignore

# -----------------------------
# 6️⃣ Clean Git Cache + Commit
# -----------------------------
git rm -r --cached .
git add .
git commit -m "🧹 Clean repo and add .gitignore" || echo "Nothing to commit"

# -----------------------------
# 7️⃣ Push to GitHub
# -----------------------------
git push origin main --force
echo "✅ Code pushed to GitHub"

# -----------------------------
# 8️⃣ Vercel Login & Link
# -----------------------------
vercel login
vercel link

# -----------------------------
# 9️⃣ Deploy to Production
# -----------------------------
echo "🚀 Deploying to Vercel..."
VERCEL_OUTPUT=$(vercel --prod --confirm)
echo "✅ Deployment complete!"

# -----------------------------
# 10️⃣ Show Live URL
# -----------------------------
echo "🌐 Your live site URL is:"
echo "$VERCEL_OUTPUT" | grep -Eo "https://[a-zA-Z0-9.-]+\.vercel\.app"

