//
//  CatalogDetailModel.swift
//  ConcessionaryAppMVC
//
//  Created by fresneda on 1/20/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import UIKit

class CatalogDetailModel: BaseViewModel, CatalogDetailViewModel {
    
    // MARK: - ViewModel Protocol
    var carBrand: BrandEnum?
    var carDetailData: Car?
    
    func isReachable() -> Bool {
        return self.carDetailData != nil
    }
    
    func carName() -> String {
        guard let carData = self.carDetailData else { return "" }
        return carData.name
    }
    
    func carPrice() -> String {
        guard let carData = self.carDetailData else { return "" }
        return "\(carData.price.formatWithTwoDecimals)€"
    }
    
    func carImage() -> UIImage {
        guard let carData = self.carDetailData, let image = carData.images.first else { return UIImage() }
        return image!
    }
    
    func brandName() -> String {
        return self.carBrand != nil ? self.carBrand!.rawValue : ""
    }
    
    func getNonValueString() -> String {
        return "Data no available"
    }
    
    // MARK: - Getters Setters
    var car: Car? {
        get {
            return self.carDetailData
        }
        set(value) {
            self.carDetailData = value
        }
    }
    var brand: BrandEnum? {
        get {
            return self.carBrand
        }
        set(value) {
            self.carBrand = value
        }
    }    
}
