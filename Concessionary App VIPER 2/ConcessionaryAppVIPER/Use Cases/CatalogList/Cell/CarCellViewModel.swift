//
//  CarCellViewModel.swift
//  ConcessionaryAppVIPER
//
//  Created by Sergio Fresneda on 1/14/20.
//  Copyright © 2020 fresneda. All rights reserved.
//

import Foundation

class CarCellViewModel {
    
    let brand: String
    let carName: String
    let carPrice: String
    let carImage: String
    
    init(car: Car) {
        self.brand = car.brand.rawValue
        self.carName = car.name
        self.carPrice = car.price.formatWithoutDecimals
        
        self.carImage = car.imageNames.first ?? "placeholder"
    }
    
}
