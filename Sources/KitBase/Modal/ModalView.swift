//
//  ModalView.swift
//
//
//  Created by Imran on 4/10/23.
//

import SwiftUI

//@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
public struct ModalView: View {
    
    public enum Axis {
        case vertical
        case horizontal
    }
    
    @Binding private (set) var isShowPopup: Bool
    private (set) var title: String? = nil
    private (set) var summary: String? = nil
    private (set) var image: String? = nil
    private (set) var width: CGFloat? = 84
    private (set) var height: CGFloat? = 84
    private (set) var layoutAxis: Axis
    private (set) var buttonOneText: String? = nil
    private (set) var buttonTwoText: String? = nil
    private (set) var buttonBGColorOne: Color
    private (set) var buttonBGColorTwo: Color
    
    @State private var offset: CGFloat = 1000
    
    
    private (set) var onSubmit: (() -> Void)
    private (set) var onCancel: (() -> Void)
    
    @State var isTapBackground: Bool = false
    
    public init(
        isShowPopup: Binding<Bool>,
        title: String? = nil,
        summary: String? = nil,
        image: String? = nil,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        buttonOneText: String? = nil,
        buttonTwoText: String? = nil,
        buttonBGColorOne: Color = .green,
        buttonBGColorTwo: Color = .red,
        layoutKind: Axis = .horizontal,
        onSubmit: @escaping () -> Void,
        onCancel: @escaping () -> Void
    ) {
        self._isShowPopup = isShowPopup
        self.title = title
        self.summary = summary
        self.image = image
        self.width = width
        self.height = height
        self.layoutAxis = layoutKind
        self.buttonOneText = buttonOneText
        self.buttonTwoText = buttonTwoText
        self.onSubmit = onSubmit
        self.onCancel = onCancel
        self.buttonBGColorOne = buttonBGColorOne
        self.buttonBGColorTwo = buttonBGColorTwo
    }
    
    public var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
            if isShowPopup {
                ZStack{
                    VStack(alignment: .center){
                        Image(systemName: "tortoise.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: width, height: height)
                            .frame(alignment: .center)
                            .offset(y: -110)
                        VStack(spacing:8){
                            Text(title ?? "")
                                .font(.headline)
                                .bold()
                                .foregroundColor(.black)
                                .padding(.horizontal, 16)
                            
                            Text(summary ?? "")
                                .font(.caption)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 16)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 50)
                        
                        switch layoutAxis {
                        case .vertical:
                            VerticalButtonView(buttonOneText: buttonOneText ?? "set Title", buttonTowText: buttonTwoText ?? "Set Title", action: {
                                onCancel()
                                close()
                            }, onSubmit: {
                                onSubmit()
                                close()
                            })
                            .padding(.horizontal, 20)
                            .padding(.top, 24)
                            .padding(.bottom, 20)
                        case .horizontal:
                            
                            HorizontalButtonView(buttonOneText:  buttonOneText ?? "set Title", buttonTowText: buttonTwoText ?? "Set Title", buttonBGColorOne: buttonBGColorOne , buttonBGColorTwo: buttonBGColorTwo, action: {
                                close()
                            }, onSubmit: {
                                onSubmit()
                                close()
                            })
                            .padding(.horizontal, 20)
                            .padding(.top, 24)
                            .padding(.bottom, 20)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(
                        Color.green
                    )
                    .cornerRadius(8)
                    .padding(.horizontal, 16)
                    .offset(x: 0, y: offset)
                    .onAppear {
                        withAnimation(.spring()) {
                            offset = 0
                        }
                    }
                    
                    //                .overlay {
                    //                   // ZStack(alignment: .top, content: {
                    //                        Image(systemName: "tortoise.circle.fill")
                    //                            .resizable()
                    //                            .aspectRatio(contentMode: .fill)
                    //                            .frame(width: width, height: height)
                    //                            .frame(alignment: .center)
                    //                            .offset(y: -110)
                    //                   // })
                    //                }
                }
                
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                //            .background(Color.black.opacity(0.5))
                .opacity(isShowPopup ? 1.0 : 0.0)
                .animation(.easeInOut)
                //        .zIndex(1111)
                .onTapGesture {
                    print("background Tapped")
                    self.isTapBackground = true
                    close()
                }
                
                .background(isShowPopup ? Color.black.opacity(0.5) : Color.clear)
                .ignoresSafeArea()
            }
        }

        //.background(isShowPopup ? Color.black.opacity(0.5) : Color.clear)
    }
    
    func close() {
        withAnimation(.spring()) {
            offset = 1000
            isShowPopup = false
        }
    }
}


//@available(iOS 15.0, macOS 13.0, watchOS 8, tvOS 13, *)
#Preview {
    /*
     ModalView(isShowPopup: .constant(true), title: "Confirm This", summary: "Are you want to delete this?", image: "tortoise.circle.fill", width: 40, height: 40, buttonOneText: "Cancle", buttonTwoText: "Save", layoutKind: .vertical) {
     
     }*/
    ModalView(isShowPopup: .constant(true),title: "Confirm This", summary: "Are you want to delete this?", image: "tortoise.circle.fill", width: 40, height: 40, buttonOneText: "Cancle", buttonTwoText: "Save", layoutKind: .vertical) {
        
    } onCancel: {
        
    }
    
}



//as! any View

/*
 In Swift, when you have a property with the @Binding attribute, it is typically used to create a two-way binding with a value stored in a parent view. To initialize such a property, you need to provide a binding to a value from the parent view. To do this, you use the self._property syntax to access the underlying projected value of the binding.
 
 Here's a breakdown of why self._isShowPopup is used in this context:
 
 @Binding public var isShowPopup: Bool: This property is declared as a binding to a Boolean value, which means it doesn't store the value directly but provides access to the value stored in a parent view.
 
 In the custom initializer init(isShowPopup: Binding<Bool>, ...), you want to initialize the isShowPopup property with the binding that is passed in as a parameter. You can't directly assign a binding parameter to a binding property because bindings are read-only, so you need to access the underlying value via the projected value.
 
 self._isShowPopup = isShowPopup: This line of code uses the _isShowPopup projected value to set up the two-way binding. By doing this, you're essentially connecting the isShowPopup property of your ModalView to the external isShowPopup binding provided by the parent view.
 
 In summary, when you use self._isShowPopup = isShowPopup, you are initializing the isShowPopup property with the binding that comes from the parent view. This allows your ModalView to read and update the value stored in the parent view, creating a two-way binding between them.
 
 
 */
