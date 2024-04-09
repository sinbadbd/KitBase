//
//  KitBaseFormField.swift
//
//
//  Created by Imran on 27/10/23.
//

import SwiftUI
//@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
public struct KBTextField<Content>: View where Content: View {
    var title: String? = nil
    var font: Font? = nil
    var errorFont: Font? = nil
    let titleSpacing: CGFloat
    let textColor: Color
    let backgroundColor: Color
    let setErrorMessage: String?
    let content: () -> Content
    @Binding var isValid: Bool
    var icon: AnyView? = nil
    var textFieldHeight: CGFloat = 40
    var cornerRadius: CGFloat = 4
    var borderColor: Color? = nil
    var borderWidth: CGFloat = 1.2
    var strokeColor: Color = Color(red: 236/255, green: 234/255, blue: 235/255)
    var shadowColor: Color = Color(red: 192/255, green: 189/255, blue: 191/255)
    var shadowRadius: CGFloat = 1.6
    var shadowX: CGFloat = 0
    var shadowY: CGFloat = 0
    
    public init(
        title: String? = nil,
        font: Font? = nil,
        errorFont: Font? = nil,
        spacing: CGFloat,
        textColor: Color = .gray,
        backgroundColor: Color = .white,
        setErrorMessage: String? = nil,
        isValid: Binding<Bool>,
        icon: AnyView? = nil,
        textFieldHeight: CGFloat = 40,
        cornerRadius: CGFloat = 4,
        borderColor: Color? = nil,
        borderWidth: CGFloat = 1.2,
        strokeColor: Color = Color(red: 236/255, green: 234/255, blue: 235/255),
        shadowColor: Color = Color(red: 192/255, green: 189/255, blue: 191/255),
        shadowRadius: CGFloat = 1.6,
        shadowX: CGFloat = 0,
        shadowY: CGFloat = 0,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.font = font
        self.errorFont = errorFont
        self.titleSpacing = spacing
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.setErrorMessage = setErrorMessage
        self.content = content
        self._isValid = isValid
        self.icon = icon
        self.textFieldHeight = textFieldHeight
        self.cornerRadius = cornerRadius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.strokeColor = strokeColor
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.shadowX = shadowX
        self.shadowY = shadowY
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: titleSpacing) {
            if let title = title {
                Text(title)
                    .font(font)
                    .foregroundColor(textColor)
                    .font(.caption)
            }
            
            content()
                .frame(height: textFieldHeight)
                .padding(.horizontal, icon != nil ? 40 : 16)
                .overlay(
                    HStack {
                        if let icon = icon {
                            icon
                                .foregroundColor(textColor)
                                .padding(.horizontal, 16)
                        }
                        Spacer()
                    }
                )
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .fill(setErrorMessage != nil ? Color(red: 0.97, green: 0.93, blue: 0.93) : backgroundColor)
                )
                .overlay {
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .stroke(borderColor ?? (setErrorMessage != nil ? Color.red : Color(red: 0.84, green: 0.84, blue: 0.84)), lineWidth: borderWidth)
                        .overlay(
                            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                                .stroke(strokeColor, lineWidth: 1.5)
                                .shadow(color: shadowColor, radius: shadowRadius, x: shadowX, y: shadowY)
                                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                        )
                }
            
            if let error = setErrorMessage {
                Text(error)
                    .foregroundColor(.red) // Customize the error text color
                    .font(errorFont)
            }
        }
    }
}

//@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
#Preview {
    TextFieldView()
}

//@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
struct TextFieldView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var isUsernameValid: Bool = true
    @State private var isPasswordValid: Bool = true
    @State private var usernameError: String? = nil
    @State private var passwordError: String? = nil
    @State private var usernameBorderColor: Color? = .gray
    @State private var passwordBorderColor: Color? = .gray
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            KBTextField(errorFont: .caption, spacing: 0, setErrorMessage: usernameError, isValid: $isUsernameValid) {
                HStack{
                    TextField("Username", text: $username)
                        .onChange(of: username) { item in
                            
                        }
                }
            }
            
            KBTextField(title: "Password", font: .footnote, errorFont: .caption, spacing: 8, setErrorMessage: passwordError, isValid: $isPasswordValid) {
                SecureField("Password", text: $password)
            }
            
            
            KBTextField(
                title: "Username",
                spacing: 8,
                textColor: .black,
                backgroundColor: .white,
                isValid: $isUsernameValid,
                icon: AnyView(Image(systemName: "person")),
                content: {
                    TextField("Enter your username", text: $username)
                }
            )
            
            
            Button {
                
            } label: {
                Text("Submit")
            }
            
        }
        .padding(.horizontal, 16)
    }
}
