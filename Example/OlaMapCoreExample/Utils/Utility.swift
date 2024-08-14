//
//  Utility.swift
//  OlaMapCoreExample
//
//  Created by Abhishek Ravi on 24/07/24.
//

import Foundation

final class Utility {
    
    class func getTileURL() -> URL {
        return URL(string: "https://api.olamaps.io/tiles/vector/v1/styles/default-light-standard/style.json")!
    }
    
    class func getWorkspaceID() -> String {
        // Get This Workspace ID from the Platfrom Dashboard
        // https://maps.olakrutrim.com/
        return "WORKSPACE_ID"
    }
    
    class func getAPIKey() -> String {
        // Get This Workspace ID from the Platform Dashboard
        // https://maps.olakrutrim.com/
        return "API_KEY"
    }
 
}
