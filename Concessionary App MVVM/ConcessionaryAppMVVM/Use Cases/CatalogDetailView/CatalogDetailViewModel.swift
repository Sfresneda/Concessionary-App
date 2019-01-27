//
//  CatalogDetailViewModel.swift
//  ConcessionaryAppMVVM
//
//  Created by fresneda on 1/27/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import UIKit

protocol CatalogDetailViewModel {
    var carBrand: BrandEnum? { get set }
    var carDetailData: Car? { get set }
    
    func isReachable() -> Bool
    func carName() -> String
    func carPrice() -> String
    func carImage() -> UIImage
    func brandName() -> String
    
    func getNonValueString() -> String
}
