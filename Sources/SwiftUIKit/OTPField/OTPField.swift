//
//  OTPFieldView.swift
//  Robi
//
//  Created by Imran on 13/7/24.
//

import SwiftUI

enum OTPField {
    case field1
    case field2
    case field3
    case field4
    case field5
    case field6
}
struct OTPFieldView: View {
    @Binding var otpFields: [String]
    @Binding var isOTPValid: Bool
    @Binding var validationRequestCounter: Int
    let maxVerify: Int
    let otpFieldCount: Int
    @FocusState var activeField: OTPField?
    
    var body: some View {
        ViewThatFits(in: .horizontal) {
            HStack(spacing: 10) {
                ForEach(0..<otpFields.count, id: \.self) { item in
                    VStack(spacing: 8) {
                        TextField("", text: Binding(
                            get: { otpFields.indices.contains(item) ? otpFields[item] : "" },
                            set: { newValue in
                                if otpFields.indices.contains(item) {
                                    otpFields[item] = newValue
                                    otpCondition(value: otpFields)
                                }
                            }
                        ))
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .focused($activeField, equals: activeStateForIndex(index: item))
                        .onDisappear {
                            activeField = nil
                        }
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(colorForField(index: item), lineWidth: 2)
                            .frame(width: 44, height: 44)
                    }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        activeField = nil
                    }
                }
            }
        }
    }
    func otpCondition(value: [String]) {
        // Check for multiple characters and trim to the last character if necessary
        for index in 0..<otpFields.count {
            if value[index].count > 1 {
                otpFields[index] = String(value[index].last!)
            }
        }
        
        // Move to the next field if the current field is filled
        for index in 0..<otpFields.count {
            if value[index].count == 1 && activeStateForIndex(index: index) == activeField {
                activeField = activeStateForIndex(index: index + 1)
                return
            }
        }
        
        // Move to the previous field if the current field is empty and the previous field is not empty
        for index in 1..<otpFields.count {
            if value[index].isEmpty && !value[index - 1].isEmpty {
                activeField = activeStateForIndex(index: index - 1)
                return
            }
        }
        
        // Handle backspace properly by checking if the field is empty and the previous field is filled
        for index in (1..<otpFields.count).reversed() {
            if value[index].isEmpty && value[index - 1].count == 1 {
                activeField = activeStateForIndex(index: index - 1)
                otpFields[index - 1] = ""
                return
            }
        }
        
        // Handle the edge case where the last field is filled, and we need to move to the next non-existent field
        if otpFields.last?.count == 1 {
            activeField = nil
        }
    }
    
    
    
    func colorForField(index: Int) -> Color {
        if isOTPValid {
            return .green
        } else if validationRequestCounter >= maxVerify {
            return .red
        } else if !otpFields[index].isEmpty {
            return .gray
        } else {
            return .blue
        }
    }
    
    func activeStateForIndex(index: Int) -> OTPField {
        switch index {
        case 0: return .field1
        case 1: return .field2
        case 2: return .field3
        case 3: return .field4
        case 4: return .field5
        default: return .field6
        }
    }
}


struct OTPVerifyPageV2: View {
    
    //@EnvironmentObject private var router: AppCoordinator
    //let edges = UIWindow.keyWindow?.safeAreaInsets
    @ObservedObject var viewModel = OTPVerifyVMV2()
    @FocusState var activeField: OTPField?
    
    var body: some View {
        VStack {
            //  NavToolBarView(navTitle: "login".localized())
            
            VStack(alignment: .center, spacing: 32) {
                Image("")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 95, height: 137)
                Text("sfs")
                //  .font(.textMdMedium)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                
                //                OTPFieldView()
                OTPFieldView(
                    otpFields: $viewModel.otpFields,
                    isOTPValid: $viewModel.isOTPValid,
                    validationRequestCounter: $viewModel.validationRequestCounter,
                    maxVerify: viewModel.maxVerify,
                    otpFieldCount: 4
                )
                
                if viewModel.validationRequestCounter >= viewModel.maxVerify {
                    Text("Maximum attempts reached. Please try again later.")
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }
                
                Button("verify", action: {
                    verifyOTPIfNeeded()
                    print("verify_number")
                    UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                })
                .buttonStyle(
                    KitBaseButtonStyleBuilder()
                        .setBackgroundColor(viewModel.isOTPFilled ? .red : .green)
                        .setForegroundColor(.black)
                        .setBorderColor(.gray)
                        .setButtonCornerRadius(16)
                        .setFont(.subheadline)
                        .setButtonHeight(24)
                        .setShowShadow(false)
//                        .setEnableHaptic(true)
//                        .setHapticFeedbackSyle(.medium)
                        .build()
                )
                .disabled(!viewModel.isOTPFilled)
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Button {
                            UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                        } label: {
                            Text("code")
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .padding(.horizontal, 34)
            .onChange(of: viewModel.otpFields) { newValue in
                viewModel.checkOTPFilled()
            }
            .onAppear {
                fetchOTPFieldConfiguration()
            }
            //            .onChange(of: viewModel.otpFields) { newValue in
            //                otpCondition(value: newValue)
            //            }
            //            .onAppear {
            //                activeField = .field1
            //            }
        }
        // .padding(.top, edges?.top)
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
    
    func fetchOTPFieldConfiguration() {
        // Simulate an API call to get the OTP field configuration
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let otpFieldCount = 6 // Replace this with actual API response
            viewModel.configureOTPFields(count: otpFieldCount)
        }
    }
    
    func verifyOTPIfNeeded() {
        let enteredOTP = viewModel.otpFields.joined()
        
        guard viewModel.validationRequestCounter < viewModel.maxVerify else {
            viewModel.validationRequestCounter += 1
            return
        }
        
        if enteredOTP.count == viewModel.otpFields.count {
            viewModel.validationRequestCounter += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                let isValidOTP = self.checkOTP(otp: enteredOTP)
                self.viewModel.isOTPValid = isValidOTP
                if isValidOTP {
                    clearTextFieldData()
                } else {
                    viewModel.validationRequestCounter += 1
                }
            }
        } else {
            viewModel.isOTPValid = false
        }
    }
    
    private func checkOTP(otp: String) -> Bool {
        return otp == "123456" // Replace this with actual OTP verification logic
    }
    
    private func clearTextFieldData() {
        viewModel.otpFields = Array(repeating: "", count: viewModel.otpFields.count)
    }
}


class OTPVerifyVMV2: ObservableObject {
    
    
    @Published var otpFields = [String]()
    @Published var isOTPValid = false
    @Published var isOTPFilled = false
    
    func configureOTPFields(count: Int) {
        otpFields = Array(repeating: "", count: count)
    }
    
    func checkOTPFilled() {
        isOTPFilled = otpFields.allSatisfy { !$0.isEmpty }
    }
    
    
    ////
    //    @Published var otpFields = Array(repeating: "", count: 6)
    //    @Published var otpFieldsArr = [String]()
    //    var otpFieldCount = 6
    //    @Published var isOTPValid = false
    //    @Published var isOTPFilled = false
    //    @Published var showErrorMessage = false
    ////    var validationRequestCounter = 0
    ////    var maxVerify = 3
    ////    var otpText = ""
    //    // MARK:
    //    @Published var otpText: String = ""
    //    @Published var otpFields: [String] = Array(repeating: "", count: 6)
    
    @Published var isSuccess: Bool = false
    
    
    @Published var isValidMsisdn: Bool = false
    
    //@Published var datakitError: DataKitError? = nil
    
    // @Published var authToken: ApiToken? = nil
    
    //"0880799445".formatMsisdn() //String() //0813126811 //"66815666466" //MSISDN //47894226444
    @Published var msisdn: String = String()
    @Published var name: String = String()
    
    @Published var clockTimer: Timer?
    @Published var timerEndAt: Date?
    @Published var validationRequestCounter = 0
    @Published var resendRequestCounter = 0
    @Published var maxVerify = 3
    @Published var maxResend = 0
    //@Published var otpFieldCount = 4
    @Published var isApptoApp = false
    
    @Published var remainingTime: String?
    @Published var isResendButtonHidden: Bool = false
    
    
    init(){
        startTimer()
    }
    
    func validateMsisdn(_ msisdn: String) { //
        /*let formattedMsisdn = msisdn.formatMsisdn()
         print("Formatted Msisdn: \(formattedMsisdn)")
         
         // Keep the formatted number with dashes
         self.msisdn = formattedMsisdn
         
         if let msisdnWithoutDashes = formattedMsisdn.toMsisdn().toMsisdnd() {
         isValidMsisdn = msisdnWithoutDashes.isValidDtacNumber()
         print("is-Valid-Msisdn: \(isValidMsisdn)")
         } else {
         isValidMsisdn = false
         print("in-ValidMsisdn: \(isValidMsisdn)")
         }*/
    }
    
    func startTimer() {
        /* timerEndAt = Date().advanced(by: 30)
         if let resendAt = authToken?.resendAt { timerEndAt = Date(timeIntervalSince1970: TimeInterval(resendAt)) }
         clockTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
         self.updateClock()
         }*/
    }
    
    private func updateClock() {
        guard let expireAt = timerEndAt, expireAt.timeIntervalSince(Date()) > 1 else {
            clockTimer?.invalidate()
            isResendButtonHidden = false
            return
        }
        
        DispatchQueue.main.async {
            //  self.remainingTime = Date.getRemainingTime(for: expireAt)
            self.isResendButtonHidden = true
        }
    }
    
    deinit {
        clockTimer?.invalidate()
        print("Deint AuthVM")
    }
    
}
