//
//  KeyCode.swift
//  GoldenPassport
//
//  Created by StanZhai on 2017/2/28.
//  Copyright © 2017年 StanZhai. All rights reserved.
//

import Foundation

enum KeyCode: CGKeyCode {
    case a = 0
    case s = 1
    case d = 2
    case f = 3
    case h = 4
    case g = 5
    case z = 6
    case x = 7
    case c = 8
    case v = 9
    case b = 11
    case q = 12
    case w = 13
    case e = 14
    case r = 15
    case y = 16
    case t = 17
    case one = 18
    case two = 19
    case three = 20
    case four = 21
    case six = 22
    case five = 23
    case equal = 24 // =
    case nine = 25
    case seven = 26
    case dash = 27 // -
    case eight = 28
    case zero = 29
    case squareBracketClose = 30 // ]
    case o = 31
    case u = 32
    case squareBracketOpen = 33 // [
    case i = 34
    case p = 35
    case return36 = 36
    case l = 37
    case j = 38
    case singleQuote = 39 // '
    case k = 40
    case semicolon = 41 // ;
    case forwardSlash = 42 // \
    case comma = 43 // ,
    case backslash = 44 // /
    case n = 45
    case m = 46
    case period = 47 // .
    case tab = 48
    case space = 49
    case tick = 50 // `
    case delete = 51
    case enter = 52
    case escape = 53
    case period65 = 65 // .
    case asterisk = 67 // *
    case plus = 69 // +
    case clear = 71
    case backslash75 = 75 // /
    case enter76  = 76
    case equal78 = 78
    case equal81 = 81
    case zero82 = 82
    case one83 = 83
    case two84 = 84
    case three85 = 85
    case four86 = 86
    case five87 = 87
    case six88 = 88
    case seven89 = 89
    case eight91 = 91
    case nine92 = 92
    case f5 = 96
    case f6 = 97
    case f7 = 98
    case f3 = 99
    case f8 = 100
    case f9 = 101
    case f11 = 103
    case f13 = 105
    case f14 = 107
    case f10 = 109
    case f12 = 111
    case f15 = 113
    case help = 114
    case home = 115
    case pgup = 116
    case delete117 = 117
    case f4 = 118
    case end = 119
    case f2 = 120
    case pgdn = 121
    case f1 = 122
    case left = 123
    case right = 124
    case down = 125
    case up = 126
    
    static func enumWith(_ char: Character) -> KeyCode? {
        if let num = Int(String(char)) {
            if num == 0 {
                return KeyCode(rawValue: CGKeyCode(29))
            }
            if num <= 9 && num > 0 {
                return KeyCode(rawValue: CGKeyCode(17 + num))
            }
        }
        
        var i = 126
        repeat {
            if let item = KeyCode(rawValue: CGKeyCode(i)) {
                if String(describing: item) == String(char) { return item }
            }
            i -= 1
        } while i >= 0
        
        return nil
    }
}
