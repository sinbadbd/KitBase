//
//  ModalViewUITests.swift
//  
//
//  Created by Imran on 4/10/23.
//

//import XCTest
//import SwiftUI
//@testable import KitBase
//
//@available(iOS 15.0, *)
//class ModalViewUITests: XCTestCase {
//
//    var app: XCUIApplication!
//
//    override func setUpWithError() throws {
//        // Set up the app instance before each test
//        app = XCUIApplication()
//        app.launch()
//    }
//
//    func testShowConfirmationDialog() throws {
//        // UI test to simulate tapping the "Show Confirmation" button
//        app.buttons["Show Confirmation"].tap()
//        
//        // Verify that the confirmation dialog is displayed
//        XCTAssertTrue(app.otherElements["confirmationDialog"].exists)
//
//        // Simulate tapping the "Confirm" button
//        app.buttons["Confirm"].tap()
//
//        // Assert that the expected behavior after confirmation
//        // For example, you can verify that a specific element appears
//        // after the confirmation.
//        XCTAssertTrue(app.staticTexts["ActionConfirmedLabel"].waitForExistence(timeout: 5))
//    }
//
//    // Add more UI test cases as needed.
//}
//
