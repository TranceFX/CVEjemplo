//
//  EjemploUITests.swift
//  EjemploUITests
//
//  Created by Juan Casillas Juarez on 5/31/19.
//  Copyright © 2019 Juan Casillas Juarez. All rights reserved.
//

import XCTest
@testable import Ejemplo

class EjemploUITests: XCTestCase {
    
    private var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        app = nil
    }
    
    /**
     TEST INTRO CELLS
     Test if tableview contains cells
     Check if the cell exists
     */

    func testIntroCells() {
        let tables = app.tables["IntroTable"]
        
        XCTAssertTrue(tables.exists, "The CV Table exists")
        
        let tableCells = tables.cells
        
        if tableCells.count > 0 {
            let count: Int = (tableCells.count - 1)
            
            let promise = expectation(description: "Wait for table cells")
            
            for i in stride(from: 0, to: count , by: 1) {
                // Grab the first cell and verify that it exists and tap it
                let tableCell = tableCells.element(boundBy: i)
                XCTAssertTrue(tableCell.exists, "The \(i) cell is in place on the table")
                if i == (count - 1) {
                    promise.fulfill()
                }
            }
            waitForExpectations(timeout: 20, handler: nil)
            XCTAssertTrue(true, "Finished validating the table cells")
            
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
    }
    
    /**
     TEST JOB CELLS
     Test if tableview contains cells
     Check if the cell exists
     */
    
    func testJobsCells() {
        let introtable = app.tables["IntroTable"]
        introtable/*@START_MENU_TOKEN@*/.staticTexts["My Career"]/*[[".cells.staticTexts[\"My Career\"]",".staticTexts[\"My Career\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let introtableTable = app.tables["JobTable"]
        XCTAssert(introtableTable.exists, "The CV Jobs Table exists")
        
        let tableCells = introtableTable.cells
        
        if tableCells.count > 0 {
            let count: Int = (tableCells.count - 1)
            
            let promise = expectation(description: "Wait for table cells")
            
            for i in stride(from: 0, to: count , by: 1) {
                // Grab the first cell and verify that it exists and tap it
                let tableCell = tableCells.element(boundBy: i)
                XCTAssertTrue(tableCell.exists, "The \(i) cell is in place on the table")
                if i == (count - 1) {
                    promise.fulfill()
                }
            }
            waitForExpectations(timeout: 20, handler: nil)
            XCTAssertTrue(true, "Finished validating the table cells")
            
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
    }
    
    /**
     TEST MODEL CASES
     Test the navigation across the screens
     and check if the elements exists
     INTRO:
        - Check if tableview exists
     USERVIEW:
     - Check if scrollView exists
     MYCAREER:
     - Check if tableview exists
     Fintally check if you're in home again
     */
    
    func testNavigation(){
        let introtableTable = app.tables["IntroTable"]
        XCTAssert(introtableTable.exists, "The CV Jobs Table exists")
        introtableTable/*@START_MENU_TOKEN@*/.staticTexts["My Information"]/*[[".cells.staticTexts[\"My Information\"]",".staticTexts[\"My Information\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        var checkViews = app.scrollViews["UserView"]
        XCTAssert(checkViews.exists, "The User View exists")
        
        app.navigationBars["Ejemplo.CVUserView"].buttons["Back"].tap()
        introtableTable/*@START_MENU_TOKEN@*/.staticTexts["My Career"]/*[[".cells.staticTexts[\"My Career\"]",".staticTexts[\"My Career\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        checkViews = app.tables["JobTable"]
        XCTAssert(checkViews.exists, "The CV Jobs Table exists")
        
        app.navigationBars["Ejemplo.CVJobView"].buttons["Back"].tap()
        XCTAssert(introtableTable.exists, "You are in home again")
    }
}
