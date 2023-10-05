//
//  ModalBuilder.swift
//
//
//  Created by Imran on 4/10/23.
//

import SwiftUI

@available(iOS 15.0, *)
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
    
    public init(isShowPopup: Binding<Bool>, onSubmit: @escaping () -> Void) {
        self.isShowPopup = isShowPopup
        self.onSubmit = onSubmit
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
            buttonBGColorOne: buttonBGColorOne ?? .green,
            buttonBGColorTwo:  buttonBGColorTwo ?? .red,
            layoutKind: layoutKind,
            onSubmit: onSubmit
        )
    }
}

