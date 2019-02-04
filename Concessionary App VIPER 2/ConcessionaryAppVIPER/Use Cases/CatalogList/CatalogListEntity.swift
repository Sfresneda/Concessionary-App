//
//  CatalogListEntity.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation

struct CatalogListEntity {
    var catalog: Array<Car> = Array()
    var sortOrder: SortOrder = SortOrder.desc
    var brand: BrandEnum?
    
    let mockupData: Dictionary<String, Double> = Dictionary(
        dictionaryLiteral:
        ("V60", 30000),
        ("V90", 55000),
        ("XC40", 40000),
        ("XC60", 50000),
        ("XC90", 70000),
        ("V40", 26000)
    )
}
