//
//  CatalogDetailViewModel.swift
//  ConcessionaryAppMVC
//
//  Created by fresneda on 1/20/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import UIKit

class CatalogDetailViewModel: BaseViewModel {
    
    // MARK: - Vars
    private var carBrand: BrandEnum?
    private var carDetailData: Car?
    
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
    
    var emptyText: String {
        return "Data no available"
    }
    var isReachableCarData: Bool {
        return self.carDetailData != nil
    }
    var carName: String {
        get {
            guard let carData = self.carDetailData else { return "" }
            return carData.name
        }
    }
    
    var carPrice: String {
        get {
            guard let carData = self.carDetailData else { return "" }
            return "\(carData.price.formatWithTwoDecimals)€"
        }
    }
    
    var carImage: UIImage {
        get {
            guard let carData = self.carDetailData, let image = carData.images.first else { return UIImage() }
            return image!
        }
    }
    
    var brandName: String {
        return self.carBrand != nil ? self.carBrand!.rawValue : ""
    }
}
