# arrake's Homebrew Tap

个人开源工具的 [Homebrew](https://brew.sh) 声明式软件源（macOS / Linux）。

## 快速安装

```bash
# 1. 添加软件源
brew tap arrake0101/tap

# 2. 安装 MailChat（自动适配 Apple Silicon / Intel 芯片并自动清除隔离属性）
brew install --cask mailchat
```

也可以无需预先 `tap`，直接一行安装：

```bash
brew install --cask arrake0101/tap/mailchat
```

### 在 `Brewfile` 中声明式装机

```ruby
tap "arrake0101/tap"
cask "arrake0101/tap/mailchat"
```

### 升级与卸载

```bash
# 升级版本（保留本地邮件数据库与 config.toml）
brew upgrade --cask mailchat

# 卸载应用（保留本地数据）
brew uninstall --cask mailchat

# 彻底卸载并清空本地配置缓存
brew uninstall --zap --cask mailchat
```

## 已收录应用

| Cask | 说明 | 安装命令 |
| :--- | :--- | :--- |
| [**mailchat**](https://github.com/arrake0101/mailchat) | 把标准邮箱做成现代即时通讯桌面客户端（标准 IMAP/SMTP 单聊与跨服全员群聊 + Agent 声明式 `config.toml`） | `brew install --cask arrake0101/tap/mailchat` |

## 自动追更机制

本仓库内置 `.github/workflows/sync-cask.yml` 自动同步工作流，无需配置跨仓库密钥，自动读取上游最新 GitHub Release 与 `SHA256SUMS.txt` 并更新 `Casks/mailchat.rb`。
