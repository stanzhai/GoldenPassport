//
//  DataManager.swift
//  GoldenPassport
//
//  Created by StanZhai on 2017/2/26.
//  Copyright © 2017年 StanZhai. All rights reserved.
//

import Foundation

final class DataManager {
    static let shared = DataManager()
    
    private var data: [String : String]
    
    private init() {
        data = [:]
        data = loadData()
    }
    
    func addOTPAuthURL(tag: String, url: String) {
        data[tag] = url
        saveData()
    }
    
    func removeOTPAuthURL(tag: String) {
        data.removeValue(forKey: tag)
        saveData()
    }
    
    func allAuthCode() -> [String : String] {
        var result: [String : String] = [:]
        for d in data {
            let url = d.value
            let otpData = OTPAuthURLParser(url)!
            
            let data = OTPAuthURL.base32Decode(otpData.secret)
            let gen = TOTPGenerator(secret: data,
                                    algorithm: TOTPGenerator.defaultAlgorithm(),
                                    digits: TOTPGenerator.defaultDigits(),
                                    period: TOTPGenerator.defaultPeriod())
            let code = gen?.generateOTP(for: Date())
            
            result[d.key] = code
        }
        return result
    }
    
    private func saveData() {
        let fileUrl = URL(fileURLWithPath: dataFilePath)
        try? NSKeyedArchiver.archivedData(withRootObject: data).write(to: fileUrl)
    }
    
    private func loadData() -> [String : String] {
        let d = NSKeyedUnarchiver.unarchiveObject(withFile: dataFilePath)
        if d != nil {
            return d as! [String : String]
        }
        return [:]
    }
    
    private var dataFilePath: String {
        let fileManager = FileManager.default
        let path = NSSearchPathForDirectoriesInDomains(
            Foundation.FileManager.SearchPathDirectory.applicationSupportDirectory,
            Foundation.FileManager.SearchPathDomainMask.userDomainMask,
            true).first! + "/GoldenPassport/"
        if !fileManager.fileExists(atPath: path) {
            do {
                try fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error)
            }
        }
        
        return "\(path)/gp.secrets"
    }
}
