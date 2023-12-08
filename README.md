# KitBase
 
 
 - Button [Done]
 - Modal [Done]
 - Toast
 - Input Field
 - Card









👉Button Usages

```
Kitbase Builder pattern with `buttonStyle` 
```swift
    Button("Button name", action: {
                print("")
            })
            .buttonStyle(
                KitBaseButtonStyleBuilder()
                    .setBackgroundColor(.gray)
                    .setForegroundColor(.black)
                    .setButtonWidth(200)
                    .setButtonHeight(30)
                    .setIcon("square.and.arrow.up")
                    .setImage("ic_edit")
                    .setIconColor(.red)
                    .setIconColor(.red)
                    .setIconWidth(20)
                    .setIconHeight(20)
                    .setShowShadow(false) // Default true
                    //.setPaddingAll(paddingAll: 0)
                    .setPaddingVertical(paddingVertical: 4)
                    .setPaddingHorizontal(paddingHorizontal: 4)
                    .build()
            )
        }
```
