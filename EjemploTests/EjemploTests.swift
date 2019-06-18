//
//  EjemploTests.swift
//  EjemploTests
//
//  Created by Juan Casillas Juarez on 5/31/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import XCTest
@testable import Ejemplo


class EjemploTests: XCTestCase {
    
    /**
     TEST SUCCESS CONNECTION
     Test model in diferent situations
     - Parameters:
     - urlString: The url to the correct api endpoint
     - completion:
        - Parameters:
        - response: change the model to check
     */

    func testConnection() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = XCTestExpectation(description: "Testing the request and response of a webservice")
        ServiceManager.sharedInstance.getDataFromURL(urlString: CVConstants.API_URL.ENDPOINT, completion: {(response: CVSections?, error: String?) in
            
            guard let _ = response, error == nil else {
                XCTAssert(false, "The request fail")
                expectation.fulfill()
                return
            }
            XCTAssert(true, "The request success")
            expectation.fulfill()
            
        })
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    /**
     TEST SUCCESS CONNECTION
     Test model in diferent situations
     - Parameters:
     - urlString: The url to the bad api endpoint
     - completion:
     - Parameters:
     - response: change the model to check
     */
    
    func testConnectionBad() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = XCTestExpectation(description: "Testing the request and response of a webservice")
        ServiceManager.sharedInstance.getDataFromURL(urlString: CVConstants.API_URL.BAD_ENDPOINT, completion: {(response: CVSections?, error: String?) in
            
            guard let _ = response, error == nil else {
                XCTAssert(false, "The request fail")
                expectation.fulfill()
                return
            }
            XCTAssert(true, "The request success")
            expectation.fulfill()
            
        })
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    
    /**
     TEST MODEL CASES
     Test model in diferent situations
     - Parameters:
     - from: The url to the api endpoint
     - JSONTEST:
     - Parameters:
     - SUCESS: returns a correct json and sections
     - FAILURE: return a valid json empty sections
     - ERROR: returns a invalid JSON string
     */
    func testModelSections(){
        do {
            let datas:Data = JSONTEST.SUCCESS.data(using: .utf8)!
            let info = try JSONDecoder().decode(CVSections.self, from: datas)
            
            XCTAssertNotNil(info, "OBJECT CREATED")
            
            if info.sections != nil{
                XCTAssertNotNil(info.sections, "CORRECT INFO AND SECTIONS")
            }
            
        } catch _ {
            XCTFail("INVALID JSON")
        }
    }

}
