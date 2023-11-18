//
//  CatalogListModel.swift
//  ConcessionaryAppMVVM
//
//  Created by Sergio Fresneda on 18/11/23.
//

import Foundation

struct CatalogListModel {
    var selectedBrand: CarBrand = .volvo
    var cars: [Car] = []
    var sortMode: SortMode = .asc
}
