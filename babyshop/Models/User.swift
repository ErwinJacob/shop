//
//  User.swift
//  babyshop
//
//  Created by Jakub Górka on 04/06/2023.
//

import Foundation

class User: ObservableObject{
    
    let UserID: String
    let email: String
    let name: String
    let surname: String
    let adress: String
    @Published var cart: [CartProduct]
    @Published var orders: [Order]
    
    init(UserID: String, email: String, name: String, surname: String, adress: String, cart: [CartProduct], orders: [Order]) {
        self.UserID = UserID
        self.email = email
        self.name = name
        self.surname = surname
        self.adress = adress
        self.cart = cart
        self.orders = orders
    }
    
    func getItemsAmountInCart() -> Int{
        
        var sum: Int = 0
        
        self.cart.forEach { product in
            sum += product.quantity
        }
        
        return sum
    }
    
    func getCartPrice() -> Float{
        var sum: Float = 0.0
        
        self.cart.forEach { product in
            sum += product.price*Float(product.quantity)
        }
        
        return sum
    }
    
    @MainActor
    func addToCart(item: CartProduct) async -> Bool{
        
        var alreadyInCart = false
        
        self.cart.forEach { product in
            if product.id == item.id{
                product.quantity += item.quantity
                alreadyInCart = true
            }
        }
        
        if alreadyInCart { return true } else {
            self.cart.append(item)
            return true
        }
    }
}
