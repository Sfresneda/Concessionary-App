//
//  Car.swift
//  CocessionaryAppSegues_1
//
//  Created by fresneda on 1/14/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation

class Car {
    var name: String
    var price: Double
    
    init(_name: String, _price: Double) {
        self.name = _name
        self.price = _price
    }
    
    func description() {
        print("Model \(self.name), price: \(self.price)€")
    }
}
