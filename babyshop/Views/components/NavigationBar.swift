//
//  NavigationBar.swift
//  babyshop
//
//  Created by Jakub Górka on 04/06/2023.
//

import SwiftUI

struct NavigationBar: View {
    
    @ObservedObject var system: System
    
    var body: some View {
        GeometryReader{ proxy in
            VStack(spacing: 0){
                
                Spacer()
                HStack{
                    
                    VStack{}
                        .frame(width: proxy.size.width*0.1, height: proxy.size.width*0.1)
                        .padding(.leading, proxy.size.width*0.05)
                    Spacer()
                    
                    Text("Toy Shop")
                        .bold()
                        .font(.title)
                    
                    Spacer()
                    
                    Button {
                        Task{
                            await system.logout()
                        }
                        
                    } label: {
                        ZStack{
                            Circle()
                                .foregroundColor(.red)
                                .frame(width: proxy.size.width*0.1, height: proxy.size.width*0.1)
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                .resizable()
                                .frame(width: proxy.size.width*0.055, height: proxy.size.width*0.055)
                                .foregroundColor(.white)
                                .padding(.leading, proxy.size.width*0.005)
                        }
                    }
                    .frame(width: proxy.size.width*0.1, height: proxy.size.width*0.1)
                    .padding(.trailing, proxy.size.width*0.05)
                    
                    
                }
                .frame(width: proxy.size.width, height: proxy.size.height*0.8)
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
            .background{
                Color.primary.opacity(0.05)
            }
            .ignoresSafeArea()
        }
    }
}

