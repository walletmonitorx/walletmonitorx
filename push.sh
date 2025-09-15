#!/bin/bash
# GitHub setup
git config --global user.name "walletmonitorx"
git config --global user.email "krohitmj6@gmail.com"

# Repo setup
git init
git branch -M main
git remote remove origin 2>/dev/null
git remote add origin https://github.com/YOUR_USERNAME/walletmonitorx.git

# Changes push
git add .
git commit -m "update"
git push -u origin main
