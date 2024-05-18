# KitBase

- [x] Button
- [x] Input Field
- [x] Loader
- [ ] Modal
- [ ] Toast
- [ ] Card


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

### Card View
##

## Tab Item
```swift 
struct TabItemExample: View {
    @Namespace private var animation
    @State private var selectedTab: UUID = UUID()
    
    private let tabs = [
        TabItem(id: UUID(), image: "ic-twitter", title: "Twitter"),
        TabItem(id: UUID(), image: "ic-visa", title: "Visa"),
        TabItem(id: UUID(), image: "ic-whatsapp", title: "Whatsapp"),
        TabItem(id: UUID(), image: "ic-youtube", title: "Youtube"),
        TabItem(id: UUID(), image: "img-checkwebsite", title: "Website"),
        TabItem(id: UUID(), image: "ic-facebook", title: "Facebook"),
        TabItem(id: UUID(), image: "ic-sim", title: "Sim"),
        TabItem(id: UUID(), image: "ic-mc1", title: "Master Card"),
    ]
    
    var body: some View {
        KBTabsBuilder()
            .withList(tabs)
            .withCurrentTab(selectedTab)
            .withContent { item, isSelected in
                VStack{
                    Image(item.image ?? "")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 24, height: 24)
                    Text(item.title)
                        .font(isSelected ? .headline : .subheadline)
                        .foregroundColor(isSelected ? .white : .black)
                }
            }
            .onSelect { item in
                selectedTab = item.id
                print(selectedTab)
            }
            .withScrollDirection(.horizontal)
            .withNamespace(animation)
            .setBackgroundColor(/*selectedTab == isSelected ? Color.gray.opacity(0.2) : */.gray)
            .setSelectedColor(Color.blue)
            .setDeselectedColor(Color.white)
            .setBorderColor(Color.black)
            .setBorderWidth(1)
            .setVerticalPadding(10)
            .setHorizontalPadding(20)
            .setCornerRadius(10)
            .setTabSpacing(10)
            .build()
            .padding()
    }
}```
