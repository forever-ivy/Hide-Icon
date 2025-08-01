# Hide-Icon

A minimalist macOS desktop icon hiding tool that instantly gives your desktop a clean and organized look.

![Version](https://img.shields.io/badge/version-1.0-blue.svg)
![Platform](https://img.shields.io/badge/platform-macOS%2015.4+-lightgrey.svg)
![Swift](https://img.shields.io/badge/swift-5.0-orange.svg)

📖 Project Overview

Hide-Icon is a lightweight macOS application designed for users who prefer a tidy desktop. With just a simple click, you can instantly hide or show all desktop icons, giving you a clutter-free environment during presentations, screenshots, or focused work sessions.

✨ Features
	•	🎯 One-Click Toggle: Quickly hide/show desktop icons via the menu bar icon
	•	🔄 Real-Time Switching: Changes take effect immediately—no system restart required
	•	🎨 Intuitive UI: Menu bar icon changes according to current status
	•	👁️ Eye icon: Desktop icons are visible
	•	👁️‍🗨️ Eye with slash: Desktop icons are hidden
	•	🚀 Lightweight: Runs in the background without occupying the Dock
	•	🛡️ Safe Exit: Automatically restores desktop icons when quitting the app
	•	🎛️ Context Menu: Full control options via right-click menu

🚀 Getting Started

System Requirements
	•	macOS 15.4 or later
	•	Apple Silicon or Intel Mac

How to Use

Basic Operations
	•	Hide Desktop Icons: Click the eye icon in the menu bar
	•	Show Desktop Icons: Click the icon again (now displayed as an eye with a slash)
	•	Quit the App: Right-click the menu bar icon and select “Quit”

Menu Options

Right-clicking the menu bar icon shows:
	•	“Hide Desktop Icons” / “Show Desktop Icons”: Toggle icon visibility
	•	“Quit”: Safely exit the application

🔧 Technical Details

Core Mechanism

The app works by modifying macOS Finder preferences to control the visibility of desktop icons:

# Hide desktop icons
defaults write com.apple.finder CreateDesktop false

# Show desktop icons
defaults write com.apple.finder CreateDesktop true

# Restart Finder to apply changes
killall Finder

Tech Stack
	•	Language: Swift 5.0
	•	Framework: Cocoa
	•	Minimum Deployment Target: macOS 15.4
	•	Architecture: Universal (Apple Silicon + Intel)

