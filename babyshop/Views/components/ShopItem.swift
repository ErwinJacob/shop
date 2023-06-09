//
//  ShopItem.swift
//  babyshop
//
//  Created by Jakub Górka on 04/06/2023.
//

import SwiftUI

struct ShopItem: View {
    
    @State var product: Product
    
    var body: some View {
        GeometryReader{ proxy in
            VStack{
                Image(uiImage: product.pictures.first!)
                    .resizable()
                    .scaledToFit()
                Text(product.name)
                    .foregroundColor(Color.primary)
                Text(" \(String(format: "%.2f", product.price)) PLN")
                    .foregroundColor(Color.primary)
                    .font(.footnote)

            }
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
}
