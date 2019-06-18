//
//  CVConstants.swift
//  Ejemplo
//
//  Created by Juan Casillas Juarez on 5/31/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import Foundation

struct CVConstants {
    
    // MARK: - API ENDPOINT
    
    struct API_URL {
        static let ENDPOINT = CVConstants.completeApiURL()
        static let BAD_ENDPOINT = "https://raw.githubusercontent.com/TranceFX/exampleCV/57f0f0e1210464457182b3cdcd99a4bcb7c477c5"
    }
    
    static private func completeApiURL() -> String{
        guard let infoURL = Bundle.main.url(forResource: "Info", withExtension: "plist") else { fatalError("No info.plist in main bundle") }
        do {
            let infoData = try Data(contentsOf: infoURL)
            guard let result = try? PropertyListSerialization.propertyList(from: infoData, options: [], format: nil) as? [String: Any] else {
                return ""
            }
            
            if let url = result!["serverURL"] as? String, let path = result!["serverPath"] as? String{
                return "\(url)/\(path)"
            }else{
                return ""
            }
            
        } catch {
            return ""
        }
    }
    
    // MARK: - UITableView Cell Identifiers
    
    enum CELL_IDENTIFIER: String {
        case SECTION_CELL = "sectionCell"
        case JOB_CELL = "jobCell"
    }
    
    // MARK: - Segue identifier
    
    enum SEGUE_VALUES: String{
        case USER_VALUE = "userInfoSegue"
        case JOB_VALUE = "jobInfoSegue"
    }
    
    // MARK: - Path to specific section
    
    enum WAY_VALUE: String{
        case USER_INFO = "userInfo"
        case JOB_INFO = "jobInfo"
    }
}
