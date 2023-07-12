//////
//////  Product.swift
////
////  Product.swift
////  babyshop
////
////  Created by Jakub Górka on 30/05/2023.
////
//
//import Foundation
//import UIKit
//
//class Product: Hashable, Decodable{
//    static func == (lhs: Product, rhs: Product) -> Bool {
//        if lhs.id == rhs.id {return true}
//        else{return false}
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(self.id)
//    }
//
//    let id: Int
//    let name: String
//    let description: String
//    let price: Float
//    let stock: Int
//    let pictures: [DataImage]
//
//    struct DataImage: Codable, Hashable{
//        let imageData: Data?
//
//        init(withImage image: UIImage) {
//            self.imageData = image.jpegData(compressionQuality: 1.0)
//        }
//
//        func getImage() -> UIImage? {
//            guard let imageData = self.imageData else {
//                return nil
//            }
//            let image = UIImage(data: imageData)
//
//            return image
//        }
//    }
//
//    init(id: Int, name: String, description: String, price: Float, stock: Int, pictures: [DataImage]) {
//        self.id = id
//        self.name = name
//        self.description = description
//        self.price = price
//        self.stock = stock
//        self.pictures = pictures
//    }
//}




import Foundation
import UIKit

class Product: Hashable{
    static func == (lhs: Product, rhs: Product) -> Bool {
        if lhs.id == rhs.id {return true}
        else{return false}
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }

    let id: String
    let name: String
    let description: String
    let price: Float
    let stock: Int
    let pictures: [UIImage]

    init(id: String, name: String, description: String, price: Float, stock: Int, pictures: [UIImage]) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.stock = stock
        self.pictures = pictures
    }
}
