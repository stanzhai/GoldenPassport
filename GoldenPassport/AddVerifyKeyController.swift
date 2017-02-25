//
//  AddVerifyKeyController.swift
//  GoldenPassport
//
//  Created by StanZhai on 2017/2/25.
//  Copyright © 2017年 StanZhai. All rights reserved.
//

import Cocoa

class AddVerifyKeyController: NSWindowController {
    @IBOutlet weak var okBtn: NSButton!
    @IBOutlet weak var cancelBtn: NSButton!
    
    override func windowDidLoad() {
        super.windowDidLoad()
    }

    @IBAction func okBtnClicked(_ sender: NSButton) {
        
    }
    
    @IBAction func cancelBtnClicked(_ sender: NSButton) {
        NSLog("test")
        self.window?.close()
    }
}
