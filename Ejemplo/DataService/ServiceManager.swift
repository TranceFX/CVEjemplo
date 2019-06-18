//
//  ServiceManager.swift
//  Ejemplo
//
//  Created by Juan Casillas Juarez on 5/31/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import Foundation

class ServiceManager: NSObject{
    
    static let sharedInstance = ServiceManager.init()
    private var session: URLSession!
    
    fileprivate override init() {
        super.init()
        
        //Configure URLSession
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForResource = 300
        config.waitsForConnectivity = true
        
        session = URLSession(configuration: config)
    }
    
    
    /**
    Generic function for URLSession
    Get the data from a remote JSON
    - Parameters:
     - urlString: The url to the api endpoint
     - completion:
        - Parameters:
            - sucess: returns generic decodable data
            - failure: returns a string error
     */
    func getDataFromURL <T: Decodable>(urlString: String, completion: @escaping((_ success: T?, _ failure: String?) -> Void)) {
        
        // Check if is a valid url
        guard let url = URL(string: urlString) else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil {
                // There was an error fro service
                completion(nil, Errors.invalidData)
            }
            
            // Check if contains data
            guard let data = data else { return }
            
            do {
                let info = try JSONDecoder().decode(T.self, from: data)
                
                completion(info, nil)
                
            } catch _ {
                // Invalid JSON Data
                completion(nil, Errors.invalidJSON)
            }
        }
        
        task.resume()
        
    }
}
