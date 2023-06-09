//
//  QuantityButtons.swift
//  babyshop
//
//  Created by Jakub Górka on 09/06/2023.
//

import SwiftUI

struct QuantityButtons: View {
    
//    @State var quantity: Int = 0
    @ObservedObject var cartProduct: CartProduct

    @Environment(\.colorScheme) var colorScheme

    
    var body: some View {
        GeometryReader { proxy in
            ZStack{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(colorScheme == .dark ? Color.primary.opacity(0.5) : Color.primary.opacity(0.1))
                HStack{
                    Button {
                        cartProduct.quantity+=1
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: proxy.size.height*0.35, height: proxy.size.height*0.35)
                                .foregroundColor(Color.primary.opacity(0))
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: proxy.size.height*0.35, height: proxy.size.height*0.35)
                                .foregroundColor(.black)
                        }

                    }

                    Spacer()
                    
                    Text(String(cartProduct.quantity))
                        .font(.headline)
                        .bold()
                    
                    Spacer()
                    
                    Button {
                        if cartProduct.quantity>0{
                            cartProduct.quantity-=1
                        }
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: proxy.size.height*0.35, height: proxy.size.height*0.35)
                                .foregroundColor(Color.primary.opacity(0))
                            Image(systemName: "minus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: proxy.size.height*0.35, height: proxy.size.height*0.35)
                                .foregroundColor(.black)
                        }
                    }

                }
                .padding(.horizontal, proxy.size.width*0.15)
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
}
