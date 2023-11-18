//
//  Car.swift
//  ConcessionaryAppMVVM
//
//  Created by Sergio Fresneda on 18/11/23.
//

import Foundation

struct Car: Decodable {
    var name: String
    var price: Double
    var imagesName: Array<String>
    var brand: CarBrand
}
extension Car: Hashable {}
