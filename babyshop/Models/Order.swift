//
//  Order.swift
//  babyshop
//
//  Created by Jakub Górka on 04/06/2023.
//

import Foundation

class Order: ObservableObject{
    
    let id: String
    let items: [Product]
    let amount: Float
    @Published var paid: Bool
    //paymentType?
    //complain?
    
    init(id: String, items: [Product], amount: Float, paid: Bool) {
        self.id = id
        self.items = items
        self.amount = amount
        self.paid = paid
    }
}
