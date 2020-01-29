//
//  CatalogListInteractor.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation

class CatalogListInteractor: CatalogListInteractorContract {

    // MARK: - Vars
    weak var presenter: CatalogListPresenterContract?
    lazy var mockupProvider: MockupProvider = MockupProvider.init()

    // MARK: - Contract
    func getCatalogListRequest(brand: BrandEnum, success: ((Cars) -> Void), failure: ((Error) -> Void)) {
        self.mockupProvider.getCars(brand: brand, success: success, failure: failure)
    }
}
