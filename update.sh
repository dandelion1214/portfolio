#!/bin/bash

# 作品集快速更新脚本
# 使用方法: ./update.sh "更新说明"

# 检查是否提供了更新说明
if [ -z "$1" ]; then
    echo "❌ 请提供更新说明"
    echo "使用方法: ./update.sh \"更新说明\""
    echo "例如: ./update.sh \"更新了GM账号数据\""
    exit 1
fi

echo "📦 正在添加修改的文件..."
git add .

echo "💾 正在提交更改..."
git commit -m "$1"

echo "🚀 正在推送到GitHub..."
git push

echo ""
echo "✅ 更新完成！"
echo "🌐 你的网站将在1-3分钟后更新"
echo "🔗 访问地址: https://dandelion1214.github.io/portfolio/"
