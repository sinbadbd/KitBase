//
//  File.swift
//  
//
//  Created by Imran on 15/7/24.
//

import SwiftUI

public struct Triangle: Shape {
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

public struct CustomCorners: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(
                width: radius,
                height: radius)
        )
        return Path(path.cgPath)
    }
}

