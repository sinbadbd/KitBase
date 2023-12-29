# KitBase

- Button
- Input Field
- Modal
- Toast
- Card
- Loader
- 


👉Button Usages

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

TextField Builder 

```swift
struct KBTextFieldBuilderView: View  {

    @State var textInput: String
    @State var nameTextFile: Bool = false

    var body: some View {
        VStack{
            
            KBTextFieldBuilder(content: {
                TextField("Name field", text: $textInput)
            }, isValid: $nameTextFile)
            .title("Username")
            .font(.headline)
            .errorFont(.subheadline)
            .titleSpacing(12)
            .textColor(.blue)
            .backgroundColor(.white)
            .setErrorMessage("test error message")
            .icon(AnyView(Image(systemName: "person")))
            .textFieldHeight(44)
            .cornerRadius(30)
            .borderColor(.green)
            .borderWidth(0.5)
            .strokeColor(.indigo)
            .shadowColor(.black.opacity(0.5))
            .build()
        }
        .padding(.horizontal,16)
    }
    
}
```

### Loading view 

```swift
struct DemoLoadingView: View {
    @State private var isLoading = true
    var body: some View {
        ZStack{
            Color.black.opacity(0.4)
                .ignoresSafeArea()
            // Loading view
            if isLoading {
                LoadingView(progressColor: .green)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}

```

