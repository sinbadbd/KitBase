////
////  TabItemExampleView.swift
////  KitBaseExamle
////
////  Created by Imran on 18/5/24.
////
//
//import SwiftUI
//
//struct TabItemExampleView: View {
//    @Namespace private var animation
//    @State private var selectedTab: UUID = UUID()
//    
//    private let tabs = [
//        TabItem(id: UUID(), title: "Home"),
//        TabItem(id: UUID(), title: "Profile"),
//        TabItem(id: UUID(), title: "Settings")
//    ]
//    
//    var body: some View {
//        KBTabsBuilder()
//            .withList(tabs)
//            .withCurrentTab(selectedTab)
//            .withContent { item, isSelected in
//                Text(item.title)
//                    .font(isSelected ? .headline : .subheadline)
//                    .foregroundColor(isSelected ? .white : .black)
//            }
//            .onSelect { item in
//                selectedTab = item.id
//            }
//            .withScrollDirection(.horizontal)
//            .withNamespace(animation)
//            .setBackgroundColor(Color.gray.opacity(0.2))
//            .setSelectedColor(Color.blue)
//            .setDeselectedColor(Color.white)
//            .setBorderColor(Color.black)
//            .setBorderWidth(1)
//            .setVerticalPadding(10)
//            .setHorizontalPadding(20)
//            .setCornerRadius(10)
//            .setTabSpacing(10)
//            .build()
//            .padding()
//    }
//}
//
//#Preview {
//    TabItemExampleView()
//}
// 
