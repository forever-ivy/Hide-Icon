# Hide-Icon

一个简洁的 macOS 桌面图标隐藏工具，让你的桌面瞬间变得干净整洁。

![Version](https://img.shields.io/badge/version-1.0-blue.svg)
![Platform](https://img.shields.io/badge/platform-macOS%2015.4+-lightgrey.svg)
![Swift](https://img.shields.io/badge/swift-5.0-orange.svg)

## 📖 项目简介

Hide-Icon 是一个轻量级的 macOS 应用程序，专为需要保持桌面整洁的用户设计。通过简单的点击操作，你可以瞬间隐藏或显示桌面上的所有图标，让你在演示、截图或专注工作时拥有一个完全干净的桌面环境。

## ✨ 功能特性

- 🎯 **一键切换**：通过状态栏图标快速隐藏/显示桌面图标
- 🔄 **实时切换**：无需重启系统，立即生效
- 🎨 **直观界面**：状态栏图标会根据当前状态变化
  - 👁️ 眼睛图标：桌面图标可见
  - 👁️‍🗨️ 斜杠眼睛图标：桌面图标隐藏
- 🚀 **轻量级**：纯后台运行，不占用 Dock 空间
- 🛡️ **安全退出**：应用退出时自动恢复桌面图标显示
- 🎛️ **右键菜单**：提供完整的控制选项

## 🚀 快速开始

### 系统要求

- macOS 15.4 或更高版本
- Apple Silicon 或 Intel Mac

### 使用方法

#### 基本操作

- **隐藏桌面图标**：点击状态栏的眼睛图标
- **显示桌面图标**：再次点击状态栏图标（此时显示为斜杠眼睛）
- **退出应用**：右键状态栏图标，选择「退出」

#### 菜单选项

右键点击状态栏图标可以看到：

- 「隐藏桌面图标」/「显示桌面图标」：切换桌面图标显示状态
- 「退出」：安全退出应用

## 🔧 技术实现

### 核心原理

本应用通过修改 macOS Finder 的系统偏好设置来实现桌面图标的隐藏/显示：

```bash
# 隐藏桌面图标
defaults write com.apple.finder CreateDesktop false

# 显示桌面图标
defaults write com.apple.finder CreateDesktop true

# 重启 Finder 以应用更改
killall Finder
```

### 技术栈

- **语言**：Swift 5.0
- **框架**：Cocoa
- **最低部署目标**：macOS 15.4
- **架构**：Universal (Apple Silicon + Intel)
