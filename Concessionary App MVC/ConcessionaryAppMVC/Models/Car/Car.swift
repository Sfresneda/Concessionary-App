//
//  Car.swift
//  ConcessionaryAppWithCoordinator
//
//  Created by fresneda on 1/17/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import UIKit

class Car {
    var name: String
    var price: Double
    var images: Array<UIImage?>
    
    init(_name: String, _price: Double, _images: Array<UIImage?>) {
        self.name = _name
        self.price = _price
        self.images = _images
    }
    
    func description() {
        print("Model \(self.name), price: \(self.price)€")
    }
}
