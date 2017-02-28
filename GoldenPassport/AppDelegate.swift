//
//  AppDelegate.swift
//  GoldenPassport
//
//  Created by StanZhai on 2017/2/25.
//  Copyright © 2017年 StanZhai. All rights reserved.
//

import Cocoa
import Carbon

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    private var monitor: Any?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let opts = NSDictionary(object: kCFBooleanTrue, forKey: kAXTrustedCheckOptionPrompt.takeUnretainedValue() as NSString) as CFDictionary
        guard AXIsProcessTrustedWithOptions(opts) == true else { return }
        monitor = NSEvent.addGlobalMonitorForEvents(matching: .keyDown, handler: self.handleKeydownEvent)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
    }
    
    func handleKeydownEvent(_ event: NSEvent) {
        let flag = event.modifierFlags.rawValue
        print(flag)
        // flag of: Shift + Cmd
        if flag != 1179924 && flag != 1179914 {
            return
        }
        
        if let char = event.characters {
            if let num = Int(char) {
                setAuthCode(idx: num)
            }
        }
    }
    
    private func setAuthCode(idx: Int) {
        if (idx >= DataManager.shared.dataCount()) {
            return
        }
        
        let authCodes = DataManager.shared.allAuthCode()
        var i = 0
        for codeInfo in authCodes {
            if i == idx {
                let pasteboard = NSPasteboard.general()
                let oldData = pasteboard.string(forType: NSStringPboardType)
                pasteboard.clearContents()
                pasteboard.setString(codeInfo.value, forType: NSStringPboardType)
                
                SimulateKeyBoardEvent.paste()
                
                if (oldData != nil) {
                    sleep(1)
                    pasteboard.clearContents()
                    pasteboard.setString(oldData!, forType: NSStringPboardType)
                }

                break
            }
            i = i + 1
        }
    }
}

