# KitBase
 
 
 - Button [Done]
 - Modal [Done]
 - Toast
 - Input Field
 - Card









👉Button Usages

icon with button
```swift
 Button("icon with button", action: {
    print("print")
 })
 .buttonStyle(KitBaseButtonStyle(size: .lg, variant: .solid, backgroundColor: .red, borderColor: .accentColor, foregroundColor:.blue, buttonHeight: 34,    
   buttonCornerRadius: 8, icon: Image(systemName: "pencil.circle.fill"), iconColor: .green, iconWidth: 40, iconHeight: 40))
```
👉Solid XS
```swift
   Button("Solid XS", action: {
          print("print")
    })
   .buttonStyle(KitBaseButtonStyle(size: .lg, variant: .solid, backgroundColor: .red, borderColor: .accentColor, foregroundColor:.blue, buttonCornerRadius: 8))
```
👉Outline SM
```swift
   Button("Outline SM", action: {})
       .buttonStyle(KitBaseButtonStyle(size: .sm, variant: .outline, backgroundColor: .blue, borderColor: .red, foregroundColor: .yellow, borderWidth: 1))
```
👉SwiftUI Solid LG
```swift  
  Button("SwiftUI Solid LG", action: {})
      .buttonStyle(KitBaseButtonStyle(size: .sm, variant: .solid, foregroundColor: .red))
```
