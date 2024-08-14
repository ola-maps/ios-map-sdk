//
//  AppEnvironment.swift
//  OlaMapCoreExample
//
//  Created by Abhishek Ravi on 24/07/24.
//

import Foundation

final class AppEnvironment {
    
    class func get(_ key: String) -> String? {
        print(ProcessInfo.processInfo.environment)
        if let value = ProcessInfo.processInfo.environment[key] {
            return value
        }
        fatalError("[Environmnet] Set Value for \(key) ❌")
        return nil
    }
    
}
