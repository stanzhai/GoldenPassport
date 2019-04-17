//
//  HTTPPortConfigWindow.swift
//  GoldenPassport
//
//  Created by StanZhai on 2017/3/4.
//  Copyright © 2017年 StanZhai. All rights reserved.
//

import Cocoa

class HTTPPortConfigWindow: NSWindowController {

    @IBOutlet weak var portTextField: NSTextField!
    
    override var windowNibName : String! {
        return "HTTPPortConfigWindow"
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()

        self.window?.center()
        portTextField.stringValue = DataManager.shared.getHttpServerPort()
    }
    
    @IBAction func okClicked(_ sender: NSButton) {
        let alert: NSAlert = NSAlert()
        alert.addButton(withTitle: "确定")
        alert.alertStyle = NSAlert.Style.informational
        
        let port = portTextField.integerValue
        if port > 0 && port < 65535 {
            self.window?.close()
            
            let dataManager = DataManager.shared
            if port != Int(dataManager.getHttpServerPort()) {
                dataManager.saveHttpServerPort(port: "\(portTextField.integerValue)")
                
                let notificationCenter = NotificationCenter.default
                notificationCenter.post(name: NSNotification.Name(rawValue: "HTTPServerPortChanged"), object: nil)
                
                alert.messageText = "端口号已修改。"
                alert.runModal()
            }
            return
        }
        
        alert.messageText = "端口号必须是大于0小于65535的整数，请检查后重试！"
        alert.runModal()
    }
}
