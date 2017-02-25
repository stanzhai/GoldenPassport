//
//  StatusMenuController.swift
//  GoldenPassport
//
//  Created by StanZhai on 2017/2/25.
//  Copyright © 2017年 StanZhai. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
    @IBOutlet weak var statusMenu: NSMenu!
    var addVerifyKeyWindow: AddVerifyKeyWindow!
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    override func awakeFromNib() {
        addVerifyKeyWindow = AddVerifyKeyWindow()
        
        let icon = NSImage(named: "statusIcon")
        icon?.isTemplate = true // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
        statusMenu.addItem(NSMenuItem.separator())
        statusMenu.addItem(NSMenuItem(title: "Quit Quotes", action: #selector(self.openMenu), keyEquivalent: "q"))
        statusItem.action = #selector(self.openMenu)
    }
    
    func openMenu(sender: AnyObject?) {
        NSLog("open menu")
    }
    
    @IBAction func addVerifyClicked(_ sender: NSMenuItem) {
        addVerifyKeyWindow.showWindow(nil)
    }
    
    @IBAction func aboutClicked(sender: NSMenuItem) {
        if let url = URL(string: "https://github.com/stanzhai/GoldenPassport") {
            NSWorkspace.shared().open(url)
        }
    }
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.shared().terminate(self)
    }
}
