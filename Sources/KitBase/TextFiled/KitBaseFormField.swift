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
    let text: String
    let textColor: Color
    let content: () -> Content
    
    public init(title: String, text: String, textColor: Color = .gray, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.text = text
        self.textColor = textColor
        self.content = content
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
                        .fill(Color.white)
                )
                .overlay {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(textColor, lineWidth: 1)
                }
        }
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
    @State private var firstname = ""
    @State private var lastname = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            KitBaseFormField(title: "Username", text: username) {
                TextField("username", text: $username)
            }
            
            KitBaseFormField(title: "Password", text: password) {
                SecureField("Password", text: $password)
                    .keyboardType(.namePhonePad)
            }
            
            KitBaseFormField(title: "First name", text: firstname) {
                TextField("First name", text: $firstname)
            }
            
            KitBaseFormField(title: "Last name", text: lastname) {
                TextField("Last name", text: $lastname)
            }
        }
    }
}
