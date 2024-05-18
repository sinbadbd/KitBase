//
//  File.swift
//  
//
//  Created by Imran on 18/5/24.
//

import UIKit
import SwiftUI

@available(iOS 10.0, *)
public enum FeedbackStyle: Int, @unchecked Sendable {
    case light = 0
    case medium = 1
    case heavy = 2
    @available(iOS 13.0, *)
    case soft = 3
    @available(iOS 13.0, *)
    case rigid = 4
}

extension FeedbackStyle {
    var uiFeedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle {
        switch self {
        case .light:
            return .light
        case .medium:
            return .medium
        case .heavy:
            return .heavy
        case .soft:
            return .soft
        case .rigid:
            return .rigid
        }
    }
}
