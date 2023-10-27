# KitBase
 
 - Button [Done]
 - Modal [Done]
 - Toast
 - Input Field
 - Card
 
```swift
struct ContentButtonView: View {
    var body: some View {
        VStack(spacing: 16) {
            Button("icon with button", action: {
                print("print")
            })
                .buttonStyle(KitBaseButtonStyle(size: .lg, variant: .solid, backgroundColor: .red, borderColor: .accentColor, foregroundColor:.blue, buttonHeight: 34, buttonCornerRadius: 8, icon: Image(systemName: "pencil.circle.fill"), iconColor: .green, iconWidth: 40, iconHeight: 40))
            
            Button("Solid XS", action: {
                
            })
                .buttonStyle(KitBaseButtonStyle(size: .lg, variant: .solid, backgroundColor: .red, borderColor: .accentColor, foregroundColor:.blue, buttonCornerRadius: 8))
            
            Button("Subtle MD", action: {})
                .buttonStyle(KitBaseButtonStyle(size: .lg, variant: .outline, backgroundColor: .clear, borderColor: .yellow, foregroundColor: .blue, buttonWidth: UIScreen.main.bounds.width * 0.8, borderWidth: 2))
            
            Button("Outline SM", action: {})
                .buttonStyle(KitBaseButtonStyle(size: .sm, variant: .outline, backgroundColor: .blue, borderColor: .red, foregroundColor: .yellow, borderWidth: 1))
            
            Button("SwiftUI Solid LG", action: {})
                .buttonStyle(KitBaseButtonStyle(size: .sm, variant: .solid, foregroundColor: .red))
        }
    }
}
```
