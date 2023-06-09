//
//  System.swift
//  babyshop
//
//  Created by Jakub Górka on 04/06/2023.
//

import Foundation
import SwiftUI

class System: ObservableObject{
    
    @Published var user: User?
    @Published var products: [Product] = []
    @AppStorage("email") var email = ""
    @AppStorage("password") var password = ""
    @AppStorage("isLogged") var isLogged: Bool = false

    init(){
        Task{
            await self.fetchData()
        }
    }
    
    @MainActor
    func fetchData() async -> Bool{
        products.append(Product(id: "0001", name: "Harnaś", description: "Piwo Harnaś 0,5l", price: 3.49, stock: 10, pictures: [ UIImage(named: "harnas")!, UIImage(named: "harnas1")!, UIImage(named: "harnas2")! ]))
        products.append(Product(id: "0002", name: "Książęce", description: "Piwo Książęce pszeniczne 0,5l\nmmm pyszne piwko", price: 5.49, stock: 40, pictures: [ UIImage(named: "ksiazece")! ]))
        products.append(Product(id: "0003", name: "Lech", description: "Piwo Lech z Leszna 0,5l\nmmm pyszne piwko", price: 2.49, stock: 100, pictures: [ UIImage(named: "lech")! ]))
        products.append(Product(id: "0004", name: "Blanc", description: "Piwo Kronenburg Blanc białe pszeniczne 0,33l\nmmm pyszne piwko\nnapój bogów", price: 5.49, stock: 40, pictures: [ UIImage(named: "blanc")! ]))
        
        products.append(Product(id: "0001", name: "Harnaś", description: "Piwo Harnaś 0,5l", price: 3.49, stock: 10, pictures: [ UIImage(named: "harnas")!, UIImage(named: "harnas1")!, UIImage(named: "harnas2")! ]))
        products.append(Product(id: "0002", name: "Książęce", description: "Piwo Książęce pszeniczne 0,5l\nmmm pyszne piwko", price: 5.49, stock: 40, pictures: [ UIImage(named: "ksiazece")! ]))
        products.append(Product(id: "0003", name: "Lech", description: "Piwo Lech z Leszna 0,5l\nmmm pyszne piwko", price: 2.49, stock: 100, pictures: [ UIImage(named: "lech")! ]))
        products.append(Product(id: "0004", name: "Blanc", description: "Piwo Kronenburg Blanc białe pszeniczne 0,33l\nmmm pyszne piwko\nnapój bogów", price: 5.49, stock: 40, pictures: [ UIImage(named: "blanc")! ]))
        
        products.append(Product(id: "0001", name: "Harnaś", description: "Piwo Harnaś 0,5l", price: 3.49, stock: 10, pictures: [ UIImage(named: "harnas")!, UIImage(named: "harnas1")!, UIImage(named: "harnas2")! ]))
        products.append(Product(id: "0002", name: "Książęce", description: "Piwo Książęce pszeniczne 0,5l\nmmm pyszne piwko", price: 5.49, stock: 40, pictures: [ UIImage(named: "ksiazece")! ]))
        products.append(Product(id: "0003", name: "Lech", description: "Piwo Lech z Leszna 0,5l\nmmm pyszne piwko", price: 2.49, stock: 100, pictures: [ UIImage(named: "lech")! ]))
        products.append(Product(id: "0004", name: "Blanc", description: "Piwo Kronenburg Blanc białe pszeniczne 0,33l\nmmm pyszne piwko\nnapój bogów", price: 5.49, stock: 40, pictures: [ UIImage(named: "blanc")! ]))
        
        return true
    }
    
    @MainActor
    func login() async -> Bool{
        
        self.user = User(UserID: "100001",
                         email: "email@email.pl",
                         name: "name",
                         surname: "surname",
                         adress: "adress",
                         cart: [],
                         orders: []
        )
        self.isLogged = true
        return true
    }
    
    @MainActor
    func register(confirmPassword: String) async -> Bool{
        
        self.user = User(UserID: "100001",
                         email: "email@email.pl",
                         name: "name",
                         surname: "surname",
                         adress: "adress",
                         cart: [],
                         orders: []
        )
        self.isLogged = true
        
        return true
    }
    
    @MainActor
    func logout() async -> Bool{
        
        self.isLogged = false
        self.user = nil

        return true
    }
}
