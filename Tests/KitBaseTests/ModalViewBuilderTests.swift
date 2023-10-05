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
        let modalViewBuidler = ModalViewBuilder(isShowPopup: binding) {
            // This is a mock action
            }
            .title("Test Title")
            .summary("Test Summary")
            .buttonOneText("Cancel")
            .buttonTwoText("Confirm")
            .build()
        let modval = ModalView(isShowPopup: binding, onSubmit: {
            
        })
        XCTAssertEqual(modval.isShowPopup, binding.wrappedValue)
        XCTAssertEqual(modval.title, "Test Title")
        XCTAssertEqual(modval.summary, "Test Summary")
        XCTAssertEqual(modval.buttonOneText, "Cancel")
        XCTAssertEqual(modval.buttonTwoText, "Confirm")
        XCTAssertEqual(modval.layoutAxis, .horizontal)
        
    }
    
}
