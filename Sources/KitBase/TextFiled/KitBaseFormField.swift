//
//  KitBaseFormField.swift
//
//
//  Created by Imran on 27/10/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct KitBaseFormField<Content>: View where Content: View {
    var title: String? = nil
    var font: Font? = nil
    var errorFont: Font? = nil
    let titleSpacing: CGFloat
    let textColor: Color
    let backgroundColor: Color
    let error: String?
    let content: () -> Content
    @Binding var isValid: Bool
    //@Binding var borderColor: Color?
    
    public init(
        title: String? = nil,
        font: Font? = nil,
        errorFont: Font? = nil,
        spacing: CGFloat,
        textColor: Color = .gray,
        backgroundColor: Color = .white,
        error: String? = nil,
        isValid: Binding<Bool>,
        //borderColor: Binding<Color?>? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.font = font
        self.errorFont = errorFont
        self.titleSpacing = spacing
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.error = error
        self.content = content
        self._isValid = isValid
        //self._borderColor = borderColor ?? .constant(nil)
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
                .frame(height: 40)
                .foregroundColor(textColor)
                .padding(.horizontal, 16)
            
                .background(
                    RoundedRectangle(cornerRadius: 4, style: .continuous)
                        .fill(error != nil ? Color(red: 0.97, green: 0.93, blue: 0.93) : backgroundColor)
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 4, style: .continuous)
                        .stroke(error != nil ? Color.red : Color(red: 0.84, green: 0.84, blue: 0.84), lineWidth: 1.2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4, style: .continuous)
                                .stroke(Color(red: 236/255, green: 234/255, blue: 235/255), lineWidth: 1.5)
                                .shadow(color: Color(red: 192/255, green: 189/255, blue: 191/255), radius: 1.6, x: 0, y: 0) // All side shadow
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                        )
                }
            
            if let error = error {
                Text(error)
                    .foregroundColor(.red) // Customize the error text color
                    .font(errorFont)
                
                    //.padding(.top, 5)
            }
        }
        //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1) // MARK: - DEBUG
    }
    
}

@available(iOS 15.0, *)
#Preview {
    TextFieldView()
}

@available(iOS 15.0, *)
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
            KitBaseFormField(errorFont: .caption, spacing: 0, error: usernameError, isValid: $isUsernameValid) {
                TextField("Username", text: $username)
            }
            
            KitBaseFormField(title: "Password", font: .footnote, errorFont: .caption, spacing: 8, error: passwordError, isValid: $isPasswordValid) {
                SecureField("Password", text: $password)
            }
            
            Button {
                
            } label: {
                Text("Submit")
            }
            
        }
        .padding(.horizontal, 16)
    }
}
