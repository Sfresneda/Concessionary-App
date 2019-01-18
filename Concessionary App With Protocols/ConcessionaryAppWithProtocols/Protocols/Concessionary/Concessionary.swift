//
//  Concessionary.swift
//  ConcessionaryAppWithCoordinator
//
//  Created by fresneda on 1/17/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation

enum brandEnum: String {
    case audi = "Audi"
    case mercedes = "Mercedes"
    case volvo = "Volvo"
    case none = ""
}

enum sortOrder: String {
    case asc = "Asc"
    case desc = "Desc"
}

protocol Concessionary {
    var brand: brandEnum! {get set}
    var catalog: Array<Car>! {get set}
    
    func setCar(_cars: Array<Car>)
    func showCatalog()
    func fillCatalog(_newCar: Car)
    func sortCatalog(order: sortOrder) -> Array<Car>
}
