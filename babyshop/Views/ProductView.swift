

import SwiftUI

struct ProductView: View {
    
    @State var product: Product
    @ObservedObject var cartProduct: CartProduct
    @ObservedObject var user: User
    
    init(product: Product, user: User) {
        self.user = user
        self.product = product
        self.cartProduct = CartProduct(id: product.id, name: product.name, price: product.price, quantity: 0, picture: product.pictures.first!)
        // Customize the appearance of the PageControl
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.label
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.separator
    }
    
    var body: some View {
        GeometryReader{ proxy in
            VStack{
                
                
                TabView {
                    ForEach(product.pictures, id: \.self) { item in
                         //3
                        Image(uiImage: item)
                            .resizable()
                            .scaledToFit()
                            .frame(width: proxy.size.width, height: proxy.size.width)

                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(width: proxy.size.width, height: proxy.size.width)

                Divider()
                
                Text(product.name)
                    .bold()
                    .font(.title)

                Text(" \(String(format: "%.2f", product.price)) PLN")

                
                Text("DESCRIPTION")
                    .font(.caption)
                    .bold()
                    .padding(.top, proxy.size.height*0.05)
                
                Text(product.description)
                    .font(.body)
                
                Spacer()
                
                HStack{
                    
                    QuantityButtons(cartProduct: cartProduct)
                        .frame(width: proxy.size.width*0.25, height: proxy.size.width*0.1)
                    
                    Button {
                        if cartProduct.quantity > 0{
                            Task{
                                if await user.addToCart(item: cartProduct){
                                    print("Dodano produkt \(cartProduct.name) do koszyka")
                                }
                                else{
                                    print("Error, addToCart")
                                }
                            }
                        }
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: proxy.size.width*0.55, height: proxy.size.width*0.15)
                                .foregroundColor(Color.green)
                            HStack{
                                Image(systemName: "cart")
                                    .resizable()
                                    .frame(width: proxy.size.width*0.05, height: proxy.size.width*0.05)
                                    .foregroundColor(.black)
                                    .padding(.leading, proxy.size.width*0.05)
                                Spacer()
                                Text("Add to cart")
                                    .foregroundColor(.black)
                                Spacer()
                                VStack{}
                                    .frame(width: proxy.size.width*0.05, height: proxy.size.width*0.05)
                                    .padding(.trailing, proxy.size.width*0.05)

                            }
                        }
                        .frame(width: proxy.size.width*0.55, height: proxy.size.width*0.15)

                    }
                    
                }
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
}


extension UIImage: Identifiable {
    public var id: String {
        // You can use any unique identifier for your UIImage here
        return UUID().uuidString
    }
}
