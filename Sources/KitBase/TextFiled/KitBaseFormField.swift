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
    let content: () -> Content
    
    init(title: String, textColor: Color = .gray, backgroundColor: Color = .white, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.textColor = textColor
        self.backgroundColor = backgroundColor
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
                        .fill(backgroundColor)
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
            KitBaseFormField(title: "Username") {
                TextField("username", text: $username)
            }
            
            KitBaseFormField(title: "Password") {
                SecureField("Password", text: $password)
                    .keyboardType(.namePhonePad)
            }
            
            KitBaseFormField(title: "First name") {
                TextField("First name", text: $firstname)
            }
            
            KitBaseFormField(title: "Last name") {
                TextField("Last name", text: $lastname)
            }
        }
    }
}
