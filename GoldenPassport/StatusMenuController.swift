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
    var addVerifyKeyController: AddVerifyKeyController?
    
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    override func awakeFromNib() {
        let icon = NSImage(named: "statusIcon")
        icon?.isTemplate = true // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
    }
    
    @IBAction func addVerifyClicked(_ sender: NSMenuItem) {
        if self.addVerifyKeyController == nil {
            let controller = AddVerifyKeyController(windowNibName: "AddVerifyKeyWindow")
            addVerifyKeyController = controller
        }
        
        
        addVerifyKeyController?.showWindow(self)
        addVerifyKeyController?.window?.makeKeyAndOrderFront(self)
        NSApp.activate(ignoringOtherApps: true)
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
