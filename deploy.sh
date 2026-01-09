#!/bin/bash

# Portfolio Deployment Script
# This script will help you deploy your portfolio to GitHub Pages

echo "🚀 Portfolio Deployment Script"
echo "=============================="
echo ""

# Check if remote already exists
if git remote get-url origin &>/dev/null; then
    echo "✅ Remote 'origin' already configured"
    REMOTE_URL=$(git remote get-url origin)
    echo "   Current remote: $REMOTE_URL"
    echo ""
    read -p "Do you want to push to this remote? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "📤 Pushing to GitHub..."
        git push -u origin main
        echo ""
        echo "✅ Code pushed successfully!"
        echo ""
        echo "📝 Next steps:"
        echo "   1. Go to your repository on GitHub"
        echo "   2. Click Settings → Pages"
        echo "   3. Under 'Source', select 'main' branch and '/ (root)'"
        echo "   4. Click Save"
        echo "   5. Your site will be live at: https://ayush10kiran.github.io/portfolio"
        exit 0
    fi
fi

# If no remote, guide user to create repo
echo "📦 Setting up GitHub repository..."
echo ""
echo "First, create a new repository on GitHub:"
echo "   1. Go to: https://github.com/new"
echo "   2. Repository name: portfolio"
echo "   3. Make it PUBLIC (required for free GitHub Pages)"
echo "   4. DO NOT initialize with README, .gitignore, or license"
echo "   5. Click 'Create repository'"
echo ""
read -p "Have you created the repository? (y/n) " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Please create the repository first, then run this script again."
    exit 1
fi

# Add remote and push
echo "🔗 Adding remote repository..."
git remote add origin https://github.com/ayush10kiran/portfolio.git 2>/dev/null || git remote set-url origin https://github.com/ayush10kiran/portfolio.git

echo "📤 Pushing code to GitHub..."
git branch -M main
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Success! Your code has been pushed to GitHub!"
    echo ""
    echo "📝 Final step - Enable GitHub Pages:"
    echo "   1. Go to: https://github.com/ayush10kiran/portfolio/settings/pages"
    echo "   2. Under 'Source', select:"
    echo "      - Branch: main"
    echo "      - Folder: / (root)"
    echo "   3. Click 'Save'"
    echo ""
    echo "🌐 Your portfolio will be live at:"
    echo "   https://ayush10kiran.github.io/portfolio"
    echo ""
    echo "⏱️  It may take 1-2 minutes for the site to go live after enabling Pages."
else
    echo ""
    echo "❌ Error pushing to GitHub. Please check:"
    echo "   1. Repository exists at: https://github.com/ayush10kiran/portfolio"
    echo "   2. You have push access"
    echo "   3. Your GitHub credentials are configured"
fi
