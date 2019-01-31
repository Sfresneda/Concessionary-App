//
//  BrandEnum.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation

enum BrandEnum: String {
    case audi = "Audi"
    case mercedes = "Mercedes"
    case volvo = "Volvo"
    case none = ""
}

extension BrandEnum: CaseIterable{}
