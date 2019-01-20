//
//  Concessionary.swift
//  ConcessionaryAppWithCoordinator
//
//  Created by fresneda on 1/17/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation

enum BrandEnum: String {
    case audi = "Audi"
    case mercedes = "Mercedes"
    case volvo = "Volvo"
    case none = ""
}

enum sortOrder: String {
    case asc = "Ascendent"
    case desc = "Descendent"
}

protocol Concessionary {
    var brand: BrandEnum! {get set}
    var catalog: Array<Car>! {get set}
    
    func setCar(_cars: Array<Car>)
    func fillCatalog(_newCar: Car)
    func sortCatalog(order: sortOrder) -> Array<Car>
}
