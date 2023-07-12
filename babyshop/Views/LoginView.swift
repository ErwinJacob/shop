//
//  LoginView.swift
//  babyshop
//
//  Created by Jakub Górka on 04/06/2023.
//

import SwiftUI

struct LoginView: View {
    @State var isLoginActive: Bool = true
    @State var isRegisterActive: Bool = false
    @State private var showErrorAlert = false
    @ObservedObject var system: System

    @State private var passwordRepeat = ""
    
    var body: some View {
        GeometryReader{ proxy in
            
            VStack{
                Spacer()
                HStack(){
                    Spacer()
                    VStack(alignment: .center){
                        
                        
                        HStack(){
                            Button {
                                isLoginActive = true
                                isRegisterActive = false
                            } label: {
                                if isLoginActive{
                                    LoginLabel(text: "Login", textColor: Color(red: 239/265, green: 87/265, blue: 124/265))
                                }
                                else{
                                    LoginLabel(text: "Login", textColor: Color(UIColor.label))
                                }
                            }
                            .padding(.trailing, 15)
                            
                            Button {
                                isLoginActive = false
                                isRegisterActive = true
                            } label: {
                                if isRegisterActive{
                                    LoginLabel(text: "Register", textColor: Color(red: 239/265, green: 87/265, blue: 124/265))
                                }
                                else{
                                    LoginLabel(text: "Register", textColor: Color(UIColor.label))
                                }
                            }
                            .padding(.leading, 15)
                            
                        }
                        .padding(.top, proxy.size.height*0.05)
                        
                        
                        Spacer()
                        
                        ZStack{
                            if isLoginActive{
                                VStack(spacing: 15){
                                    //                                        Text("Zaloguj się :)")
                                    TextField("email", text: $system.email)
                                        .frame(width: proxy.size.width*0.65, height: 30)
                                        .textFieldStyle(.roundedBorder)
                                    SecureField("haslo", text: $system.password)
                                        .frame(width: proxy.size.width*0.65, height: 30)
                                        .textFieldStyle(.roundedBorder)
                                    VStack{
                                    }
                                    .frame(width: proxy.size.width*0.65, height: 30)
                                }
                            }
                            else{
                                VStack(spacing: 15){
                                    //                                        Text("Zarejestruj się :)")
                                    TextField("email", text: $system.email)
                                        .frame(width: proxy.size.width*0.65, height: 30)
                                        .textFieldStyle(.roundedBorder)
                                    SecureField("haslo", text: $system.password)
                                        .frame(width: proxy.size.width*0.65, height: 30)
                                        .textFieldStyle(.roundedBorder)
                                    SecureField("powtórz hasło", text: $passwordRepeat)
                                        .frame(width: proxy.size.width*0.65, height: 30)
                                        .textFieldStyle(.roundedBorder)
                                    
                                }
                            }
                        }
                        .frame(width: proxy.size.width*0.85, height: proxy.size.width*0.65)
                        
                        Spacer()
                        
                        Button {
                            //login
                            if isLoginActive{
                                //login handling
                                Task{
                                    let isgood = await system.login()
                                    if isgood{
//                                            view.changeView(newView: Views.flowersView)
                                        
                                    }
                                    else{
                                        showErrorAlert = true
                                    }
                                }
                            }
                            else{
                                //register handling
                                Task{
                                    let isgood = await system.register(confirmPassword: passwordRepeat)
                                    if isgood{
//                                            view.changeView(newView: Views.flowersView)
                                    }
                                    else{
                                        showErrorAlert = true
                                    }
                                }
                            }
                            
                            
                            
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: proxy.size.width*0.30, height: proxy.size.width*0.1)
                                    .foregroundColor(.green)
                                Text(">")
                                    .foregroundColor(.white)
                                    .bold()
                                //                                        .font(.title)
                            }
                        }
                        .padding(.bottom, proxy.size.height*0.05)
                        .alert("Błąd", isPresented: $showErrorAlert) {
                            Button("OK", role: .cancel) { }
                        } message: {
                            Text("Error: {error msg}")
                        }
                        
                        
                    }
                    
                    Spacer()
                }
                Spacer()
            }
            .background(
                Image("toy-shop-logo-no-background")
//                    .resizable()
            )
            .onAppear{
                Task{
                    if system.isLogged{
                        let isgood = await system.login()
                        if isgood{
//                                view.changeView(newView: Views.flowersView)
                        }
                    }
                }
            }
            
        }
    }
}

struct LoginLabel: View {
    
    @State var text: String
    @State var textColor: Color
    
    var body: some View {
        Text(text)
            .bold()
            .font(.largeTitle)
            .foregroundColor(textColor)
    }
}
