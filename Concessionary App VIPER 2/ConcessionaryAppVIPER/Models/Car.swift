//
//  Car.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation
import UIKit

class Car {
    var name: String
    var price: Double
    var imageNames: Array<String>
    var brand: BrandEnum
    
    init(_name: String, _price: Double, _imageNames: Array<String>, _brand: BrandEnum) {
        self.name = _name
        self.price = _price
        self.imageNames = _imageNames
        self.brand = _brand
    }
    
    func description() {
        print("""
            Model: \(self.name)
            Price: \(self.price.formatWithoutDecimals)€
            Images: \(self.imageNames.count)
            Brand: \(self.brand)
            """)
    }
}

extension Car: Hashable {
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.name == rhs.name && lhs.brand == rhs.brand
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(brand)
    }
}
