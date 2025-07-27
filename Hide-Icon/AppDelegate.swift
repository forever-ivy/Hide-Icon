import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var statusItem: NSStatusItem?
    var isDesktopHidden = false
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // 创建状态栏图标
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        
        if let button = statusItem?.button {
            button.image = NSImage(systemSymbolName: "eye.fill", accessibilityDescription: "Hide Desktop Icons")
            button.action = #selector(statusItemClicked)
            button.target = self
        }
        
        // 创建菜单
        let menu = NSMenu()
        
        let toggleItem = NSMenuItem(title: "隐藏桌面图标", action: #selector(toggleDesktopIcons), keyEquivalent: "")
        toggleItem.target = self
        menu.addItem(toggleItem)
        
        menu.addItem(NSMenuItem.separator())
        
        let quitItem = NSMenuItem(title: "退出", action: #selector(quitApp), keyEquivalent: "q")
        quitItem.target = self
        menu.addItem(quitItem)
        
        statusItem?.menu = menu
        
        // 设置为纯后台应用，不显示菜单栏和Dock图标
        NSApp.setActivationPolicy(.prohibited)
        
        // 隐藏所有窗口
        for window in NSApp.windows {
            window.orderOut(nil)
        }
    }
    
    @objc func statusItemClicked() {
        // 点击状态栏图标时切换桌面图标显示状态
        toggleDesktopIcons()
    }
    
    @objc func toggleDesktopIcons() {
        let task = Process()
        task.launchPath = "/usr/bin/defaults"
        
        if isDesktopHidden {
            // 显示桌面图标
            task.arguments = ["write", "com.apple.finder", "CreateDesktop", "true"]
            isDesktopHidden = false
            updateMenuTitle("隐藏桌面图标")
            updateStatusIcon("eye.fill")
        } else {
            // 隐藏桌面图标
            task.arguments = ["write", "com.apple.finder", "CreateDesktop", "false"]
            isDesktopHidden = true
            updateMenuTitle("显示桌面图标")
            updateStatusIcon("eye.slash.fill")
        }
        
        task.launch()
        task.waitUntilExit()
        
        // 重启Finder以应用更改
        let restartTask = Process()
        restartTask.launchPath = "/usr/bin/killall"
        restartTask.arguments = ["Finder"]
        restartTask.launch()
    }
    
    func updateMenuTitle(_ title: String) {
        if let menu = statusItem?.menu,
           let firstItem = menu.items.first {
            firstItem.title = title
        }
    }
    
    func updateStatusIcon(_ iconName: String) {
        if let button = statusItem?.button {
            button.image = NSImage(systemSymbolName: iconName, accessibilityDescription: "Toggle Desktop Icons")
        }
    }
    
    @objc func quitApp() {
        // 退出前确保桌面图标是显示的
        if isDesktopHidden {
            let task = Process()
            task.launchPath = "/usr/bin/defaults"
            task.arguments = ["write", "com.apple.finder", "CreateDesktop", "true"]
            task.launch()
            task.waitUntilExit()
            
            let restartTask = Process()
            restartTask.launchPath = "/usr/bin/killall"
            restartTask.arguments = ["Finder"]
            restartTask.launch()
        }
        
        NSApplication.shared.terminate(self)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // 应用退出时确保桌面图标是显示的
        if isDesktopHidden {
            let task = Process()
            task.launchPath = "/usr/bin/defaults"
            task.arguments = ["write", "com.apple.finder", "CreateDesktop", "true"]
            task.launch()
            task.waitUntilExit()
            
            let restartTask = Process()
            restartTask.launchPath = "/usr/bin/killall"
            restartTask.arguments = ["Finder"]
            restartTask.launch()
        }
    }
    
    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
}

