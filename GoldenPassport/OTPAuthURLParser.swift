//
//  OTPAuthURLParser.swift
//  GoldenPassport
//
//  Created by StanZhai on 2017/2/26.
//  Copyright © 2017年 StanZhai. All rights reserved.
//

import Foundation

class OTPAuthURLParser {
    var protocal: String
    var user: String
    var host: String
    var secret: String
    
    init?(_ otpAuthURL: String) {
        // otpauth://totp/user@host?secret=DA82347xxx&issuer=xxx
        if let url = URL(string: otpAuthURL) {
            let path = url.path
            
            protocal = url.host!
            
            let index = path.index(path.startIndex, offsetBy: 1)
            user = path.substring(from: index).components(separatedBy: "@")[0]
            host = path.components(separatedBy: "@")[1]
            
            let firstParam = url.query!.components(separatedBy: "&")[0]
            secret = firstParam.components(separatedBy: "=")[1]
        } else {
            return nil
        }
    }
}
