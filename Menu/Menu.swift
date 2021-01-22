//
//  Menu.swift
//  Menu
//
//  Created by macbook on 20.01.2021.
//

import Foundation
import UIKit
struct Group {
    var name: String
    var products:[Product]
}
struct Product {
    var name:String
    var price:Float
    var image:UIImage
}

class Menu{
    var groups = [Group]()
    init() {
        self.setup()
    }
    func setup(){
        let p1 = Product(name: "product1", price: 100, image: UIImage(named: "p1")!)
        let p2 = Product(name: "product2", price: 200, image: UIImage(named: "p2")!)
        let p3 = Product(name: "product3", price: 300, image: UIImage(named: "p3")!)
        
        let g1 = Group(name: "Pizza", products: [p1,p2,p3])
        let g2 = Group(name: "Burger", products: [p1,p2,p3])
        let g3 = Group(name: "Sushi",products: [p3,p3,p3])
        let g4 = Group(name: "Asasia", products: [p1,p2,p3])
        let g5 = Group(name: "Sasas", products: [p1,p2,p3])
        let g6 = Group(name: "Usihd",products: [p1,p2,p3])
        //self.products = [p1,p2,p3]
        self.groups = [g1,g2,g3,g4,g5,g6]
    }
}

extension String{
    func widthOfString(usingFont font :UIFont)->CGFloat{
        let fontAttribute = [NSAttributedString.Key.font:font]
        let size = (self as NSString).size(withAttributes: fontAttribute)
        return ceil(size.width)
    }
}
