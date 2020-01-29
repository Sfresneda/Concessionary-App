//
//  CatalogListInteractorMock.swift
//  ConcessionaryAppVIPERUITests
//
//  Created by Sergio Fresneda on 1/29/20.
//  Copyright © 2020 fresneda. All rights reserved.
//

import Foundation

@testable import ConcessionaryAppVIPER

class CatalogListInteractorMock: CatalogListInteractorContract {
    var presenter: CatalogListPresenterContract?
    lazy var mockupProvider: MockupProvider = MockupProvider.init()
    
    var isCalledGetCatalogListRequest: Bool = false
    
    func getCatalogListRequest(brand: BrandEnum, success: ((Cars) -> Void), failure: ((Error) -> Void)) {
        self.isCalledGetCatalogListRequest = true
        self.mockupProvider.getCars(brand: brand, success: success, failure: failure)
    }
}
