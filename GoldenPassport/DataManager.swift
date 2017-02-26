//
//  DataManager.swift
//  GoldenPassport
//
//  Created by StanZhai on 2017/2/26.
//  Copyright © 2017年 StanZhai. All rights reserved.
//

import Foundation

class DataManager {
    
    var dataFilePath: String {
        let fileManager = FileManager.default
        let path = "~/Library/Application Support/GoldenPassport/"
        if !fileManager.fileExists(atPath: path) {
            try? fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
        
        return "\(path)/gp.secrets"
    }
    
    func addVerifyKey(key: String) {
        
    }
}
