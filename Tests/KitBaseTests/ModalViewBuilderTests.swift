//
//  ModalViewBuilderTests.swift
//
//
//  Created by Imran on 4/10/23.
//

import XCTest
import SwiftUI
@testable import KitBase

@available(iOS 15.0, *)
final class ModalViewBuilderTests: XCTestCase {
    
    func testBuilder() {
        var isShowPopup = false
        let binding = Binding<Bool>(
            get: { isShowPopup },
            set: { isShowPopup = $0 }
        )
        
        // Create a ModalView using the builder
        let modalView = ModalViewBuilder(isShowPopup: binding) {
            // This is a mock action
            }
            .title("Test Title")
            .summary("Test Summary")
            .buttonOneText("Cancel")
            .buttonTwoText("Confirm")
            .build()
        
        XCTAssertEqual(modalView.isShowPopup, binding.wrappedValue)
        XCTAssertEqual(modalView.title, "Test Title")
        XCTAssertEqual(modalView.summary, "Test Summary")
        XCTAssertEqual(modalView.buttonOneText, "Cancel")
        XCTAssertEqual(modalView.buttonTwoText, "Confirm")
        XCTAssertEqual(modalView.layoutAxis, .horizontal)
        
    }
    
}
