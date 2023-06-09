//
//  ShopView.swift
//  babyshop
//
//  Created by Jakub Górka on 30/05/2023.
//

import SwiftUI

struct ShopView: View {
    
    @ObservedObject var system: System
    @State var showCart: Bool = false
    
    var body: some View {
        GeometryReader{ proxy in
            if system.user != nil{
                NavigationView{
                    VStack{
                        ScrollView{
                            HStack{
                                VStack{
                                    ForEach(Array(system.products.enumerated()), id: \.element) { index, product in
                                        if index%2==0{
                                            NavigationLink(destination: ProductView(product: product, user: system.user!)) {
                                                ShopItem(product: product)
                                            }
                                            .frame(width: proxy.size.width*0.4, height: proxy.size.width*0.4)
                                            .padding(.all, proxy.size.width*0.025)
                                            Divider()
                                        }
                                    }
                                }
                                VStack{
                                    ForEach(Array(system.products.enumerated()), id: \.element) { index, product in
                                        if index%2==1{
                                            NavigationLink(destination: ProductView(product: product, user: system.user!)) {
                                                ShopItem(product: product)
                                            }
                                            .frame(width: proxy.size.width*0.4, height: proxy.size.width*0.4)
                                            .padding(.all, proxy.size.width*0.025)
                                            Divider()
                                            
                                        }
                                    }
                                }
                                
                            }
                            .padding(.horizontal, proxy.size.width*0.05)
                        }
                        .padding(.top, proxy.size.height*0.01)
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .navigationTitle("The Toy Shop")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                showCart = true
                            }) {
                                Text("Cart")
                                Label("Shopping cart", systemImage: "cart")
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                Task{
                                    await system.logout()
                                }
                                
                            }) {
                                Label("Profile", systemImage: "person")
                            }
                        }
                        
                    }
                }
                .sheet(isPresented: $showCart, content: {
                    VStack{
                        Text("Cart:")
                            .bold()
                            .font(.largeTitle)
                            .padding(.top, proxy.size.height*0.05)
                        
                        ForEach(system.user!.cart){ cartItem in
                            HStack{
                                Image(uiImage: cartItem.picture)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: proxy.size.width*0.2, height: proxy.size.width*0.2)
                                
                                Text(cartItem.name)
                                
                                Spacer()
                                if cartItem.quantity>1{
                                    Text("(\(String(cartItem.quantity)) items)")
                                        .font(.footnote)
                                }
                                else{
                                    Text("(\(String(cartItem.quantity)) item)")
                                        .font(.footnote)
                                }
                                Text(" \(String(format: "%.2f", (cartItem.price*Float(cartItem.quantity)))) PLN")
                                
                            }
                            .frame(height: proxy.size.width*0.2)
                            
                            Divider()
                            
                        }
                        .padding(.horizontal, proxy.size.width*0.1)
                        
                        Spacer()
                        
                        HStack{
                            Text("Total:")
                                .bold()
                            
                            Spacer()
                            
                            Text("(\(system.user!.getItemsAmountInCart()) items)")
                                .font(.footnote)
                            Text(" \(String(format: "%.2f", system.user!.getCartPrice())) PLN")
                        }
                        .padding(.horizontal, proxy.size.width*0.1)
                        
                        Button {
                            //checkout
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: proxy.size.width*0.75, height: proxy.size.height*0.07)
                                    .foregroundColor(.green)
                                Text("Buy")
                                    .foregroundColor(.black)
                            }
                        }

                    }
                })
                .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
    }
}
