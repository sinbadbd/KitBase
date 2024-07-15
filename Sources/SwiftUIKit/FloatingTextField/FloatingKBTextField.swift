//
//  FloatingKBTextField.swift
//
//
//  Created by Imran on 2/7/24.
//
import SwiftUI

public enum ValidationType {
    case phone, email, password, number, text
}

public enum TralingIconType{
    case phone, email, password, number , none
}

public struct FloatingKBTextField: View {
    var textFieldFont: Font? = nil
    var textFieldColor: Color? = .gray
    var floatingLabelText: String? = nil
    var floatingLabelFont: Font? = nil
    var floatingBackgroundColor: Color? = nil
    var errorFont: Font? = nil
    var titleSpacing: CGFloat? = 0
    var textColor: Color? = .gray
    let leadingIconColor: Color
    let leadingIconBackground: Color
    let trailingIconBackground: Color
    let trailingIconColor: Color
    let backgroundColor: Color
    var dividerBorderBottomHeight: CGFloat = 1
    var dividerBorderBackgroundColor: Color? = .gray
    var validationType: ValidationType
    var tralingIconType: TralingIconType?
    var leadingIcon: AnyView? = nil
    var trailingIcon: AnyView? = nil
    var textFieldHeight: CGFloat = 40
    var cornerRadius: CGFloat = 4
    var borderColor: Color? = .gray
    var borderWidth: CGFloat = 1
    var strokeColor: Color = Color.gray
    var shadowColor: Color = Color.gray
    var shadowRadius: CGFloat = 0
    var shadowX: CGFloat = 0
    var shadowY: CGFloat = 0
    
    var successBorderColor: Color? = .green
    var failedBorderColor: Color? = .red
    
    var isFloatingAnimationOff: Bool = false
    
    var keyboardType : UIKeyboardType
    var getValue: ((String)->Void)? = nil
    var onTapCompletion: (() -> Void)?
    var initialFocusState: Bool
    
    var dynamicErrorMessage: String?
    var dynamicSuccessMessage: String?
    
    @FocusState private var isInputFocusActive: Bool
    
    @Binding var text: String
    @Binding var isValid: Bool
    
    @State private var isFocused: Bool = false
    @State private var isShowPoppOver: Bool = false
    @State private var isPasswordVisible: Bool = false
    
    @State private var errorMessage: String? = nil
    @State private var successMessage: String? = nil
    
    @State var outlinedTextFieldEnable: Bool = false
    @State var filledTextFieldEnable: Bool = false
    @State var isPhoneNumberCountEnable: Bool = false
    @State private var hasTyped: Bool = false
    
    public init(
        outlinedTextFieldEnable: Bool = false,
        filledTextFieldEnable: Bool = false,
        isPhoneNumberCountEnable: Bool = false,
        textFieldFont: Font? = nil,
        textFieldColor: Color? = .gray,
        floatingLabelText: String? = nil,
        floatingLabelFont: Font? = nil,
        floatingBackgroundColor: Color? = .white,
        errorFont: Font? = nil,
        spacing: CGFloat = 0,
        textColor: Color? = .gray,
        backgroundColor: Color = .white,
        validationType: ValidationType,
        tralingIconType: TralingIconType = .none,
        text: Binding<String>,
        isValid: Binding<Bool>,
        leadingIcon: AnyView? = nil,
        leadingIconColor: Color = .gray,
        leadingIconBackground: Color = .clear,
        trailingIcon: AnyView? = nil,
        trailingIconColor: Color = .gray,
        trailingIconBackground: Color = .clear,
        textFieldHeight: CGFloat = 40,
        cornerRadius: CGFloat = 4,
        borderColor: Color? = .gray,
        borderWidth: CGFloat = 1.2,
        dividerBorderBottomHeight: CGFloat = 1,
        dividerBorderBackgroundColor: Color? = .gray,
        strokeColor: Color = Color(red: 236/255, green: 234/255, blue: 235/255),
        shadowColor: Color = Color(red: 192/255, green: 189/255, blue: 191/255),
        shadowRadius: CGFloat = 1.6,
        shadowX: CGFloat = 0,
        shadowY: CGFloat = 0,
        successBorderColor: Color? = .green,
        failedBorderColor: Color? = .red,
        keyboardType : UIKeyboardType,
        getValue: ((String?)->Void)? = nil,
        onTapCompletion: (() -> Void)? = nil,
        initialFocusState: Bool = false,
        dynamicErrorMessage: String? = "Invalid input",
        dynamicSuccessMessage: String? = "Looks Good!",
        isFloatingAnimationOff: Bool = false
        //        @ViewBuilder content: @escaping () -> Content
    ) {
        self.outlinedTextFieldEnable = outlinedTextFieldEnable
        self.filledTextFieldEnable = filledTextFieldEnable
        self.isPhoneNumberCountEnable = isPhoneNumberCountEnable
        self.textFieldFont = textFieldFont
        self.textFieldColor = textFieldColor
        self.floatingLabelText = floatingLabelText
        self.floatingLabelFont = floatingLabelFont
        self.floatingBackgroundColor = floatingBackgroundColor
        self.errorFont = errorFont
        self.titleSpacing = spacing
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.validationType = validationType
        self._text = text
        self._isValid = isValid
        self.leadingIcon = leadingIcon
        self.leadingIconBackground = leadingIconBackground
        self.leadingIconColor = leadingIconColor
        self.trailingIcon = trailingIcon
        self.trailingIconColor = trailingIconColor
        self.trailingIconBackground = trailingIconBackground
        self.textFieldHeight = textFieldHeight
        self.cornerRadius = cornerRadius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.dividerBorderBottomHeight = dividerBorderBottomHeight
        self.dividerBorderBackgroundColor = dividerBorderBackgroundColor
        self.strokeColor = strokeColor
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.shadowX = shadowX
        self.shadowY = shadowY
        self.successBorderColor =  successBorderColor
        self.failedBorderColor = failedBorderColor
        self.validationType = validationType
        self.tralingIconType = tralingIconType
        self.keyboardType = keyboardType
        self.getValue = getValue
        self.onTapCompletion = onTapCompletion
        self.dynamicErrorMessage = dynamicErrorMessage
        self.dynamicSuccessMessage = dynamicSuccessMessage
        //        self.content = content
        self.initialFocusState = initialFocusState
        self._isFocused = State(initialValue: initialFocusState)
        self.isFloatingAnimationOff = isFloatingAnimationOff
    }
    
    public var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: titleSpacing) {
                
                Group {
                    if validationType == .password && isPasswordVisible {
                        TextField("", text: $text)
                            .font(textFieldFont)
                            .foregroundColor(textFieldColor)
                    } else if validationType == .password {
                        SecureField("", text: $text)
                            .font(textFieldFont)
                            .foregroundColor(textFieldColor)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    } else if validationType == .text{
                        TextField("", text: $text)
                            .font(textFieldFont)
                            .foregroundColor(textFieldColor)
                            .keyboardType(keyboardType)
                    }else {
                        TextField("", text: $text)
                            .font(textFieldFont)
                            .foregroundColor(textFieldColor)
                            .keyboardType(keyboardType)
                    }
                }
                .keyboardType(keyboardType)
                .frame(height: textFieldHeight)
                .padding(.leading, (leadingIcon != nil ? 48 : 16))
                .padding(.trailing, (trailingIcon != nil ? 48 : 16))
                .focused($isInputFocusActive)
                .onChange(of: text) { value in
                    hasTyped = true
                    getValue?(value)
                }
                .toolbar {
                    ToolbarItem(placement: .keyboard) {
                        Button("Done") {
                            if !isFloatingAnimationOff{
                                isInputFocusActive = false
                            }
                        }
                        .font(.body)
                        .foregroundColor(textColor)
                    }
                }
                .overlay(
                    HStack {
                        if let leadingIcon = leadingIcon {
                            leadingIcon
                                .frame(width: 24, height: 24)
                                .foregroundColor(leadingIconColor)
                                .background(content: {
                                    leadingIconBackground
                                })
                                .padding(.leading, 16)
                        }
                        Spacer()
                        if validationType == .password {
                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(trailingIconColor)
                                    .padding(.trailing, 16)
                            }
                        } else if validationType == .phone {
                            if isPhoneNumberCountEnable || !text.isEmpty{
                                Text("\(text.count)/11")
                                    .font(.caption)
                                    .bold()
                                    .limitInputLength(value:$text, length: 11)
                                    .padding(.trailing, 16)
                                    .transition(.move(edge: .trailing))
                            }
                        }else if let trailingIcon = trailingIcon {
                            if keyboardType == .emailAddress {
                                getIcontype(icon: AnyView(trailingIcon))
                                    .onTapGesture {
                                        withAnimation {
                                            isShowPoppOver.toggle()
                                        }
                                    }
                            }
                        }
                    }
                )
                .background(
                    backgroundColor
                        .clipShape(
                            CustomCorners(
                                corners: outlinedTextFieldEnable ? [
                                    .topLeft,
                                    .topRight,
                                    .bottomLeft,
                                    .bottomRight
                                ] : [.topLeft, .topRight],
                                radius: cornerRadius
                            )
                        )
                )
                .overlay {
                    if outlinedTextFieldEnable {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(currentBorderColor, lineWidth: borderWidth)
                    }
                }
                .overlay(alignment: .leading) {
                    if let title = floatingLabelText {
                        if outlinedTextFieldEnable {
                            Text(title)
                                .font(floatingLabelFont)
                                .foregroundColor(textColor)
                                .padding(.horizontal, 4)
                                .background((isFocused || !text.isEmpty) ? floatingBackgroundColor: .clear)
                                .scaleEffect((isFocused || !text.isEmpty) ? 0.8 : 1.0, anchor: .leading)
                                .offset(
                                    x: (isFocused || !text.isEmpty ) ? 16 : (leadingIcon != nil ? 48 : 16),
                                    y: (isFocused || !text.isEmpty) ? -textFieldHeight/2 : 0
                                )
                            //.opacity((isFocused || !text.isEmpty) ? 1 : 0.5)
                                .animation(.easeInOut(duration: 0.2), value: isFocused || !text.isEmpty)
                        }
                    }
                }
                .overlay(alignment: .leading) {
                    if let title = floatingLabelText {
                        if filledTextFieldEnable {
                            Text(title)
                                .font(floatingLabelFont)
                                .foregroundColor(textColor)
                                .padding(.horizontal, 4)
                                .offset(
                                    x: (isFocused || !text.isEmpty ) ? 44 : (leadingIcon != nil ? 52 : 16),
                                    y: (isFocused || !text.isEmpty) ? -textFieldHeight/2 + 10 : 4
                                )
                            //.opacity((isFocused || !text.isEmpty) ? 1 : 0.5)
                                .animation(.easeInOut(duration: 0.2), value: isFocused || !text.isEmpty)
                        }
                    }
                }
                .onTapGesture {
                    withAnimation {
                        if !isFloatingAnimationOff {
                            isFocused = true
                            isInputFocusActive = true
                        }
                    }
                    onTapCompletion?()
                }
                .onAppear {
                    isFocused = initialFocusState
                    isInputFocusActive = initialFocusState
                }
                
                if filledTextFieldEnable {
                    Divider()
                        .frame(height: 2)
                        .background(content: {
                            currentBorderBottomColor
                        })
                }
                /// validation message
                if let error = errorMessage {
                    inputValidationMessage(message: error, icon: "exclamationmark.circle", color: .red)
                    
                }else{
                    if let success = successMessage{
                        inputValidationMessage(message: success, icon: "checkmark.circle.fill", color: .green)
                    }
                }
            }
            .onChange(of: text) { newValue in
                validate(text: newValue)
                if text.isEmpty {
                    errorMessage = nil
                    isFocused = false
                }
                /*
                 if isValid {
                 isInputFocusActive = false
                 }*/
            }
        }
        .overlay(alignment: .topTrailing) {
            if isShowPoppOver{
                popoverView
            }
        }
    }
    
    private var currentBorderColor: Color {
        if text.isEmpty {
            return borderColor ?? .gray
        }
        else if isFocused {
            return isValid ? (successBorderColor ?? .green) : (failedBorderColor ?? .red)
        }
        else {
            return isValid ? (successBorderColor ?? .green) : (failedBorderColor ?? .red)
        }
    }
    
    private var currentTextLabelColor: Color {
        if text.isEmpty {
            return textColor ?? .gray
        } else if isFocused {
            return isValid ? (successBorderColor ?? .green) : (failedBorderColor ?? .red)
        } else {
            return isValid ? (successBorderColor ?? .green) : (failedBorderColor ?? .red)
        }
    }
    
    private var currentBorderBottomColor: Color {
        if text.isEmpty {
            return dividerBorderBackgroundColor ?? .gray
        } else if isFocused {
            return isValid ? (successBorderColor ?? .green) : (failedBorderColor ?? .red)
        } else {
            return isValid ? (successBorderColor ?? .green) : (failedBorderColor ?? .red)
        }
    }
    
    @ViewBuilder
    func getIcontype(icon:AnyView) -> some View{
        icon
            .frame(width: 24, height: 24)
            .foregroundColor(leadingIconColor)
            .background(content: {
                leadingIconBackground
            })
            .padding(.horizontal, 16)
        
    }
    
    private func validate(text: String) {
        switch validationType {
        case .phone:
            isValid = validatePhone(text: text)
        case .email:
            isValid = validateEmail(text: text)
        case .password:
            isValid = validatePassword(text: text)
        case .number:
            isValid = validateNumber(text: text)
        case .text:
            isValid = validateText(text: text)
        }
        
        if isValid {
            errorMessage = nil
            successMessage = dynamicSuccessMessage
        } else {
            errorMessage = hasTyped ? dynamicErrorMessage : nil
            successMessage = nil
        }
    }
    
    private func validatePhone(text: String) -> Bool {
        let phoneRegex = "^(?:\\+?88)?01[13-9]\\d{8}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: text)
    }
    
    private func validateEmail(text: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: text)
    }
    
    private func validatePassword(text: String) -> Bool {
        return text.count >= 8
    }
    
    private func validateNumber(text: String) -> Bool {
        return Int(text) != nil
    }
    
    private func validateText(text: String) -> Bool {
        let customRegex = "^[A-Za-z0-9]{1,32}$"
        let customTest = NSPredicate(format: "SELF MATCHES %@", customRegex)
        return customTest.evaluate(with: text)
    }
}

extension FloatingKBTextField{
    
    private var popoverView: some View{
        VStack {
            Text("Show the popover")
                .font(.callout)
                .foregroundColor(.white)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 4)
        
        .background {
            Color.black.opacity(0.7)
        }
        .frame(height: 24)
        .cornerRadius(8)
        .offset(y: -24)
        .overlay(alignment: .bottomTrailing) {
            Triangle()
                .fill(.black.opacity(0.7))
                .frame(width: 20, height: 16)
                .rotationEffect(.degrees(180))
                .offset(x: -12,y: -8)
        }
    }
    
    @ViewBuilder
    func inputValidationMessage(message: String, icon: String, color: Color) -> some View{
        HStack(spacing: 8){
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 14, height: 14)
                .foregroundColor(color)
            
            Text(message)
                .foregroundColor(color)
                .font(errorFont)
        }
        .padding(.top, 4)
        .transition(.slide)
    }
    
}

struct RegistrationFormView: View {
    @State private var isPhoneValid: Bool = false
    @State private var isEmailValid: Bool = false
    @State private var isPasswordValid: Bool = false
    @State private var isNumberValid: Bool = false
    @State private var isNameValidation: Bool = false
    
    @State var phone = ""
    @State var name = ""
    @State var email = ""
    @State var password = ""
    @State var number = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            FloatingKBTextField(
                outlinedTextFieldEnable: true,
                floatingLabelText: "Enter your name",
                floatingLabelFont: .title,
                spacing: 0,
                textColor: .gray,
                backgroundColor: .white,
                validationType: .text,
                text: $name,
                isValid: $isNameValidation,
                textFieldHeight: 56,
                cornerRadius: 4,
                borderColor: .black,
                keyboardType: .default,
                getValue: { value in
                    guard let value = value else { return  }
                    print("value:\(value)")
                }
            )
            
            FloatingKBTextField(
                outlinedTextFieldEnable: true,
                isPhoneNumberCountEnable: false,
                floatingLabelText: "Phone",
                spacing: 0,
                validationType: .phone,
                text: $phone,
                isValid: $isPhoneValid,
                leadingIcon: AnyView(Image(systemName: "phone.fill")),
                leadingIconColor: .purple,
                trailingIcon: AnyView(Image(systemName: "checkmark")),
                textFieldHeight: 56,
                borderColor: .brown,
                keyboardType: .phonePad,
                getValue: { value in
                    guard let value = value else { return  }
                    print("value:\(value)")
                },
                isFloatingAnimationOff: true
            )
            
            FloatingKBTextField(
                outlinedTextFieldEnable: true,
                floatingLabelText: "Email",
                spacing: 0,
                validationType: .email,
                text: $email,
                isValid: $isEmailValid,
                leadingIcon: AnyView(Image(systemName: "envelope.fill")),
                leadingIconColor: .blue,
                trailingIcon: AnyView(Image(systemName: "info.circle.fill")),
                textFieldHeight: 56,
                keyboardType: .emailAddress,
                getValue: { value in
                    guard let value = value else { return  }
                    print("value:\(value)")
                }
            )
            
            FloatingKBTextField(
                filledTextFieldEnable: true,
                floatingLabelText: "Password",
                spacing: 0,
                validationType: .password,
                text: $password,
                isValid: $isPasswordValid,
                leadingIcon: AnyView(Image(systemName: "lock.fill")),
                leadingIconColor: .blue,
                trailingIcon: AnyView(Image(systemName: "checkmark")),
                textFieldHeight: 56,
                keyboardType: .default,
                getValue: { value in
                    guard let value = value else { return  }
                    print("value:\(value)")
                }
            )
            
            FloatingKBTextField(
                filledTextFieldEnable: true,
                floatingLabelText: "Number",
                spacing: 0,
                validationType: .number,
                text: $number,
                isValid: $isNumberValid,
                leadingIcon: AnyView(Image(systemName: "number")),
                leadingIconColor: .blue,
                trailingIcon: AnyView(Image(systemName: "checkmark")),
                textFieldHeight: 56,
                keyboardType: .numberPad,
                getValue: { value in
                    guard let value = value else { return  }
                    print("value:\(value)")
                }
            )
        }
        .padding()
    }
}

struct RegistrationFormView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationFormView()
    }
}
