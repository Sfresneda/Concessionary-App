//
//  CatalogListInteractor.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation

class CatalogListInteractor: CatalogListInteractorContract {
   
    // MARK: - Contract Vars
    weak var presenter: CatalogListPresenter?
    
    // MARK: - Contract Methods
    func getCatalogListRequest(cars: Dictionary<String, Double>? = nil, completion: (Array<Car>) -> Void) {
        
        guard let brand = self.presenter?.getBrand() else { return }
        
        let carsData: Dictionary<String, Double> = cars ?? (self.presenter?.viewModel.mockupData)!
        completion(self.bindModels(carsData: carsData, brand: brand))
    }
    
    func bindModels(carsData: Dictionary<String, Double>, brand: BrandEnum) -> Array<Car> {
        var cars: Array<Car> = Array()
        _ = carsData.map{
            cars.append(
                Car.init(
                    _name: $0.key,
                    _price: $0.value,
                    _imageNames: Array.init(
                        arrayLiteral: $0.key.lowercased()),
                    _brand: brand
                )
            )
        }
        return cars
    }
}
