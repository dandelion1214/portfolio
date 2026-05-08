#!/bin/bash

# 🚀 GitHub Pages 快速部署脚本
# 使用方法：bash deploy.sh

echo "🎨 王楚杰作品集 - GitHub Pages 部署脚本"
echo "=========================================="
echo ""

# 检查是否已经初始化 Git
if [ ! -d ".git" ]; then
    echo "📦 初始化 Git 仓库..."
    git init
    echo "✅ Git 仓库初始化完成"
    echo ""
fi

# 检查是否已经添加远程仓库
if ! git remote | grep -q "origin"; then
    echo "⚠️  尚未配置远程仓库"
    echo ""
    echo "请输入你的 GitHub 用户名："
    read username
    echo ""
    echo "请输入你的仓库名（例如：portfolio 或 ai-portfolio）："
    read reponame
    echo ""
    
    # 添加远程仓库
    git remote add origin "https://github.com/$username/$reponame.git"
    echo "✅ 远程仓库配置完成"
    echo ""
else
    echo "✅ 远程仓库已配置"
    echo ""
fi

# 添加所有文件
echo "📝 添加文件到 Git..."
git add .

# 检查是否有改动
if git diff --staged --quiet; then
    echo "⚠️  没有检测到文件改动"
    echo ""
else
    # 提交改动
    echo "请输入提交信息（直接回车使用默认信息）："
    read commit_message
    
    if [ -z "$commit_message" ]; then
        commit_message="更新作品集内容 $(date '+%Y-%m-%d %H:%M:%S')"
    fi
    
    git commit -m "$commit_message"
    echo "✅ 文件提交完成"
    echo ""
fi

# 推送到 GitHub
echo "🚀 推送到 GitHub..."
git branch -M main
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "=========================================="
    echo "✨ 部署成功！"
    echo ""
    echo "📍 下一步："
    echo "1. 访问你的 GitHub 仓库"
    echo "2. 进入 Settings → Pages"
    echo "3. 选择 Branch: main, Folder: /pages"
    echo "4. 点击 Save"
    echo "5. 等待 1-3 分钟后访问你的网站"
    echo ""
    echo "🌐 你的网站地址将是："
    echo "   https://YOUR_USERNAME.github.io/YOUR_REPO_NAME/"
    echo ""
    echo "=========================================="
else
    echo ""
    echo "❌ 推送失败"
    echo ""
    echo "可能的原因："
    echo "1. 需要配置 GitHub 认证（Personal Access Token）"
    echo "2. 远程仓库地址不正确"
    echo "3. 网络连接问题"
    echo ""
    echo "请查看 DEPLOY.md 获取详细帮助"
fi
