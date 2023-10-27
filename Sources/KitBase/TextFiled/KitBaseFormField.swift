//
//  KitBaseFormField.swift
//
//
//  Created by Imran on 27/10/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct KitBaseFormField<Content>: View where Content: View {
    let title: String
    let textColor: Color
    let backgroundColor: Color
    let error: String?
    let content: () -> Content
    @Binding var isValid: Bool
    @Binding var borderColor: Color
    
    public init(
        title: String,
        textColor: Color = .gray,
        backgroundColor: Color = .white,
        error: String? = nil,
        isValid: Binding<Bool>,
        borderColor: Binding<Color>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.error = error
        self.content = content
        self._isValid = isValid
        self._borderColor = borderColor
    }

    public var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(textColor)
                .font(.caption)

            content()
                .frame(height: 44)
                .foregroundColor(textColor)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(backgroundColor)
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(borderColor, lineWidth: 1)
                }

            if let error = error {
                Text(error)
                    .foregroundColor(.red) // Customize the error text color
                    .font(.caption)
            }
        }
        .onAppear {
            updateBorderColor()
        }
    }
    
    
    private func updateBorderColor() {
        borderColor = isValid ? Color.gray : .red
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
       @State private var isUsernameValid = true
       @State private var isPasswordValid = true
       @State private var usernameError: String? = nil
       @State private var passwordError: String? = nil
       @State private var usernameBorderColor = Color.gray
       @State private var passwordBorderColor = Color.gray

       var body: some View {
           VStack(alignment: .leading, spacing: 8) {
               KitBaseFormField(title: "Username", error: usernameError, isValid: $isUsernameValid, borderColor: $usernameBorderColor) {
                   TextField("Username", text: $username)
               }

               KitBaseFormField(title: "Password", error: passwordError, isValid: $isPasswordValid, borderColor: $passwordBorderColor) {
                   SecureField("Password", text: $password)
               }
           }
       }
}
