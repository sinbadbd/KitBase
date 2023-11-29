//
//  File.swift
//  
//
//  Created by Imran on 16/11/23.
//

import SwiftUI

//@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
public struct KBTextFieldBuilder<Content: View> {
    public var title: String? = nil
    public var font: Font? = nil
    public var errorFont: Font? = nil
    public var titleSpacing: CGFloat = 8
    public var textColor: Color = .gray
    public var backgroundColor: Color = .white
    public var errorMessage: String? = nil
    public var content: () -> Content
    public var isValid: Binding<Bool>
    public var icon: AnyView? = nil
    var textFieldHeight: CGFloat = 40
    var cornerRadius: CGFloat = 4
    var borderColor: Color? = nil
    var borderWidth: CGFloat = 1.2
    var strokeColor: Color = Color(red: 236/255, green: 234/255, blue: 235/255)
    var shadowColor: Color = Color(red: 192/255, green: 189/255, blue: 191/255)
    var shadowRadius: CGFloat = 1.6
    var shadowX: CGFloat = 0
    var shadowY: CGFloat = 0
    
    public init(@ViewBuilder content: @escaping () -> Content, isValid: Binding<Bool>) {
        self.content = content
        self.isValid = isValid
    }
    
    public func title(_ title: String) -> KBTextFieldBuilder {
        var copy = self
        copy.title = title
        return copy
    }
    
    public func font(_ font: Font) -> KBTextFieldBuilder {
        var copy = self
        copy.font = font
        return copy
    }
    
    public func errorFont(_ errorFont: Font) -> KBTextFieldBuilder {
        var copy = self
        copy.errorFont = errorFont
        return copy
    }
    
    public func titleSpacing(_ spacing: CGFloat) -> KBTextFieldBuilder {
        var copy = self
        copy.titleSpacing = spacing
        return copy
    }
    
    public func textColor(_ color: Color) -> KBTextFieldBuilder {
        var copy = self
        copy.textColor = color
        return copy
    }
    
    public func backgroundColor(_ color: Color) -> KBTextFieldBuilder {
        var copy = self
        copy.backgroundColor = color
        return copy
    }
    
    public func setErrorMessage(_ error: String?) -> KBTextFieldBuilder {
        var copy = self
        copy.errorMessage = error
        return copy
    }
    
    public func icon(_ icon: AnyView?) -> KBTextFieldBuilder {
        var copy = self
        copy.icon = icon
        return copy
    }
    
    public func textFieldHeight(_ height: CGFloat) -> Self {
        var copy = self
        copy.textFieldHeight = height
        return copy
    }
    
    public func cornerRadius(_ radius: CGFloat) -> Self {
        var copy = self
        copy.cornerRadius = radius
        return copy
    }
    
    public func borderColor(_ color: Color?) -> Self {
        var copy = self
        copy.borderColor = color
        return copy
    }
    
    public func borderWidth(_ width: CGFloat) -> Self {
        var copy = self
        copy.borderWidth = width
        return copy
    }
    
    public func strokeColor(_ color: Color) -> Self {
        var copy = self
        copy.strokeColor = color
        return copy
    }
    
    public func shadowColor(_ color: Color) -> Self {
        var copy = self
        copy.shadowColor = color
        return copy
    }
    
    public  func shadow(radius: CGFloat, x: CGFloat, y: CGFloat) -> Self {
        var copy = self
        copy.shadowRadius = radius
        copy.shadowX = x
        copy.shadowY = y
        return copy
    }
    
    public func build() -> KBTextField<Content> {
    
        KBTextField(
            title: title,
            font: font,
            errorFont: errorFont,
            spacing: titleSpacing,
            textColor: textColor,
            backgroundColor: backgroundColor,
            setErrorMessage: errorMessage,
            isValid: isValid,
            icon: icon,
            textFieldHeight: textFieldHeight,
            cornerRadius: cornerRadius,
            borderColor: borderColor,
            borderWidth: borderWidth,
            strokeColor: strokeColor,
            shadowColor: shadowColor,
            shadowRadius: shadowRadius,
            shadowX: shadowX,
            shadowY: shadowY,
            content: content
        )
    }
}


//@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
#Preview {
    KBTextFieldBuilderView(textInput: "")
}

//@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
struct KBTextFieldBuilderView: View  {
    @State var textInput: String
    @State var nameTextFile: Bool = false
    var body: some View {
        VStack{
            
            KBTextFieldBuilder(content: {
                TextField("Exclusive 7.7 package", text: $textInput)
            }, isValid: $nameTextFile)
            .title("Username")
            .font(.headline)
            .errorFont(.subheadline)
            .titleSpacing(12)
            .textColor(.blue)
            .backgroundColor(.white)
            .setErrorMessage("test error message")
            .icon(AnyView(Image(systemName: "person")))
            .textFieldHeight(44)
            .cornerRadius(30)
//            .borderColor(.green)
            .borderWidth(0.5)
//            .strokeColor(.indigo)
//            .shadowColor(.black.opacity(0.5))
//            .shadow(radius: 2, x: 2, y: 2)
//            .shadow(radius: 3, x: 2, y: 3)
            .build()
            
        }
        .padding(.horizontal,16)
    }
    
}
