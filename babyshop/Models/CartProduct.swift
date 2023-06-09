

import Foundation
import UIKit

class CartProduct: Hashable, ObservableObject, Identifiable{
    static func == (lhs: CartProduct, rhs: CartProduct) -> Bool {
        if lhs.cartProductId == rhs.cartProductId {return true}
        else{return false}
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.cartProductId)
    }
    
    let cartProductId: String
    let id: String
    let name: String
    let price: Float
    @Published var quantity: Int
    let picture: UIImage
    
    init(id: String, name: String, price: Float, quantity: Int, picture: UIImage) {
        self.cartProductId = UUID().uuidString
        self.id = id
        self.name = name
        self.price = price
        self.quantity = quantity
        self.picture = picture
    }
    
}
