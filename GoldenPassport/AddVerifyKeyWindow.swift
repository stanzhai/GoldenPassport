//
//  AddVerifyKeyController.swift
//  GoldenPassport
//
//  Created by StanZhai on 2017/2/25.
//  Copyright © 2017年 StanZhai. All rights reserved.
//

import Cocoa

class AddVerifyKeyWindow: NSWindowController, NSWindowDelegate {
    @IBOutlet weak var okBtn: NSButton!
    @IBOutlet weak var cancelBtn: NSButton!
    
    override var windowNibName : String! {
        return "AddVerifyKeyWindow"
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        self.window?.center()
        self.window?.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }

    @IBAction func okBtnClicked(_ sender: NSButton) {
        
    }
    
    @IBAction func cancelBtnClicked(_ sender: NSButton) {
        self.window?.close()
    }
}
