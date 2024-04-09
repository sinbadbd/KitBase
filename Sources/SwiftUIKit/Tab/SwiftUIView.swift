//
//  SwiftUIView.swift
//  
//
//  Created by Imran on 9/4/24.
//

import SwiftUI
 
// Assuming T is a generic type for your tab items and it's Identifiable.
public struct KBTabs<T: Identifiable, Content: View>: View {
    var list: [T]
    var currentTab: T.ID
    var onSelect: (T) -> Void // Adjusted to provide selected item back to the caller
    var content: (T, Bool) -> Content // Closure to generate content based on the item and its selection state
    var selectedColor: Color = .blue
    var deselectedColor: Color = .gray
    var animation: Namespace.ID
    
   public var body: some View {
        ForEach(list) { item in
            // Using the provided content closure to generate view for each tab item
            content(item, currentTab == item.id)
                .foregroundColor(currentTab == item.id ? .white : deselectedColor)
                .background {
                    if currentTab == item.id {
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(selectedColor)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    } else {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(deselectedColor.opacity(0.3), lineWidth: 1)
                    }
                }
                .onTapGesture { onSelect(item) }
        }
    }
}
