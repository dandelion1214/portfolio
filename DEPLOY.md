# 🚀 GitHub Pages 部署指南

## 📋 部署步骤

### 1. 创建 GitHub 仓库

1. 访问 [GitHub](https://github.com) 并登录
2. 点击右上角的 `+` 号，选择 `New repository`
3. 填写仓库信息：
   - **Repository name**: `portfolio` 或 `ai-portfolio`（建议使用简短易记的名字）
   - **Description**: `王楚杰的AI内容运营作品集`
   - **Public**: 选择 Public（公开仓库才能使用免费的 GitHub Pages）
   - **不要**勾选 "Add a README file"（我们已经有了）
4. 点击 `Create repository`

### 2. 初始化本地 Git 仓库

打开终端（Terminal），执行以下命令：

```bash
# 进入 portfolio-clean 目录
cd "/Users/chujie/kiro/个人作品集/portfolio-clean"

# 初始化 Git 仓库
git init

# 添加所有文件
git add .

# 创建第一次提交
git commit -m "Initial commit: AI内容运营作品集"
```

### 3. 连接到 GitHub 仓库

将下面命令中的 `YOUR_USERNAME` 替换为你的 GitHub 用户名，`YOUR_REPO_NAME` 替换为你创建的仓库名：

```bash
# 添加远程仓库
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

### 4. 配置 GitHub Pages

1. 在 GitHub 仓库页面，点击 `Settings`（设置）
2. 在左侧菜单找到 `Pages`
3. 在 `Source` 部分：
   - **Branch**: 选择 `main`
   - **Folder**: 选择 `/pages`（因为你的网站文件都在 pages 文件夹中）
4. 点击 `Save`

### 5. 等待部署完成

- GitHub 会自动部署你的网站
- 通常需要 1-3 分钟
- 部署完成后，页面会显示你的网站地址：
  ```
  https://YOUR_USERNAME.github.io/YOUR_REPO_NAME/
  ```

### 6. 访问你的作品集

打开浏览器，访问：
```
https://YOUR_USERNAME.github.io/YOUR_REPO_NAME/
```

---

## 🔄 后续更新流程

当你修改了作品集内容后，使用以下命令更新：

```bash
# 进入项目目录
cd "/Users/chujie/kiro/个人作品集/portfolio-clean"

# 查看修改的文件
git status

# 添加所有修改
git add .

# 提交修改（修改描述信息）
git commit -m "更新作品集内容"

# 推送到 GitHub
git push
```

推送后，GitHub Pages 会自动重新部署，1-3分钟后更新就会生效。

---

## 🎯 重要提示

### 文件路径问题
由于 GitHub Pages 会将网站部署在子目录下（如 `/YOUR_REPO_NAME/`），你需要确保：

1. **所有相对路径都是正确的**
   - ✅ 正确：`<img src="account-icons/史上醉.jpeg">`
   - ❌ 错误：`<img src="/account-icons/史上醉.jpeg">`（绝对路径会失效）

2. **CSS 和图片路径**
   - 你的项目已经使用相对路径，应该没问题
   - 如果发现某些资源加载失败，检查路径是否为相对路径

### 自定义域名（可选）

如果你有自己的域名，可以：
1. 在 GitHub Pages 设置中添加 Custom domain
2. 在域名服务商处配置 CNAME 记录指向 `YOUR_USERNAME.github.io`

---

## 🐛 常见问题

### Q: 推送时要求输入用户名和密码？
A: GitHub 已不再支持密码认证，需要使用 Personal Access Token：
1. 访问 GitHub Settings → Developer settings → Personal access tokens
2. 生成新 token，勾选 `repo` 权限
3. 使用 token 代替密码

### Q: 页面显示 404？
A: 检查以下几点：
1. GitHub Pages 是否已启用
2. Source 设置是否正确（Branch: main, Folder: /pages）
3. 等待 3-5 分钟让部署完成

### Q: 样式或图片无法加载？
A: 检查：
1. 文件路径是否使用相对路径
2. 文件名大小写是否正确（GitHub Pages 区分大小写）
3. 浏览器控制台是否有错误信息

---

## 📞 需要帮助？

如果遇到问题，可以：
1. 查看 GitHub Actions 标签页的部署日志
2. 检查浏览器控制台的错误信息
3. 确认所有文件都已正确推送到 GitHub

---

## ✨ 完成！

部署完成后，你就可以通过公开的网址分享你的作品集了！

记得将网址添加到你的简历和社交媒体资料中。
