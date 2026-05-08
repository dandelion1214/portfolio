# 王楚杰个人作品集 - AI Agent 项目约定

> 本文档面向 AI Agent（Claude、Codex、OpenCode 等），记录项目约定、结构、红线和关键决策。

## 项目概览

**项目类型**：个人作品集网站（多页面静态站点）  
**设计风格**：Apple Design Language  
**技术栈**：原生 HTML/CSS/JavaScript + Chart.js  
**当前状态**：核心功能已完成，待扩展 AI 工具展示页面

## 项目结构

**简化后的两级架构：**

```
个人作品集/
├── pages/                          # 网站页面（核心）
│   ├── index.html                 # 主页（一级）- 展示所有案例缩略图
│   ├── gm_detail.html             # GM详情页（二级）
│   ├── ssz_detail.html            # 史上醉详情页（二级）
│   ├── cjgg_detail.html           # 超级嘎嘎详情页（二级）
│   ├── series_self.html           # 自孵化系列详情页（二级）
│   ├── series_supplier.html       # 供应商系列详情页（二级）
│   ├── cover.html                 # 封面展示页（二级）
│   ├── copywriting.html           # 文案展示页（二级）
│   ├── accounts.html              # 账号列表页（已废弃）
│   ├── series.html                # 系列列表页（已废弃）
│   ├── common.css                 # 共享样式
│   ├── ai-logo/                   # AI工具logo（7个）
│   ├── cover-images/              # 封面文案图片（21张）
│   ├── gm_weekly_data.json        # GM周数据
│   ├── *_data_by_video.json       # 各账号视频数据
│   └── *_hit*.png                 # 爆款展示图片
├── 封面文案/                      # 封面文案原始素材
├── 系列案例/                      # 系列案例资料
├── 私人与共享/                    # 作品集展示文档
├── 账号分析案例/                  # 账号运营分析
├── 王楚杰_AI内容运营.pdf           # 简历
├── 项目文档.md                    # 完整项目文档（设计系统）
├── README.md                      # 项目说明
└── CLAUDE.md                      # 本文件
```

## 关键约定

### 设计原则（红线）

1. **严格遵循 Apple 设计语言**
   - 毛玻璃效果：`backdrop-filter: saturate(180%) blur(20px)`
   - 双层阴影：精致的 drop-shadow
   - 动画曲线：`cubic-bezier(0.32, 0.72, 0, 1)`
   - 极简主义：去除一切不必要的装饰

2. **色彩系统**
   - 主色：`#ffffff`（白色）
   - 强调色：`#0066cc`（蓝色）
   - 文字：`#1d1d1f`（深灰黑）、`#86868b`（中灰）
   - 图表线条：`#1d1d1f`（黑色）
   - 拐点：`#ff3b30`（红色）

3. **字体系统**
   - 字体家族：`-apple-system, BlinkMacSystemFont, "SF Pro Display", "PingFang SC"`
   - 大标题：96px（移动端 56px）
   - 标题：32px
   - 正文：17px
   - 字间距：大标题 -0.02em（极紧），导航栏 0.02em（拉开）

4. **响应式设计**
   - 断点：768px
   - 封面尺寸：使用相对单位（`width: 8%`），不用固定像素
   - 移动端：单列布局，字号缩小

### 图表配置（Chart.js）

**关键规范：**
```javascript
// 数据处理
const viewsData = data.map(item => item.views / 10000); // 转换为万

// 纵坐标 callback（重要：不要再次除以）
ticks: {
    callback: function(value) {
        return value.toFixed(0) + 'w';  // 直接显示，不要再除
    }
}

// 横坐标
x: { display: false }  // 不显示

// 拐点
pointBackgroundColor: '#ff3b30'  // 红色
pointRadius: 8
```

**常见错误：**
- ❌ 数据已除以 10000，纵坐标又除以 10000 → 显示错误
- ✅ 数据除以 10000，纵坐标直接显示 value

### 账号数据

| 账号 | 视频数 | 拐点 | 纵坐标 | 数据文件 |
|------|--------|------|--------|----------|
| GM的秘密基地 | 156 | 2021-W08（索引46） | 内容播放量 | gm_weekly_data.json |
| 史上醉 | 266 | 2021-W18 | 内容播放量 | ssz_data_by_video.json |
| 超级嘎嘎 | 53 | 2022-W30 | 内容点赞量 | cjgg_data_by_video.json |

**特殊数据：**
- 史上醉 2021-W01：18000000（1800万），不是 180000000

### 爆款展示

**规范：**
- 横向滚动展示
- 竖版封面（9:16 比例）
- 相对单位：`width: 8%; min-width: 90px; max-width: 140px;`
- 移动端：`width: 25%; min-width: 80px; max-width: 120px;`
- 间距：`gap: 12px`

**文件命名：**
- 超级嘎嘎：`cjgg_hit1-6.png`
- 史上醉：`ssz_hit1-8.png`
- GM：`gm_hit1-3.png`

### 系列案例图片

**自孵化系列（史上醉地图系列）：**
- 视频封面：`series_self_video1-5.png`（5个视频）
- 对比图：`series_self_compare1-4.png`（4张对比图）
- 模块图：`series_self_module1-4.png`（4张模块图）
  - module1-2：创意公式模块化展示
  - module3：地图展示与主题揭示示例
  - module4："梗标签"前置示例

**供应商系列（伤感文学系列）：**
- 视频封面：`series_supplier_video1-4.png`（4个视频）

**展示规范：**
- 视频封面：横向滚动展示，相对单位 `width: 8%`
- 对比图/模块图：网格布局，2列展示

## 环境变量

无环境变量（纯静态站点）

## 运行命令

```bash
# 本地预览（直接用浏览器打开）
open pages/index.html

# 无需构建步骤
```

## 待完成功能

### 高优先级
- [ ] 主页添加 AI 工具板块（包含所有AI工具卡片）
- [ ] 检查超级嘎嘎页面的默认显示大小
- [ ] 添加实际账号图片到卡片和详情页

### 中优先级
- [ ] 完善 AI 工具展示页面的交互细节

### 低优先级
- [ ] 优化移动端体验
- [ ] 添加页面加载动画

### 已完成
- ✅ 自动化选题库工具页面（topic-ai.html）- 2026-05-06
- ✅ 热点选题灵感涌现工具页面（hotspot-ai.html）- 2026-05-06
- ✅ 开头AI工具页面（opening-ai.html）- 2026-05-05
- ✅ 封面展示页面（cover.html）- 2026-05-05
- ✅ 文案展示页面（copywriting.html）- 2026-05-05
- ✅ 系列案例分析页面（series_self.html + series_supplier.html）- 2026-05-04

## 历史决策

### 2026-05-05
- **决策**：创建开头AI工具页面
- **原因**：用户要求展示AI工具能力，但不能直接照搬提示词和流程图（机密）
- **影响**：新增 opening-ai.html，泛化概念展示运作机理，复制5张图片到 pages/opening-ai-images/
- **关键要求**：让别人看出设计巧妙之处，但抄不走

- **决策**：创建封面展示和文案展示页面
- **原因**：用户要求展示封面设计能力和文案创作能力
- **影响**：新增 cover.html 和 copywriting.html，主页新增"内容能力展示"板块，复制21张图片到 pages/cover-images/

- **决策**：在项目文档中完整记录用户原始需求
- **原因**：用户要求尽可能还原原话，不进行润色和改写，便于后续与其他 AI 交互
- **影响**：项目文档.md 新增"用户原始需求记录"板块

- **决策**：添加 Gemini API 使用规则
- **原因**：用户要求强制使用最新的 Gemini 3.1 Pro 模型
- **影响**：CLAUDE.md 新增"Gemini API 使用规则"板块，禁止使用旧版本模型

### 2026-05-04
- **决策**：简化架构，合并一级和二级页面
- **原因**：用户要求简化导航层级，直接从主页跳转到详情页
- **影响**：主页展示所有案例缩略图，废弃 accounts.html 和 series.html

- **决策**：主页展示3个账号缩略图
- **原因**：展示 GM、史上醉、超级嘎嘎三个账号的完整信息
- **影响**：每个缩略图包含赛道标签、运营阶段、核心问题、解决方案

- **决策**：修复 Hero 区 AI logo 路径
- **原因**：logo 图片路径错误导致无法显示
- **影响**：从 `../AI logo/` 改为 `AI logo/`（pages 目录下访问）

- **决策**：创建系列案例分析页面（3个页面）
- **原因**：展示自孵化系列和供应商系列的完整创作过程
- **影响**：新增 `series.html`、`series_self.html`、`series_supplier.html`，复制17张图片到 pages 目录

- **决策**：视频封面改为横向滚动展示
- **原因**：用户要求5个封面做成一排，添加滚动条
- **影响**：`series_self.html` 的视频展示区域

- **决策**：封面尺寸改为相对单位（`width: 8%`）
- **原因**：用户要求封面随页面动态变化，不要固定像素
- **影响**：`cjgg_detail.html`、`ssz_detail.html`、`series_self.html`

### 2026-05-03
- **决策**：合并问题归因、解决措施、实施结果为一个大板块
- **原因**：优化页面结构，减少视觉层级
- **影响**：三个详情页的 HTML 结构

### 2026-05-02
- **决策**：图表横坐标不显示
- **原因**：用户要求，保持简洁
- **影响**：所有 Chart.js 配置

## 参考文档

- **完整设计系统**：见 `项目文档.md`
- **Apple 设计指南**：[Apple Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
- **Chart.js 文档**：[Chart.js Documentation](https://www.chartjs.org/docs/latest/)

## 注意事项

1. **修改 HTML 前先读取**：不要假设结构，先用 readFile 确认
2. **修改后验证**：图表相关的修改，建议在浏览器中验证
3. **保持一致性**：三个详情页的结构和样式应保持一致
4. **文档同步**：代码变更后，同步更新 `项目文档.md` 和本文件
5. **相对时间转绝对**：文档中不要出现"今天"、"最近"等相对时间

## Gemini API 使用规则（重要）

**强制要求：**

如果调用了 Gemini API，**必须**使用最新的 Gemini 3.1 Pro 模型。

**执行流程：**
1. 调用 Gemini API 前，先确认使用的模型版本
2. 如果不是 Gemini 3.1 Pro，立即优化调用路径
3. 持续优化直到能顺利使用 Gemini 3.1 Pro 为止
4. 不允许使用旧版本模型（如 Gemini 1.0、Gemini 1.5 等）

**验证方法：**
- 检查 API 调用中的模型参数
- 确认模型名称包含 "gemini-3.1-pro" 或最新版本标识
- 如果 API 返回模型不可用错误，检查 API key 权限和模型可用性

**常见问题：**
- ❌ 使用 `gemini-pro`（旧版本）
- ❌ 使用 `gemini-1.5-pro`（非最新版本）
- ✅ 使用 `gemini-3.1-pro`（最新版本）

**备注：**
- 本项目所有 AI 分析使用 Gemini 3.1 Pro
- 如果遇到模型不可用，优先检查 API 配置和权限
- 必要时查阅 Gemini API 最新文档确认模型名称

## 联系方式

- **用户**：王楚杰
- **邮箱**：1034892264@qq.com
- **简历路径**：`/Users/chujie/kiro/个人作品集/王楚杰_AI内容运营.pdf`
