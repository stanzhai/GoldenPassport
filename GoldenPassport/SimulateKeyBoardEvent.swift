//
//  SimulateKeyBoardEvent.swift
//  GoldenPassport
//
//  Created by StanZhai on 2017/2/28.
//  Copyright © 2017年 StanZhai. All rights reserved.
//

import Cocoa

class SimulateKeyBoardEvent {
    
    // simulate command+v
    class func paste() {
        let source = CGEventSource(stateID: CGEventSourceStateID.combinedSessionState)
        if let pressEvent = CGEvent(keyboardEventSource: source, virtualKey: CGKeyCode.init(9), keyDown: true) {
            pressEvent.flags = CGEventFlags.maskCommand
            pressEvent.post(tap: CGEventTapLocation.cghidEventTap)
            if let releaseEvent = CGEvent(keyboardEventSource: source, virtualKey: CGKeyCode.init(9), keyDown: false) {
                releaseEvent.flags = CGEventFlags.maskCommand
                releaseEvent.post(tap: CGEventTapLocation.cghidEventTap)
            }
        }
    }
    
    class func sendString(_ str: String) {
        // Loop through each character in the UTF16 representation of the string.
        for char in str {
//        for char in str.characters {
            
            let source = CGEventSource(stateID: CGEventSourceStateID.hidSystemState)
            let keyCode = KeyCode.enumWith(char)
            
            guard let virtualKey: CGKeyCode = keyCode?.rawValue else {
                return
            }
            
            let keyDown = CGEvent(keyboardEventSource: source, virtualKey: virtualKey, keyDown: true)
            let keyUp = CGEvent(keyboardEventSource: source, virtualKey: virtualKey, keyDown: false)
            
            let loc = CGEventTapLocation.cghidEventTap
            
            keyDown!.post(tap: loc)
            keyUp!.post(tap: loc)
            
            /*
            if let pressEvent = CGEvent(keyboardEventSource: source, virtualKey: CGKeyCode.init(character), keyDown: true) {
                pressEvent.post(tap: CGEventTapLocation.cghidEventTap)
                if let releaseEvent = CGEvent(keyboardEventSource: source, virtualKey: CGKeyCode.init(character), keyDown: false) {
                    releaseEvent.post(tap: CGEventTapLocation.cghidEventTap)
                }
            }
 */
            

        }
    }
}
