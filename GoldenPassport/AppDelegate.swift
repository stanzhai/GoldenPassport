//
//  AppDelegate.swift
//  GoldenPassport
//
//  Created by StanZhai on 2017/2/25.
//  Copyright © 2017年 StanZhai. All rights reserved.
//

import Cocoa
import Carbon
import Swifter

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    let keyboardMonitor = KeyboardMonitor()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        keyboardMonitor.start()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        keyboardMonitor.stop()
    }
}

