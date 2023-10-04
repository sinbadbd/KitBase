//
//  ModalView.swift
//
//
//  Created by Imran on 4/10/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct ModalView: View {

    @Binding public var isShowPopup: Bool
    public var title: String? = nil
    public var summary: String? = nil
    public var onSubmit: (() -> Void)
    
    public var body: some View{
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
            Image(systemName: "tortoise.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 84, height: 84)
                .frame(alignment: .center)
                .offset(y: -50)
                //.frame(maxWidth: .infinity, alignment: .center)
                .zIndex(1111)
            VStack(alignment: .center){
        
                
                VStack(spacing:12){
                    Text(title ?? "")
                        .font(Font.custom("DTAC2018-Bold", size: 16))
                        .bold()
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)
                    
                    Text(summary ?? "")
                        .font(Font.custom("Kanit-light", size: 16))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 50)
               // .padding(.horizontal)
                
                HStack {
                    Button {
                        isShowPopup = false
                    } label: {
                        Text("cancel")
                            .font(Font.custom("DTAC2018-Bold", size: 14))
                            .bold()
                            .foregroundColor(.blue)
//                            .modifier(DtacButtonModifier(backgroundColor: .clear, hasCustomStyle: true))
                    }
                    .frame(width: 100)
                    
                    Button {
                        onSubmit()
                    } label: {
                        Text("save")
                            .font(Font.custom("DTAC2018-Bold", size: 14))
                            .bold()
                            .foregroundColor(.red)
//                            .modifier(DtacButtonModifier(backgroundColor: .primaryDark, hasCustomStyle: false))
                    }
                    .frame(width: 100)
                }
                .padding(.top, 24)
                .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity)

            .background(
                Color.white
            )     
            .cornerRadius(8)

            .padding(.horizontal, 16)

            .animation(.easeInOut)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.5))
        .opacity(isShowPopup ? 1.0 : 0.0)
        .animation(.easeInOut)
    }
}

@available(iOS 15.0, *)
#Preview {
    ModalView(isShowPopup: .constant(true), title: "Confirm", summary: "this is testthis is testthis is testthis is testthis is testthis is testthis is testthis is testthis is testthis is testthis is testthis is testthis is testthis is testthis is test") {
        
    }
}
