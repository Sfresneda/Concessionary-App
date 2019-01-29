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
    func getCatalogListRequest() {
        let carsData: Dictionary<String, Double> = Dictionary(
            dictionaryLiteral:
            ("V60", 30000),
            ("V90", 55000),
            ("XC40", 40000),
            ("XC60", 50000),
            ("XC90", 70000),
            ("V40", 26000)
        )
        var cars: Array<Car> = Array()
        _ = carsData.map{
            cars.append(
                Car.init(
                _name: $0.key,
                _price: $0.value,
                _imageNames: Array.init(
                    arrayLiteral: $0.key.lowercased()),
                _brand: BrandEnum.volvo
                )
            )
        }

        self.presenter?.requestData(responseObject: cars)
    }
}
