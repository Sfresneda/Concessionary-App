//
//  CarBrand.swift
//  ConcessionaryAppMVVM
//
//  Created by Sergio Fresneda on 18/11/23.
//

import Foundation

enum CarBrand: String, Decodable {
    case audi = "Audi"
    case mercedes = "Mercedes"
    case volvo = "Volvo"
}

extension CarBrand: CaseIterable{}
