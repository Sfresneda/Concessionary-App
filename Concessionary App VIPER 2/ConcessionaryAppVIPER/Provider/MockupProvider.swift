//
//  MockupProvider.swift
//  ConcessionaryAppVIPER
//
//  Created by Sergio Fresneda on 1/14/20.
//  Copyright © 2020 fresneda. All rights reserved.
//

import Foundation

typealias Cars = Array<Car>

class MockupProvider {
    private let mockupData: Dictionary<String, Double> = Dictionary(
        dictionaryLiteral:
        ("V60", 30000),
        ("V90", 55000),
        ("XC40", 40000),
        ("XC60", 50000),
        ("XC90", 70000),
        ("V40", 26000)
    )

    func getCars(brand: BrandEnum, success: ((Cars) -> Void), failure: ((Error) -> Void)) {
        success(bindModels(carsData: self.mockupData, brand: brand))
    }
    
    private func bindModels(carsData: Dictionary<String, Double>, brand: BrandEnum) -> Array<Car> {
        return carsData.map{
            Car.init(
                _name: $0.key,
                _price: $0.value,
                _imageNames: Array.init(
                    arrayLiteral: $0.key.lowercased()),
                _brand: brand
            )
        }
    }

}
