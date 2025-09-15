#!/bin/bash
# GitHub username और email सेट करो
git config --global user.name "YOUR_GITHUB_USERNAME"
git config --global user.email "YOUR_EMAIL@example.com"

# Git repo init
git init
git add .
git commit -m "First commit"

# Remote repo set
git remote remove origin 2>/dev/null
git remote add origin https://github.com/YOUR_USERNAME/walletmonitorx.git

# Branch main set करके push
git branch -M main
git push -u origin main
