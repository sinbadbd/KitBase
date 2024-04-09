//
//  SnapCarousel.swift
//  ViewKit
//
//  Created by Imran on 15/3/24.
//

import SwiftUI

public struct SnapCarousel<Content: View, T: Identifiable>: View {
    var content: (T) -> Content
    var list: [T]
    
    var spacing: CGFloat
    var edgeSpace: CGFloat
    @Binding var index: Int
    var autoScrollInterval: TimeInterval
    var smallScreenInitialOffsetAdjustment: CGFloat
    var largeScreenInitialOffsetAdjustment: CGFloat
    var itemWidthFactor: CGFloat
    
    @GestureState private var offset: CGFloat = 0
    @State private var currentIndex: Int = 0
    //@State private var timer: Timer.TimerPublisher = Timer.publish(every: autoScrollInterval, on: .main, in: .common)
    @State private var timer: Timer.TimerPublisher? = nil
    @State private var cancellable: AnyCancellable?
    var enableAutoScroll: Bool
    
    public init(
        spacing: CGFloat = 16,
        edgeSpace: CGFloat = 16,
        index: Binding<Int>,
        items: [T],
        autoScrollInterval: TimeInterval = 3,
        smallScreenInitialOffsetAdjustment: CGFloat = 45,
        largeScreenInitialOffsetAdjustment: CGFloat = 55,
        itemWidthFactor: CGFloat = 2 / 3,
        enableAutoScroll: Bool = true,
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        self.list = items
        self.spacing = spacing
        self.edgeSpace = edgeSpace
        self._index = index
        self.content = content
        self.autoScrollInterval = autoScrollInterval
        self.smallScreenInitialOffsetAdjustment = smallScreenInitialOffsetAdjustment
        self.largeScreenInitialOffsetAdjustment = largeScreenInitialOffsetAdjustment
        self.itemWidthFactor = itemWidthFactor
        self.enableAutoScroll = enableAutoScroll
    }
    
    public  var body: some View {
        GeometryReader { proxy in
            let itemWidth = proxy.size.width * itemWidthFactor
            let contentWidth = itemWidth + spacing
            
            let scrollViewWidth = proxy.size.width
            
            let initialOffset = self.calculateInitialOffset(scrollViewWidth: scrollViewWidth, itemWidth: itemWidth)
            
            HStack(spacing: spacing) {
                ForEach(list) { item in
                    content(item)
                        .frame(width: itemWidth)
                }
            }
            .padding(.horizontal, edgeSpace)
            .frame(width: scrollViewWidth, alignment: .leading)
            .offset(x: calculateOffset(scrollViewWidth: scrollViewWidth, itemWidth: itemWidth, initialOffset: initialOffset))
            .gesture(
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded(onDragEnded(itemWidth: contentWidth))
                    .onChanged(onDragChanged(itemWidth: contentWidth))
            )
        }
        .onAppear {
            if enableAutoScroll{
                timer = Timer.publish(every: autoScrollInterval, on: .main, in: .common)
                startAutoScroll()
            }
        }
        .onDisappear {
            cancellable?.cancel()
        }
        .animation(.easeOut, value: offset == 0)
    }
    
    private func calculateInitialOffset(scrollViewWidth: CGFloat, itemWidth: CGFloat) -> CGFloat {
        let adjustment = UIScreen.main.bounds.height < 800 ? smallScreenInitialOffsetAdjustment : largeScreenInitialOffsetAdjustment
        return scrollViewWidth / 2 - itemWidth / 2 - edgeSpace - adjustment
    }
    
    private func calculateOffset(scrollViewWidth: CGFloat, itemWidth: CGFloat, initialOffset: CGFloat) -> CGFloat {
        let adjustedWidth = itemWidth + spacing
        let itemCount = CGFloat(list.count)
        
        let totalContentWidth = adjustedWidth * itemCount
        
        let offsetBasedOnIndex = -CGFloat(currentIndex) * adjustedWidth + offset
        
        let totalPadding = edgeSpace * 2
        
        let contentNeedsCentering = scrollViewWidth > totalContentWidth + totalPadding
        
        let centeringOffset = contentNeedsCentering ? (scrollViewWidth - totalContentWidth) / 2 - edgeSpace : 0
        let finalOffset = offsetBasedOnIndex + initialOffset + centeringOffset
        
        return min(max(finalOffset, scrollViewWidth - totalContentWidth - edgeSpace), edgeSpace)
    }
    
    private func onDragEnded(itemWidth: CGFloat) -> (DragGesture.Value) -> Void {
        return { value in
            let movement = -value.translation.width
            let threshold = itemWidth / 2
            if movement > threshold {
                currentIndex = min(currentIndex + 1, list.count - 1)
            } else if movement < -threshold {
                currentIndex = max(currentIndex - 1, 0)
            }
            index = currentIndex
            restartAutoScroll()
        }
    }
    
    private func onDragChanged(itemWidth: CGFloat) -> (DragGesture.Value) -> Void {
        return { value in
            let movement = value.translation.width / itemWidth
            let potentialIndex = currentIndex + (movement > 0 ? -1 : 1)
            if potentialIndex >= 0 && potentialIndex < list.count {
                index = potentialIndex
            }
        }
    }
    
    private func startAutoScroll() {
        cancellable = timer?.autoconnect().sink { [self] _ in
            if list.count > 0 {
                withAnimation {
                    currentIndex = (currentIndex + 1) % list.count
                    index = currentIndex
                }
            }
        }
    }
    
    private func restartAutoScroll() {
        cancellable?.cancel()
        startAutoScroll()
    }
}
