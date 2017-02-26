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
    var statusItem: NSStatusItem!
    var addVerifyKeyWindow: AddVerifyKeyWindow!
    
    override func awakeFromNib() {
        addVerifyKeyWindow = AddVerifyKeyWindow()
        initStatusItem()
    }
    
    private func initStatusItem() {
        statusItem = NSStatusBar.system().statusItem(withLength: NSSquareStatusItemLength)
        if let icon = NSImage(named: "statusIcon") {
            icon.size = NSMakeSize(16, 16)
            icon.isTemplate = true   // best for dark mode
            statusItem.image = icon
        }
        statusItem.target = self
        statusItem.action = #selector(openMenu)
    }
    
    func openMenu(_ sender: AnyObject?) {
        /*
        statusMenu.addItem(NSMenuItem.separator())
        statusMenu.addItem(NSMenuItem(title: "Quit Quotes", action: #selector(openMenu), keyEquivalent: "q"))
        */
        NSLog("open menu")
        statusItem.popUpMenu(statusMenu)
    }
    
    @IBAction func addVerifyClicked(_ sender: NSMenuItem) {
        addVerifyKeyWindow.showWindow(nil)
        addVerifyKeyWindow.window?.makeKeyAndOrderFront(nil)
        addVerifyKeyWindow.clearTextField()
        NSApp.activate(ignoringOtherApps: true)
    }
    
    @IBAction func aboutClicked(sender: NSMenuItem) {
        if let url = URL(string: "https://github.com/stanzhai/GoldenPassport") {
            NSWorkspace.shared().open(url)
        }
    }
    
    @IBAction func deleteClicked(_ sender: NSMenuItem) {
        let data = OTPAuthURL.base32Decode("")
        let gen = TOTPGenerator(secret: data,
                                algorithm: TOTPGenerator.defaultAlgorithm(),
                                digits: TOTPGenerator.defaultDigits(),
                                period: TOTPGenerator.defaultPeriod())
        let code = gen?.generateOTP(for: Date())
        NSLog(code!)
    }
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.shared().terminate(self)
    }
}
