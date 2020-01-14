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
}
