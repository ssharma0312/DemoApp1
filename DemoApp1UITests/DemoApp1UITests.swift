//
//  DemoApp1UITests.swift
//  DemoApp1UITests
//
//  Created by Sahil Sharma on 2024-03-09.
//

import XCTest

final class DemoApp1UITests: XCTestCase {

    let app = XCUIApplication()
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuccessfulLogin() throws {
        login()
    }
    
    func testRentalPropertiesList() throws {
        login()
        XCTAssertTrue(app.staticTexts["123 Main St"].exists)
        XCTAssertTrue(app.staticTexts["A beautiful house with a spacious garden."].exists)
        XCTAssertTrue(app.staticTexts["$1,450"].exists)
    }
    
    func testAddRentalProperties() throws {
        login()
        app.buttons["Add"].tap()
        app.collectionViews.textFields["Address"].type("789 Test Dr")
        app.collectionViews.textFields["Rent"].type("999")
        app.buttons["Save"].tap()
    }
    
    func login() {
        app.textFields["Username"].type("jacksonbrick123")
        app.secureTextFields["Password"].type("somepassword")
        app.buttons["Login"].tap()
    }
}
