//
//  ModalBuilder.swift
//
//
//  Created by Imran on 4/10/23.
//

import SwiftUI

@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
public struct ModalViewBuilder {
    private var isShowPopup: Binding<Bool>
    private var title: String?
    private var summary: String?
    private var image: String?
    private var width: CGFloat?
    private var height: CGFloat?
    private var buttonOneText: String?
    private var buttonTwoText: String?
    private var buttonBGColorOne: Color?
    private var buttonBGColorTwo: Color?
    private var layoutKind: ModalView.Axis
    private var onSubmit: (() -> Void)
    private var onCancel: (() -> Void)
    
    public init(
        isShowPopup: Binding<Bool>,
        onSubmit: @escaping () -> Void,
        onCancel: @escaping () -> Void
    ) {
        self.isShowPopup = isShowPopup
        self.onSubmit = onSubmit
        self.onCancel = onCancel
        self.layoutKind = .horizontal
    }
    
    public func title(_ title: String?) -> ModalViewBuilder {
        var builder = self
        builder.title = title
        return builder
    }
    
    public func summary(_ summary: String?) -> ModalViewBuilder {
        var builder = self
        builder.summary = summary
        return builder
    }
    
    public func image(_ image: String?) -> ModalViewBuilder {
        var builder = self
        builder.image = image
        return builder
    }
    
    public func width(_ width: CGFloat?) -> ModalViewBuilder {
        var builder = self
        builder.width = width
        return builder
    }
    
    public func height(_ height: CGFloat?) -> ModalViewBuilder {
        var builder = self
        builder.height = height
        return builder
    }
    
    public func buttonOneText(_ text: String?) -> ModalViewBuilder {
        var builder = self
        builder.buttonOneText = text
        return builder
    }
    
    public func buttonTwoText(_ text: String?) -> ModalViewBuilder {
        var builder = self
        builder.buttonTwoText = text
        return builder
    }
    
    public func layoutKind(_ layoutKind: ModalView.Axis) -> ModalViewBuilder {
        var builder = self
        builder.layoutKind = layoutKind
        return builder
    }
    
    public func buttonBGColorOne(_ backgroundColor: Color) -> ModalViewBuilder {
        var builder = self
        builder.buttonBGColorOne = backgroundColor
        return builder
    }
    
    public func buttonBGColorTwo(_ backgroundColor: Color) -> ModalViewBuilder {
        var builder = self
        builder.buttonBGColorTwo = backgroundColor
        return builder
    }
    
    public func build() -> ModalView {
        return ModalView(
            isShowPopup: isShowPopup,
            title: title,
            summary: summary,
            image: image,
            width: width,
            height: height,
            buttonOneText: buttonOneText,
            buttonTwoText: buttonTwoText,
            buttonBGColorOne: buttonBGColorOne ?? .clear,
            buttonBGColorTwo:  buttonBGColorTwo ?? .clear,
            layoutKind: layoutKind,
            onSubmit: onSubmit,
            onCancel: onCancel
        )
    }
}

import SwiftUI
@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
#Preview {
    DemoShowModalView()
}

@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
struct DemoShowModalView: View {
    
    @State var isShowModal: Bool = false
    
    var body: some View {
        ZStack{
            Color.clear
                .ignoresSafeArea()
            
            Button(action: {
                isShowModal.toggle()
            }, label: {
                Text("Button")
            })
            .buttonStyle(
                KitBaseButtonStyleBuilder()
                .setBackgroundColor(.red)
                .setForegroundColor(.white)
                .setButtonWidth(200)
                .build()
            )
            
            if isShowModal{
                ModalBuilderView()
            }
        }
    }
}

@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
struct ModalBuilderView: View {
    
    @State var isShowModal: Bool = true
    
    var body: some View {
        ZStack{
            ModalViewBuilder(isShowPopup: $isShowModal, onSubmit: {
                print("onSubmit")
                isShowModal = true
            }, onCancel: {
                print("onCancel")
            })
            .title("Confirm")
            .summary("Are you want to logout?")
            .width(80)
            .height(80)
            .buttonOneText("No")
            .buttonTwoText("Yes")
            .layoutKind(.vertical)
            .build()
        }
    }
}

